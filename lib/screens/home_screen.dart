import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../main.dart';
import '../prefs.dart';
import '../store.dart';
import 'document_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Doc>? _docs;
  final List<String> _selected = []; // ids, in tap order (= merge order)
  bool _searching = false;
  String _query = '';
  String? _busy;

  @override
  void initState() {
    super.initState();
    Engine.onPendingScan = _recoverScan;
    _reload().then((_) => _checkPendingScan()).then((_) => _offerCrashReport());
  }

  /// After a crash, offer the private report. Nothing is sent unless shared.
  Future<void> _offerCrashReport() async {
    final report = await Engine.takeCrashLog();
    if (report == null || report.trim().isEmpty || !mounted) return;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('BRIDGE PHOTO closed unexpectedly'),
        content: const Text(
            'A report of what went wrong was saved on this phone only. '
            'Sharing it with the developer helps fix the problem. It contains '
            'technical details, not your documents.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Dismiss')),
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: report));
              Navigator.pop(ctx);
              context.snack('Report copied.');
            },
            child: const Text('Copy'),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.share),
            label: const Text('Share'),
            onPressed: () {
              Navigator.pop(ctx);
              Exporter.shareText(context, report, subject: 'BRIDGE PHOTO crash report');
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (Engine.onPendingScan == _recoverScan) Engine.onPendingScan = null;
    if (Engine.onScanState == _onScanState) Engine.onScanState = null;
    super.dispose();
  }

  /// Feedback while Play services prepares the scanner (slow on first use).
  void _onScanState(String s) {
    if (!mounted) return;
    if (s == 'preparing') {
      _setBusy('Preparing the scanner…\nFirst use: Google Play services downloads it once.');
    } else {
      _setBusy(null);
    }
  }

  Future<void> _reload() async {
    final docs = await DocStore.list();
    if (!mounted) return;
    setState(() {
      _docs = docs;
      _selected.removeWhere((id) => !docs.any((d) => d.id == id));
    });
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
      if (mounted) context.snack(e.message ?? 'The scanner is not available.');
      return;
    } catch (e) {
      if (mounted) context.snack('The scanner is not available: ${_msg(e)}');
      return;
    } finally {
      if (Engine.onScanState == _onScanState) Engine.onScanState = null;
      _setBusy(null);
    }
    if (paths.isEmpty) return;
    await _saveNewDocument(paths);
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

  Future<void> _saveNewDocument(List<String> paths) async {
    _setBusy('Saving pages…');
    try {
      final d = await DocStore.create(DocStore.defaultName());
      for (final p in paths) {
        await DocStore.addPageFile(d, p, move: true);
      }
      await DocStore.save(d);
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack('Could not save the pages: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  // ---- PDF tools

  Future<void> _importPdf() async {
    FilePickerResult? r;
    try {
      r = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: const ['pdf']);
    } catch (e) {
      if (mounted) context.snack('Could not open the file picker: ${_msg(e)}');
      return;
    }
    final file = r?.files.firstOrNull;
    final path = file?.path;
    if (file == null || path == null) return;
    _setBusy('Importing PDF…');
    try {
      var name = file.name;
      if (name.toLowerCase().endsWith('.pdf')) {
        name = name.substring(0, name.length - 4);
      }
      final d = await Exporter.importPdf(path, name.trim().isEmpty ? 'Imported PDF' : name.trim());
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack('Could not import: ${_msg(e)}');
    } finally {
      _setBusy(null);
      try {
        await FilePicker.platform.clearTemporaryFiles();
      } catch (_) {}
    }
  }

  Future<void> _mergePdfFiles() async {
    FilePickerResult? r;
    try {
      r = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: const ['pdf'],
          allowMultiple: true);
    } catch (e) {
      if (mounted) context.snack('Could not open the file picker: ${_msg(e)}');
      return;
    }
    final paths = r?.files.map((f) => f.path).whereType<String>().toList() ?? [];
    if (paths.isEmpty || !mounted) return;
    if (paths.length < 2) {
      context.snack('Pick at least two PDF files.');
      return;
    }
    _setBusy('Merging ${paths.length} PDF files…');
    try {
      await Exporter.cleanShareDir();
      final f = await Exporter.mergePdfFiles(paths, 'Merged ${DocStore.defaultName().substring(5)}');
      _setBusy(null);
      if (!mounted) return;
      await _offerFile(f, 'application/pdf', 'pdf');
    } catch (e) {
      if (mounted) context.snack('Could not merge: ${_msg(e)}');
    } finally {
      _setBusy(null);
      try {
        await FilePicker.platform.clearTemporaryFiles();
      } catch (_) {}
    }
  }

  /// Share or save a finished file.
  Future<void> _offerFile(File f, String mime, String ext) async {
    final name = f.uri.pathSegments.last;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(title: Text(name, style: Theme.of(ctx).textTheme.titleMedium)),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {
              Navigator.pop(ctx);
              Exporter.shareFile(context, f, mime, subject: name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Save to a folder'),
            onTap: () async {
              Navigator.pop(ctx);
              try {
                final p = await Exporter.saveBytes(name, await f.readAsBytes(), ext: ext);
                if (p != null && mounted) context.snack('Saved.');
              } catch (e) {
                if (mounted) context.snack('Could not save: ${_msg(e)}');
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
    final docs = _selectedDocs;
    final name = await _askName(context, 'Merged document',
        '${docs.first.name} + ${docs.length - 1} more');
    if (name == null) return;
    _setBusy('Merging…');
    try {
      final d = await DocStore.merge(name, docs);
      _selected.clear();
      await _reload();
      if (mounted) _open(d);
    } catch (e) {
      if (mounted) context.snack('Could not merge: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _deleteSelected() async {
    final n = _selected.length;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete $n document${n == 1 ? '' : 's'}?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
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
    final docs = _selectedDocs;
    _setBusy('Building PDF…');
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
        _setBusy('Building PDF ${i + 1} / ${docs.length}…');
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
      if (mounted) context.snack('Could not build the PDF: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  // ---- UI

  List<Doc> get _visible {
    final docs = _docs ?? const [];
    if (_query.trim().isEmpty) return docs;
    final q = _query.toLowerCase();
    return docs.where((d) => d.name.toLowerCase().contains(q)).toList();
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

  @override
  Widget build(BuildContext context) {
    final selecting = _selected.isNotEmpty;
    final docs = _visible;
    return PopScope(
      canPop: !selecting && !_searching,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        setState(() {
          if (selecting) {
            _selected.clear();
          } else {
            _searching = false;
            _query = '';
          }
        });
      },
      child: Scaffold(
        appBar: selecting ? _selectionBar() : _normalBar(),
        body: Stack(children: [
          if (_docs == null)
            const Center(child: CircularProgressIndicator())
          else if (docs.isEmpty)
            _empty()
          else
            _grid(docs),
          if (_busy != null) _busyOverlay(_busy!),
        ]),
        floatingActionButton: selecting || _busy != null
            ? null
            : FloatingActionButton.extended(
                onPressed: _scan,
                icon: const Icon(Icons.document_scanner),
                label: const Text('Scan'),
              ),
      ),
    );
  }

  AppBar _normalBar() {
    return AppBar(
      title: _searching
          ? TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'Search documents', border: InputBorder.none),
              onChanged: (v) => setState(() => _query = v),
            )
          : const Text('BRIDGE PHOTO'),
      actions: [
        IconButton(
          tooltip: _searching ? 'Close search' : 'Search',
          icon: Icon(_searching ? Icons.close : Icons.search),
          onPressed: () => setState(() {
            _searching = !_searching;
            _query = '';
          }),
        ),
        PopupMenuButton<String>(
          onSelected: (v) {
            switch (v) {
              case 'import':
                _importPdf();
              case 'mergepdf':
                _mergePdfFiles();
              case 'settings':
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SettingsScreen()))
                    .then((_) => setState(() {}));
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'import', child: ListTile(leading: Icon(Icons.picture_as_pdf), title: Text('Import PDF as pages'))),
            PopupMenuItem(value: 'mergepdf', child: ListTile(leading: Icon(Icons.merge), title: Text('Merge PDF files'))),
            PopupMenuDivider(),
            PopupMenuItem(value: 'settings', child: ListTile(leading: Icon(Icons.settings), title: Text('Settings'))),
          ],
        ),
      ],
    );
  }

  AppBar _selectionBar() {
    final n = _selected.length;
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Clear selection',
          onPressed: () => setState(_selected.clear)),
      title: Text(n >= 2 ? '$n selected · merge in this order' : '$n selected'),
      actions: [
        if (n >= 2)
          IconButton(tooltip: 'Merge into one document', icon: const Icon(Icons.merge), onPressed: _mergeSelected),
        IconButton(tooltip: 'Share as PDF', icon: const Icon(Icons.share), onPressed: _shareSelected),
        IconButton(tooltip: 'Delete', icon: const Icon(Icons.delete_outline), onPressed: _deleteSelected),
        IconButton(
          tooltip: 'Select all',
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

  Widget _empty() {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.document_scanner_outlined, size: 96, color: cs.primary),
          const SizedBox(height: 16),
          Text(_query.isEmpty ? 'No scans yet' : 'Nothing matches',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            _query.isEmpty
                ? 'Tap Scan to photograph a document. Everything stays on this phone.'
                : 'Try another word.',
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
                Text(msg),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> _askName(BuildContext context, String title, String initial) {
  final c = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(controller: c, autofocus: true, decoration: const InputDecoration(labelText: 'Name')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, c.text.trim().isEmpty ? initial : c.text.trim()),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class _DocCard extends StatelessWidget {
  final Doc doc;
  final int? order; // 1-based position in the selection, null when not selected
  final bool selecting;
  final VoidCallback onTap, onLongPress;
  const _DocCard({required this.doc, required this.order, required this.selecting, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
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
                Positioned(
                  top: 6,
                  right: 6,
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
              Text('${doc.pages.length} page${doc.pages.length == 1 ? '' : 's'} · ${fmtDate(doc.modified)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
            ]),
          ),
        ]),
      ),
    );
  }
}
