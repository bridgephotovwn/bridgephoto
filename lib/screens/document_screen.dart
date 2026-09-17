import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../main.dart';
import '../prefs.dart';
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
                case 'rename':
                  _rename();
                case 'delete':
                  _delete();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'save', child: ListTile(leading: const Icon(Icons.save_alt), title: Text(l.savePdfToFolder))),
              PopupMenuItem(value: 'images', child: ListTile(leading: const Icon(Icons.image_outlined), title: Text(l.exportAsImages))),
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
