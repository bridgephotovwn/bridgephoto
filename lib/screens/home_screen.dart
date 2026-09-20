import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';
import '../prefs.dart';
import '../search_index.dart';
import '../store.dart';
import 'contact_screen.dart';
import 'document_screen.dart';
import 'shape_capture_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Doc>? _docs;
  /// The folder being looked at. Empty is the top level.
  String _folder = '';
  final List<String> _selected = []; // ids, in tap order (= merge order)
  bool _searching = false;
  String _query = '';
  String? _busy;

  @override
  void initState() {
    super.initState();
    Engine.onPendingScan = _recoverScan;
    SearchIndex.version.addListener(_onIndexChanged);
    _reload().then((_) => _checkPendingScan()).then((_) => _offerCrashReport());
  }

  @override
  void dispose() {
    if (Engine.onPendingScan == _recoverScan) Engine.onPendingScan = null;
    if (Engine.onScanState == _onScanState) Engine.onScanState = null;
    SearchIndex.version.removeListener(_onIndexChanged);
    super.dispose();
  }

  void _onIndexChanged() {
    if (mounted) setState(() {});
  }

  /// After a crash, offer the private report. Nothing is sent unless shared.
  Future<void> _offerCrashReport() async {
    final report = await Engine.takeCrashLog();
    if (report == null || report.trim().isEmpty || !mounted) return;
    final l = context.l10n;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.crashTitle),
        content: Text(l.crashBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.dismiss)),
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: report));
              Navigator.pop(ctx);
              context.snack(l.reportCopied);
            },
            child: Text(l.copy),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.share),
            label: Text(l.share),
            onPressed: () {
              Navigator.pop(ctx);
              Exporter.shareText(context, report, subject: l.crashReportSubject);
            },
          ),
        ],
      ),
    );
  }

  /// Feedback while Play services prepares the scanner (slow on first use).
  void _onScanState(String s) {
    if (!mounted) return;
    if (s == 'preparing') {
      _setBusy(context.l10n.preparingScanner);
    } else {
      _setBusy(null);
    }
  }

  Future<void> _reload() async {
    final docs = await DocStore.list();
    await SearchIndex.load(docs);
    if (!mounted) return;
    setState(() {
      _docs = docs;
      _selected.removeWhere((id) => !docs.any((d) => d.id == id));
    });
    // Recognise any page that has no text yet, so search covers every word.
    SearchIndex.indexAll(docs);
  }

  void _setBusy(String? msg) {
    if (mounted) setState(() => _busy = msg);
  }

  Future<void> _open(Doc d) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => DocumentScreen(id: d.id)));
    _reload();
  }

  static String _msg(Object e) {
    if (e is PlatformException) return e.message ?? e.code;
    return e.toString().replaceFirst('Exception: ', '');
  }

  // ---- scanning

  Future<void> _scan() async {
    List<String> paths;
    Engine.onScanState = _onScanState;
    try {
      paths = await Engine.scan(
        mode: Prefs.scannerMode,
        gallery: Prefs.galleryImport,
        pageLimit: Prefs.pageLimit,
      );
    } on PlatformException catch (e) {
      Engine.logError('scan failed: ${e.code}: ${e.message}\n${e.details ?? ''}');
      if (mounted) context.snack(e.message ?? context.l10n.scannerUnavailable);
      return;
    } catch (e) {
      Engine.logError('scan failed: $e');
      if (mounted) context.snack(context.l10n.scannerUnavailableWith(_msg(e)));
      return;
    } finally {
      if (Engine.onScanState == _onScanState) Engine.onScanState = null;
      _setBusy(null);
    }
    if (paths.isEmpty) return;
    await _saveNewDocument(paths);
  }

  /// Business card: one page, then straight to the contact form.
  Future<void> _scanCard() async {
    final l = context.l10n;
    List<String> paths;
    Engine.onScanState = _onScanState;
    try {
      paths = await Engine.scan(mode: Prefs.scannerMode, gallery: Prefs.galleryImport, pageLimit: 1);
    } on PlatformException catch (e) {
      Engine.logError('card scan failed: ${e.code}: ${e.message}');
      if (mounted) context.snack(e.message ?? l.scannerUnavailable);
      return;
    } catch (e) {
      if (mounted) context.snack(l.scannerUnavailableWith(_msg(e)));
      return;
    } finally {
      if (Engine.onScanState == _onScanState) Engine.onScanState = null;
      _setBusy(null);
    }
    if (paths.isEmpty) return;
    _setBusy(l.savingPages);
    try {
      final d = await DocStore.create(l.cardDefaultName(DocStore.stamp()));
      await DocStore.addPageFile(d, paths.first, move: true);
      await DocStore.save(d);
      _setBusy(null);
      if (!mounted) return;
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ContactScreen(doc: d, page: d.pages.first, nameDocument: true)));
      await _reload();
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePages(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  /// Android only: pages that arrived while the app was not waiting for them.
  Future<void> _checkPendingScan() async {
    if (!Engine.isAndroid) return;
    final paths = await Engine.takePendingScan();
    if (paths.isNotEmpty) _recoverScan(paths);
  }

  void _recoverScan(List<String> paths) {
    if (!mounted) return;
    _saveNewDocument(paths);
  }

  /// Four photographs with the torch in a different place each time, turned
  /// into either the SHAPE of the page or a copy with the glare taken off.
  Future<void> _shapeCapture(ShapeMode mode) async {
    final path = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => ShapeCaptureScreen(mode: mode)),
    );
    if (path == null || !mounted) return;
    await _saveNewDocument([path]);
  }

  Future<void> _saveNewDocument(List<String> paths) async {
    final l = context.l10n;
    _setBusy(l.savingPages);
    try {
      final d = await DocStore.create(l.scanDefaultName(DocStore.stamp()));
      for (final p in paths) {
        await DocStore.addPageFile(d, p, move: true);
      }
      await DocStore.save(d);
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePages(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  // ---- PDF tools

  Future<void> _importPdf() async {
    final l = context.l10n;
    FilePickerResult? r;
    try {
      r = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: const ['pdf']);
    } catch (e) {
      if (mounted) context.snack(l.couldNotOpenPicker(_msg(e)));
      return;
    }
    final file = r?.files.firstOrNull;
    final path = file?.path;
    if (file == null || path == null) return;
    _setBusy(l.importingPdf);
    try {
      var name = file.name;
      if (name.toLowerCase().endsWith('.pdf')) {
        name = name.substring(0, name.length - 4);
      }
      final d = await Exporter.importPdf(path, name.trim().isEmpty ? l.importedPdf : name.trim());
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack(l.couldNotImport(_msg(e)));
    } finally {
      _setBusy(null);
      try {
        await FilePicker.platform.clearTemporaryFiles();
      } catch (_) {}
    }
  }

  /// Looks at a PDF somebody else sent.
  ///
  /// Every other tool in this app works on the user's own scans. This one
  /// looks at a file that arrived from somebody else, which is where the
  /// damage usually comes from — a contract with a clause changed, a
  /// statement with a figure retyped, or, most often of all, a document
  /// blacked out by drawing a rectangle over text that is still there.
  Future<void> _checkPdf() async {
    final l = context.l10n;
    FilePickerResult? r;
    try {
      r = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: const ['pdf']);
    } catch (e) {
      if (mounted) context.snack(l.couldNotOpenPicker(_msg(e)));
      return;
    }
    final path = r?.files.firstOrNull?.path;
    if (path == null || !mounted) return;
    _setBusy(l.checkPdfTitle);
    List<Map<String, dynamic>> findings;
    try {
      findings = await Engine.checkPdf(path);
    } catch (e) {
      _setBusy(null);
      if (mounted) context.snack(_msg(e));
      return;
    }
    _setBusy(null);
    if (!mounted) return;
    final lines = <String>[];
    for (final f in findings) {
      final page = (f['page'] as num?)?.toInt() ?? 0;
      final detail = (f['detail'] as String?) ?? '';
      switch (f['kind']) {
        case 'readableUnderBox':
          lines.add('${l.checkPdfBox(page)}\n    $detail');
        case 'fontMix':
          lines.add('${l.checkPdfFonts(page)}\n    $detail');
        case 'revisions':
          lines.add('${l.checkPdfRevisions}\n    $detail');
        case 'madeBy':
          lines.add('${l.checkPdfMadeBy}: $detail');
      }
    }
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.checkPdfTitle),
        content: SingleChildScrollView(
          child: lines.isEmpty
              ? Text(l.checkPdfNothing)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l.checkPdfIntro,
                        style: Theme.of(ctx).textTheme.bodySmall),
                    const SizedBox(height: 12),
                    for (final t in lines)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(t),
                      ),
                  ],
                ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.close)),
        ],
      ),
    );
  }

  Future<void> _mergePdfFiles() async {
    final l = context.l10n;
    FilePickerResult? r;
    try {
      r = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: const ['pdf'],
          allowMultiple: true);
    } catch (e) {
      if (mounted) context.snack(l.couldNotOpenPicker(_msg(e)));
      return;
    }
    final paths = r?.files.map((f) => f.path).whereType<String>().toList() ?? [];
    if (paths.isEmpty || !mounted) return;
    if (paths.length < 2) {
      context.snack(l.pickTwoPdfs);
      return;
    }
    _setBusy(l.mergingPdfs(paths.length));
    try {
      await Exporter.cleanShareDir();
      final f = await Exporter.mergePdfFiles(paths, l.mergedFileName(DocStore.stamp()));
      _setBusy(null);
      if (!mounted) return;
      await _offerFile(f, 'application/pdf', 'pdf');
    } catch (e) {
      if (mounted) context.snack(l.couldNotMerge(_msg(e)));
    } finally {
      _setBusy(null);
      try {
        await FilePicker.platform.clearTemporaryFiles();
      } catch (_) {}
    }
  }

  /// Share or save a finished file.
  Future<void> _offerFile(File f, String mime, String ext) async {
    final l = context.l10n;
    final name = f.uri.pathSegments.last;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(title: Text(name, style: Theme.of(ctx).textTheme.titleMedium)),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text(l.share),
            onTap: () {
              Navigator.pop(ctx);
              Exporter.shareFile(context, f, mime, subject: name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: Text(l.saveToFolder),
            onTap: () async {
              Navigator.pop(ctx);
              try {
                final p = await Exporter.saveBytes(name, await f.readAsBytes(),
                    ext: ext, title: l.saveDialogTitle);
                if (p != null && mounted) context.snack(l.saved);
              } catch (e) {
                if (mounted) context.snack(l.couldNotSave(_msg(e)));
              }
            },
          ),
        ]),
      ),
    );
  }

  // ---- selection actions

  List<Doc> get _selectedDocs =>
      _selected.map((id) => _docs!.firstWhere((d) => d.id == id)).toList();

  Future<void> _mergeSelected() async {
    final l = context.l10n;
    final docs = _selectedDocs;
    final name = await _askName(context, l.mergedDocument,
        l.mergedDefaultName(docs.first.name, docs.length - 1));
    if (name == null) return;
    _setBusy(l.merging);
    try {
      final d = await DocStore.merge(name, docs);
      _selected.clear();
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack(l.couldNotMerge(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _deleteSelected() async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.deleteDocumentsQuestion(_selected.length)),
        content: Text(l.cannotBeUndone),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.delete)),
        ],
      ),
    );
    if (ok != true) return;
    for (final d in _selectedDocs) {
      await DocStore.delete(d);
    }
    _selected.clear();
    await _reload();
  }

  Future<void> _shareSelected() async {
    final l = context.l10n;
    final docs = _selectedDocs;
    _setBusy(l.buildingPdf);
    try {
      await Exporter.cleanShareDir();
      final files = <File>[];
      final used = <String>{};
      for (var i = 0; i < docs.length; i++) {
        final d = docs[i];
        final base = DocStore.safeName(d.name);
        var name = '$base.pdf';
        for (var k = 2; !used.add(name); k++) {
          name = '$base ($k).pdf';
        }
        _setBusy(l.buildingPdfN(i + 1, docs.length));
        files.add(await Exporter.pdfFile(d, fileName: name));
      }
      _setBusy(null);
      if (!mounted) return;
      if (files.length == 1) {
        await Exporter.shareFile(context, files.first, 'application/pdf', subject: docs.first.name);
      } else {
        await Exporter.shareFiles(context, files, 'application/pdf');
      }
    } catch (e) {
      if (mounted) context.snack(l.couldNotBuildPdf(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  // ---- UI

  /// Folders that exist, which is simply the folders documents are in.
  /// Nothing to create, nothing to tidy up: the last document to leave takes
  /// the folder with it.
  List<String> get _folders {
    final set = {for (final d in _docs ?? const <Doc>[]) d.folder}
      ..removeWhere((f) => f.isEmpty);
    final list = set.toList()..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }

  List<Doc> get _visible {
    final docs = _docs ?? const [];
    // Searching looks EVERYWHERE. Having to remember which folder you filed
    // something in is the thing search is supposed to spare you.
    if (_query.trim().isNotEmpty) {
      return docs.where((d) => SearchIndex.matches(d, _query)).toList();
    }
    return docs.where((d) => d.folder == _folder).toList();
  }

  /// Moves the picked documents into a folder — an existing one, a new one,
  /// or back out to the top level.
  Future<void> _moveToFolder() async {
    final l = context.l10n;
    final picked = _selectedDocs;
    if (picked.isEmpty) return;
    final c = TextEditingController();
    final existing = _folders;
    final target = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.moveToFolder),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: c,
            autofocus: existing.isEmpty,
            decoration: InputDecoration(
                labelText: l.folderName, border: const OutlineInputBorder()),
          ),
          if (existing.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                for (final f in existing)
                  ActionChip(label: Text(f), onPressed: () => Navigator.pop(ctx, f)),
              ],
            ),
          ],
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              icon: const Icon(Icons.north_west),
              label: Text(l.moveToTop),
              onPressed: () => Navigator.pop(ctx, ''),
            ),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, c.text.trim()), child: Text(l.ok)),
        ],
      ),
    );
    if (target == null || !mounted) return;
    for (final d in picked) {
      d.folder = target;
      await DocStore.save(d);
    }
    setState(() {
      _selected.clear();
      // Follow the documents, so the move is visible rather than a vanishing.
      _folder = target;
    });
    if (mounted) {
      context.snack(target.isEmpty
          ? l.movedToTop(picked.length)
          : l.movedToFolder(picked.length, target));
    }
  }

  void _toggle(Doc d) {
    setState(() {
      if (_selected.contains(d.id)) {
        _selected.remove(d.id);
      } else {
        _selected.add(d.id);
      }
    });
  }

  /// The row of folders above the documents: which folder you are in, or the
  /// folders you could go into. Hidden entirely when there are none, so
  /// anybody who never files anything never sees it.
  Widget _folderStrip(AppLocalizations l) {
    final cs = Theme.of(context).colorScheme;
    if (_folder.isNotEmpty) {
      return ListTile(
        dense: true,
        leading: const Icon(Icons.arrow_back),
        title: Text(_folder, style: const TextStyle(fontWeight: FontWeight.w600)),
        onTap: () => setState(() => _folder = ''),
      );
    }
    final folders = _folders;
    if (folders.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          for (final f in folders)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ActionChip(
                avatar: Icon(Icons.folder_outlined, size: 18, color: cs.primary),
                label: Text(f),
                onPressed: () => setState(() => _folder = f),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final selecting = _selected.isNotEmpty;
    final docs = _visible;
    return PopScope(
      canPop: !selecting && !_searching && _folder.isEmpty,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        setState(() {
          if (selecting) {
            _selected.clear();
          } else if (_folder.isNotEmpty && !_searching) {
            _folder = ''; // out of the folder before out of the app
          } else {
            _searching = false;
            _query = '';
          }
        });
      },
      child: Scaffold(
        appBar: selecting ? _selectionBar(l) : _normalBar(l),
        body: Stack(children: [
          if (_docs == null)
            const Center(child: CircularProgressIndicator())
          else
            Column(children: [
              if (_query.trim().isEmpty) _folderStrip(l),
              Expanded(child: docs.isEmpty ? _empty(l) : _grid(docs)),
            ]),
          if (_busy != null) _busyOverlay(_busy!),
        ]),
        floatingActionButton: selecting || _busy != null
            ? null
            : FloatingActionButton.extended(
                onPressed: _scan,
                icon: const Icon(Icons.document_scanner),
                label: Text(l.scan),
              ),
      ),
    );
  }

  AppBar _normalBar(AppLocalizations l) {
    return AppBar(
      title: _searching
          ? TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: l.searchDocuments, border: InputBorder.none),
              onChanged: (v) => setState(() => _query = v),
            )
          : Text(l.appName),
      actions: [
        IconButton(
          tooltip: _searching ? l.closeSearch : l.search,
          icon: Icon(_searching ? Icons.close : Icons.search),
          onPressed: () => setState(() {
            _searching = !_searching;
            _query = '';
          }),
        ),
        PopupMenuButton<String>(
          onSelected: (v) {
            switch (v) {
              case 'card':
                _scanCard();
              case 'import':
                _importPdf();
              case 'mergepdf':
                _mergePdfFiles();
              case 'checkpdf':
                _checkPdf();
              case 'relief':
                _shapeCapture(ShapeMode.relief);
              case 'deglare':
                _shapeCapture(ShapeMode.glare);
              case 'settings':
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SettingsScreen()))
                    .then((_) => setState(() {}));
            }
          },
          itemBuilder: (_) => [
            PopupMenuItem(value: 'card', child: ListTile(leading: const Icon(Icons.contact_page_outlined), title: Text(l.scanBusinessCard))),
            PopupMenuItem(value: 'import', child: ListTile(leading: const Icon(Icons.picture_as_pdf), title: Text(l.importPdfAsPages))),
            PopupMenuItem(value: 'mergepdf', child: ListTile(leading: const Icon(Icons.merge), title: Text(l.mergePdfFiles))),
            PopupMenuItem(value: 'checkpdf', child: ListTile(leading: const Icon(Icons.policy_outlined), title: Text(l.checkPdfTitle))),
            if (Engine.isAndroid) const PopupMenuDivider(),
            if (Engine.isAndroid)
              PopupMenuItem(value: 'relief', child: ListTile(leading: const Icon(Icons.deblur), title: Text(l.shapeReliefTitle))),
            if (Engine.isAndroid)
              PopupMenuItem(value: 'deglare', child: ListTile(leading: const Icon(Icons.wb_iridescent), title: Text(l.shapeGlareTitle))),
            const PopupMenuDivider(),
            PopupMenuItem(value: 'settings', child: ListTile(leading: const Icon(Icons.settings), title: Text(l.settings))),
          ],
        ),
      ],
    );
  }

  AppBar _selectionBar(AppLocalizations l) {
    final n = _selected.length;
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: l.clearSelection,
          onPressed: () => setState(_selected.clear)),
      title: Text(n >= 2 ? l.nSelectedMergeOrder(n) : l.nSelected(n)),
      actions: [
        if (n >= 2)
          IconButton(tooltip: l.mergeIntoOne, icon: const Icon(Icons.merge), onPressed: _mergeSelected),
        IconButton(tooltip: l.moveToFolder, icon: const Icon(Icons.drive_file_move_outline), onPressed: _moveToFolder),
        IconButton(tooltip: l.shareAsPdf, icon: const Icon(Icons.share), onPressed: _shareSelected),
        IconButton(tooltip: l.delete, icon: const Icon(Icons.delete_outline), onPressed: _deleteSelected),
        IconButton(
          tooltip: l.selectAll,
          icon: const Icon(Icons.select_all),
          onPressed: () => setState(() {
            for (final d in _visible) {
              if (!_selected.contains(d.id)) _selected.add(d.id);
            }
          }),
        ),
      ],
    );
  }

  Widget _empty(AppLocalizations l) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.document_scanner_outlined, size: 96, color: cs.primary),
          const SizedBox(height: 16),
          Text(_query.isEmpty ? l.noScansYet : l.nothingMatches,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            _query.isEmpty ? l.emptyHint : l.tryAnotherWord,
            textAlign: TextAlign.center,
            style: TextStyle(color: cs.onSurfaceVariant),
          ),
        ]),
      ),
    );
  }

  Widget _grid(List<Doc> docs) {
    final width = MediaQuery.sizeOf(context).width;
    final cols = (width / 180).floor().clamp(2, 6);
    return RefreshIndicator(
      onRefresh: _reload,
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          childAspectRatio: 0.66,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: docs.length,
        itemBuilder: (context, i) {
          final d = docs[i];
          final order = _selected.indexOf(d.id);
          return _DocCard(
            doc: d,
            snippet: SearchIndex.snippet(d, _query),
            order: order < 0 ? null : order + 1,
            selecting: _selected.isNotEmpty,
            onTap: () => _selected.isNotEmpty ? _toggle(d) : _open(d),
            onLongPress: () => _toggle(d),
          );
        },
      ),
    );
  }

  Widget _busyOverlay(String msg) {
    return Positioned.fill(
      child: AbsorbPointer(
        child: Container(
          color: Colors.black38,
          alignment: Alignment.center,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5)),
                const SizedBox(width: 16),
                Flexible(child: Text(msg)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> _askName(BuildContext context, String title, String initial) {
  final l = context.l10n;
  final c = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(controller: c, autofocus: true, decoration: InputDecoration(labelText: l.name)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, c.text.trim().isEmpty ? initial : c.text.trim()),
          child: Text(l.ok),
        ),
      ],
    ),
  );
}

class _DocCard extends StatelessWidget {
  final Doc doc;
  final String? snippet; // matching text when the search hit the contents
  final int? order; // 1-based position in the selection, null when not selected
  final bool selecting;
  final VoidCallback onTap, onLongPress;
  const _DocCard({required this.doc, this.snippet, required this.order, required this.selecting, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    final cover = doc.cover;
    final selected = order != null;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: selected ? BorderSide(color: cs.primary, width: 3) : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Stack(fit: StackFit.expand, children: [
              Container(color: cs.surfaceContainerHighest),
              if (cover != null)
                Image.file(cover,
                    key: ValueKey('${cover.path}#${doc.modified}'),
                    fit: BoxFit.cover,
                    cacheWidth: 400,
                    errorBuilder: (_, __, ___) => const Icon(Icons.broken_image)),
              if (selecting)
                PositionedDirectional(
                  top: 6,
                  end: 6,
                  child: selected
                      ? CircleAvatar(
                          radius: 13,
                          backgroundColor: cs.primary,
                          child: Text('$order',
                              style: TextStyle(color: cs.onPrimary, fontSize: 13, fontWeight: FontWeight.w700)),
                        )
                      : const Icon(Icons.radio_button_unchecked, color: Colors.white, shadows: [Shadow(blurRadius: 4)]),
                ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(doc.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 2),
              Text(
                snippet ?? l.pagesAndDate(l.nPages(doc.pages.length), fmtDate(context, doc.modified)),
                maxLines: snippet == null ? 1 : 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: snippet == null ? cs.onSurfaceVariant : cs.primary,
                    fontStyle: snippet == null ? FontStyle.normal : FontStyle.italic),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
