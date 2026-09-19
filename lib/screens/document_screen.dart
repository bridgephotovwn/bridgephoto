import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../main.dart';
import '../prefs.dart';
import '../search_index.dart';
import '../page_tidy.dart';
import '../size_fit.dart';
import '../store.dart';
import '../widgets/reorder_grid.dart';
import 'page_screen.dart';
import 'text_screen.dart';

class DocumentScreen extends StatefulWidget {
  final String id;
  const DocumentScreen({super.key, required this.id});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  Doc? _doc;
  String? _busy;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final d = await DocStore.load(widget.id);
    if (!mounted) return;
    if (d == null) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _doc = d);
  }

  void _setBusy(String? msg) {
    if (mounted) setState(() => _busy = msg);
  }

  Progress _pdfProgress() =>
      (int done, int total) => _setBusy(context.l10n.buildingPdfPage(done, total));

  static String _msg(Object e) {
    if (e is PlatformException) return e.message ?? e.code;
    return e.toString().replaceFirst('Exception: ', '');
  }

  // ---- actions

  void _onScanState(String s) {
    if (!mounted) return;
    if (s == 'preparing') {
      _setBusy(context.l10n.preparingScanner);
    } else {
      _setBusy(null);
    }
  }

  Future<void> _addPages() async {
    final l = context.l10n;
    final d = _doc!;
    Engine.onScanState = _onScanState;
    try {
      final paths = await Engine.scan(
        mode: Prefs.scannerMode,
        gallery: Prefs.galleryImport,
        pageLimit: Prefs.pageLimit,
      );
      if (Engine.onScanState == _onScanState) Engine.onScanState = null;
      _setBusy(null);
      if (paths.isEmpty) return;
      _setBusy(l.savingPages);
      for (final p in paths) {
        await DocStore.addPageFile(d, p, move: true);
      }
      await DocStore.save(d);
      if (mounted) setState(() {});
      SearchIndex.indexAll([d]);
    } on PlatformException catch (e) {
      if (mounted) context.snack(e.message ?? l.scannerUnavailable);
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePages(_msg(e)));
    } finally {
      if (Engine.onScanState == _onScanState) Engine.onScanState = null;
      _setBusy(null);
    }
  }

  Future<void> _sharePdf() async {
    final l = context.l10n;
    try {
      await Exporter.cleanShareDir();
      final f = await Exporter.pdfFile(_doc!, progress: _pdfProgress());
      _setBusy(null);
      if (!mounted) return;
      await Exporter.shareFile(context, f, 'application/pdf', subject: _doc!.name);
    } catch (e) {
      if (mounted) context.snack(l.couldNotBuildPdf(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  /// Puts several pages on one printable sheet: two sides of a document, a
  /// passport page and its visa, two receipts. NOT pitched as an Emirates ID
  /// tool — UAE PASS gives residents an official copy of their own ID for
  /// nothing, and we will not pretend to beat the government at that. This is
  /// for everything else, and for the documents that are not yours.
  /// The pages chosen are kept; the sheet is added at the end.
  Future<void> _oneSheet() async {
    final l = context.l10n;
    final d = _doc!;
    final chosen = await showModalBottomSheet<List<String>>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => _SheetPicker(doc: d),
    );
    if (chosen == null || chosen.length < 2 || !mounted) return;
    _setBusy(l.makingSheet);
    try {
      final name = DocStore.newPageName();
      await Engine.composeSheet(
          [for (final p in chosen) d.pageFile(p).path], d.pageFile(name).path);
      d.pages.add(name);
      await DocStore.save(d);
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      if (mounted) context.snack(l.sheetAdded);
    } catch (e) {
      if (mounted) context.snack(l.couldNotMakeSheet(_msg(e)));
    } finally {
      _setBusy(null);
      if (mounted) setState(() {});
    }
  }

  /// Saves the PDF locked with a password. Ten of the apps we looked at
  /// charge for this; PDFBox was already in the app for merging, so it costs
  /// us nothing.
  /// Saves the PDF under a size limit somebody else set — an exam portal, a
  /// visa site, a labour ministry. The scans themselves are never touched.
  /// Splits one long scan into separate documents wherever a blank sheet was
  /// used as a divider — the way a desk scanner has worked for thirty years.
  /// The first group stays in this document; the rest become new ones.
  Future<void> _splitAtBlanks() async {
    final l = context.l10n;
    final d = _doc!;
    _setBusy(l.checkingPages);
    List<List<String>> groups;
    try {
      final facts = <PageFacts>[];
      for (final p in d.pages) {
        final (ink, hash) = await Engine.pageStats(d.pageFile(p).path);
        facts.add(PageFacts(p, ink, hash));
      }
      groups = PageTidy.splitAtBlanks(facts);
    } catch (e) {
      if (mounted) context.snack(_msg(e));
      return;
    } finally {
      _setBusy(null);
    }
    if (!mounted) return;
    if (groups.length < 2) {
      context.snack(l.noDividersFound);
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.splitDocumentTitle),
        content: Text(l.splitDocumentBody(groups.length)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.ok)),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    _setBusy(l.splittingDocument);
    try {
      // Everything not in the first group leaves: later groups move into new
      // documents, and the blank dividers go entirely.
      final keep = groups.first.toSet();
      for (var i = 1; i < groups.length; i++) {
        final fresh = await DocStore.create('${d.name} (${i + 1})');
        for (final p in groups[i]) {
          await DocStore.addPageFile(fresh, d.pageFile(p).path);
          // The text already read for this page follows it, so the new
          // document is searchable without recognising anything again.
          final ocr = d.ocrFile(p);
          if (await ocr.exists()) {
            await ocr.copy(fresh.ocrFile(fresh.pages.last).path);
          }
        }
        fresh.folder = d.folder;
        await DocStore.save(fresh);
      }
      for (final p in [...d.pages]) {
        if (!keep.contains(p)) await DocStore.removePage(d, p);
      }
      await DocStore.save(d);
      if (mounted) {
        setState(() {});
        context.snack(l.splitDone(groups.length));
      }
    } catch (e) {
      if (mounted) context.snack(_msg(e));
    } finally {
      _setBusy(null);
    }
  }

  /// Offers up the pages nobody wants: the blank back of a sheet, and the
  /// page that got photographed twice. It only ever REPORTS — every page
  /// shown has a tick beside it and nothing goes without a yes.
  Future<void> _tidyPages() async {
    final l = context.l10n;
    final d = _doc!;
    _setBusy(l.checkingPages);
    PageReport report;
    try {
      final facts = <PageFacts>[];
      for (final p in d.pages) {
        final (ink, hash) = await Engine.pageStats(d.pageFile(p).path);
        facts.add(PageFacts(p, ink, hash));
      }
      report = PageTidy.inspect(facts);
    } catch (e) {
      if (mounted) context.snack(_msg(e));
      return;
    } finally {
      _setBusy(null);
    }
    if (!mounted) return;
    if (report.isEmpty) {
      context.snack(l.nothingToTidy);
      return;
    }
    final chosen = {...report.blanks, ...report.duplicates.keys};
    final remove = await showModalBottomSheet<Set<String>>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(l.tidyFound(report.total),
                  style: Theme.of(ctx).textTheme.titleMedium),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final p in [...report.blanks, ...report.duplicates.keys])
                    CheckboxListTile(
                      value: chosen.contains(p),
                      onChanged: (v) => setSheet(() =>
                          v == true ? chosen.add(p) : chosen.remove(p)),
                      secondary: SizedBox(
                        width: 44,
                        child: Image.file(d.pageFile(p), fit: BoxFit.cover, cacheWidth: 132),
                      ),
                      title: Text(l.pageN(d.pages.indexOf(p) + 1)),
                      subtitle: Text(report.blanks.contains(p)
                          ? l.pageIsBlank
                          : l.pageRepeats(d.pages.indexOf(report.duplicates[p]!) + 1)),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(ctx, chosen),
                  child: Text(l.removeChosen),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
    if (remove == null || remove.isEmpty || !mounted) return;
    for (final p in remove) {
      await DocStore.removePage(d, p);
    }
    await DocStore.save(d);
    PaintingBinding.instance.imageCache.clear();
    if (mounted) {
      setState(() {});
      context.snack(l.pagesRemoved(remove.length));
    }
  }

  Future<void> _savePdfUnderSize() async {
    final l = context.l10n;
    final target = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(l.fitSizeHint, textAlign: TextAlign.center),
          ),
          for (final bytes in SizeFit.presets)
            ListTile(
              leading: const Icon(Icons.compress),
              title: Text(SizeFit.label(bytes)),
              onTap: () => Navigator.pop(ctx, bytes),
            ),
        ]),
      ),
    );
    if (target == null || !mounted) return;
    try {
      final (file, fits) = await Exporter.pdfUnderSize(
        _doc!,
        target,
        progress: _pdfProgress(),
        onAttempt: (n, of) => _setBusy(l.fittingSize(n, of)),
      );
      final saved = await Exporter.saveBytes(
          '${DocStore.safeName(_doc!.name)}.pdf', await file.readAsBytes(),
          title: l.savePdfDialogTitle);
      if (!mounted || saved == null) return;
      final actual = SizeFit.label(await file.length());
      if (!mounted) return;
      // Never claim a limit was met when it was not: forty pages will not fit
      // in 100 KB, and a quiet failure is worse than a plain one.
      context.snack(fits ? l.pdfSavedAtSize(actual) : l.pdfCouldNotFit(actual));
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePdf(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _savePdfLocked() async {
    final l = context.l10n;
    final c = TextEditingController();
    final password = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.lockPdfTitle),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(l.lockPdfHint),
          const SizedBox(height: 12),
          TextField(
            controller: c,
            autofocus: true,
            obscureText: true,
            decoration: InputDecoration(labelText: l.password, border: const OutlineInputBorder()),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, c.text), child: Text(l.savePdfToFolder)),
        ],
      ),
    );
    if (password == null || password.isEmpty || !mounted) return;
    try {
      final saved = await Exporter.savePdf(_doc!,
          progress: _pdfProgress(), title: l.savePdfDialogTitle, password: password);
      if (saved != null && mounted) context.snack(l.pdfSavedLocked);
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePdf(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _savePdf() async {
    final l = context.l10n;
    try {
      final p = await Exporter.savePdf(_doc!, progress: _pdfProgress(), title: l.savePdfDialogTitle);
      if (p != null && mounted) context.snack(l.pdfSaved);
    } catch (e) {
      if (mounted) context.snack(l.couldNotSavePdf(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _exportImages() async {
    final l = context.l10n;
    var format = 'jpg';
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(title: Text(l.exportPagesAsImages)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'jpg', label: Text('JPEG')),
                  ButtonSegment(value: 'png', label: Text('PNG')),
                ],
                selected: {format},
                onSelectionChanged: (s) => setSheet(() => format = s.first),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(leading: const Icon(Icons.share), title: Text(l.share), onTap: () => Navigator.pop(ctx, 'share')),
            ListTile(leading: const Icon(Icons.photo_library_outlined), title: Text(l.saveToPhotos), onTap: () => Navigator.pop(ctx, 'gallery')),
          ]),
        ),
      ),
    );
    if (action == null) return;
    try {
      await Exporter.cleanShareDir();
      final files = await Exporter.imageFiles(_doc!, format,
          progress: (done, total) => _setBusy(l.buildingPdfPage(done, total)));
      _setBusy(null);
      if (!mounted) return;
      if (action == 'share') {
        await Exporter.shareImages(context, files, format);
      } else {
        _setBusy(l.savingToPhotos);
        final n = await Exporter.saveImagesToGallery(files, format);
        if (!mounted) return;
        if (n < 0) {
          context.snack(Engine.isAndroid ? l.photosNeedsAndroid10 : l.photosNotAllowed);
        } else {
          context.snack(l.imagesSavedToPhotos(n));
        }
      }
    } catch (e) {
      if (mounted) context.snack(l.couldNotExport(_msg(e)));
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _rename() async {
    final l = context.l10n;
    final d = _doc!;
    final c = TextEditingController(text: d.name);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.rename),
        content: TextField(controller: c, autofocus: true, decoration: InputDecoration(labelText: l.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, c.text.trim()), child: Text(l.ok)),
        ],
      ),
    );
    if (name == null || name.isEmpty || name == d.name) return;
    d.name = name;
    await DocStore.save(d);
    if (mounted) setState(() {});
  }

  Future<void> _delete() async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.deleteDocumentQuestion),
        content: Text(l.deleteDocumentBody(_doc!.pages.length)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.delete)),
        ],
      ),
    );
    if (ok != true) return;
    await DocStore.delete(_doc!);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _reorder(int from, int to) async {
    final d = _doc!;
    final p = d.pages.removeAt(from);
    d.pages.insert(to, p);
    setState(() {});
    await DocStore.save(d);
  }

  Future<void> _openPage(int index) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PageScreen(doc: _doc!, index: index)));
    if (!mounted) return;
    if (_doc!.pages.isEmpty) {
      // The last page was deleted: an empty document is useless, remove it.
      await DocStore.delete(_doc!);
      if (mounted) Navigator.of(context).pop();
      return;
    }
    setState(() {});
  }

  // ---- UI

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final d = _doc;
    if (d == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: _rename,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(d.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('${l.nPages(d.pages.length)} · ${l.holdToReorder}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
          ]),
        ),
        actions: [
          IconButton(
            tooltip: l.textOcr,
            icon: const Icon(Icons.text_fields),
            onPressed: d.pages.isEmpty
                ? null
                : () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TextScreen(doc: d))),
          ),
          IconButton(tooltip: l.sharePdf, icon: const Icon(Icons.share), onPressed: d.pages.isEmpty ? null : _sharePdf),
          PopupMenuButton<String>(
            onSelected: (v) {
              switch (v) {
                case 'save':
                  _savePdf();
                case 'images':
                  _exportImages();
                case 'sheet':
                  _oneSheet();
                case 'lock':
                  _savePdfLocked();
                case 'fit':
                  _savePdfUnderSize();
                case 'tidy':
                  _tidyPages();
                case 'split':
                  _splitAtBlanks();
                case 'rename':
                  _rename();
                case 'delete':
                  _delete();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'save', child: ListTile(leading: const Icon(Icons.save_alt), title: Text(l.savePdfToFolder))),
              PopupMenuItem(value: 'images', child: ListTile(leading: const Icon(Icons.image_outlined), title: Text(l.exportAsImages))),
              if (d.pages.length >= 3)
                PopupMenuItem(value: 'split', child: ListTile(leading: const Icon(Icons.call_split), title: Text(l.splitDocumentTitle))),
              if (d.pages.length >= 2)
                PopupMenuItem(value: 'tidy', child: ListTile(leading: const Icon(Icons.cleaning_services_outlined), title: Text(l.tidyPagesTitle))),
              if (d.pages.length >= 2)
                PopupMenuItem(value: 'sheet', child: ListTile(leading: const Icon(Icons.badge_outlined), title: Text(l.oneSheetTitle))),
              PopupMenuItem(value: 'fit', child: ListTile(leading: const Icon(Icons.compress), title: Text(l.fitSizeTitle))),
              PopupMenuItem(value: 'lock', child: ListTile(leading: const Icon(Icons.lock_outline), title: Text(l.lockPdfTitle))),
              PopupMenuItem(value: 'rename', child: ListTile(leading: const Icon(Icons.edit_outlined), title: Text(l.rename))),
              const PopupMenuDivider(),
              PopupMenuItem(value: 'delete', child: ListTile(leading: const Icon(Icons.delete_outline), title: Text(l.deleteDocument))),
            ],
          ),
        ],
      ),
      body: Stack(children: [
        if (d.pages.isEmpty)
          Center(child: Text(l.noPages))
        else
          ReorderGrid(
            count: d.pages.length,
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
            onReorder: _reorder,
            itemBuilder: (context, i) => _PageCell(
              file: d.pageFile(d.pages[i]),
              version: d.modified,
              number: i + 1,
              onTap: () => _openPage(i),
            ),
          ),
        if (_busy != null)
          Positioned.fill(
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
                      Flexible(child: Text(_busy!)),
                    ]),
                  ),
                ),
              ),
            ),
          ),
      ]),
      floatingActionButton: _busy != null
          ? null
          : FloatingActionButton.extended(
              onPressed: _addPages,
              icon: const Icon(Icons.add_a_photo_outlined),
              label: Text(l.addPages),
            ),
    );
  }
}

class _PageCell extends StatelessWidget {
  final File file;
  final int version; // changes whenever the document is saved (rotation, etc.)
  final int number;
  final VoidCallback onTap;
  const _PageCell({required this.file, required this.version, required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Stack(fit: StackFit.expand, children: [
          Container(color: cs.surfaceContainerHighest),
          Image.file(file,
              key: ValueKey('${file.path}#$version'),
              fit: BoxFit.cover,
              cacheWidth: 300,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image)),
          PositionedDirectional(
            start: 6,
            bottom: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.65), borderRadius: BorderRadius.circular(8)),
              child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
      ),
    );
  }
}

/// Picks the pages that go on one sheet, in the order they are tapped —
/// front first, then back, which is the order an office expects to see them.
class _SheetPicker extends StatefulWidget {
  final Doc doc;
  const _SheetPicker({required this.doc});

  @override
  State<_SheetPicker> createState() => _SheetPickerState();
}

class _SheetPickerState extends State<_SheetPicker> {
  final _order = <String>[];

  void _toggle(String p) => setState(() {
        if (!_order.remove(p)) _order.add(p);
      });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    final d = widget.doc;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(l.oneSheetTitle, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(l.oneSheetHint,
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.onSurfaceVariant)),
          const SizedBox(height: 12),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: d.pages.length,
              itemBuilder: (_, i) {
                final p = d.pages[i];
                final pick = _order.indexOf(p);
                return InkWell(
                  onTap: () => _toggle(p),
                  child: Stack(fit: StackFit.expand, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(d.pageFile(p),
                          key: ValueKey('$p#${d.modified}'),
                          fit: BoxFit.cover,
                          cacheWidth: 240),
                    ),
                    if (pick >= 0)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: cs.primary, width: 3),
                          color: cs.primary.withValues(alpha: 0.18),
                        ),
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: cs.primary,
                          child: Text('${pick + 1}',
                              style: TextStyle(color: cs.onPrimary, fontWeight: FontWeight.w700)),
                        ),
                      ),
                  ]),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _order.length < 2
                  ? null
                  : () => Navigator.of(context).pop(List<String>.from(_order)),
              icon: const Icon(Icons.badge_outlined),
              label: Text(l.makeTheSheet),
            ),
          ),
        ]),
      ),
    );
  }
}
