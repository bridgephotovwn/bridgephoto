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

  Progress _progress(String what) =>
      (int done, int total) => _setBusy('$what $done / $total');

  static String _msg(Object e) {
    if (e is PlatformException) return e.message ?? e.code;
    return e.toString().replaceFirst('Exception: ', '');
  }

  // ---- actions

  Future<void> _addPages() async {
    final d = _doc!;
    try {
      final paths = await Engine.scan(
        mode: Prefs.scannerMode,
        gallery: Prefs.galleryImport,
        pageLimit: Prefs.pageLimit,
      );
      if (paths.isEmpty) return;
      _setBusy('Saving pages…');
      for (final p in paths) {
        await DocStore.addPageFile(d, p, move: true);
      }
      await DocStore.save(d);
      setState(() {});
    } on PlatformException catch (e) {
      if (mounted) context.snack(e.message ?? 'The scanner is not available.');
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _sharePdf() async {
    try {
      await Exporter.sharePdf(context, _doc!, progress: _progress('Building PDF, page'));
    } catch (e) {
      if (mounted) context.snack('Could not build the PDF: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _savePdf() async {
    try {
      final p = await Exporter.savePdf(_doc!, progress: _progress('Building PDF, page'));
      if (p != null && mounted) context.snack('PDF saved.');
    } catch (e) {
      if (mounted) context.snack('Could not save the PDF: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _exportImages() async {
    var format = 'jpg';
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const ListTile(title: Text('Export pages as images')),
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
            ListTile(leading: const Icon(Icons.share), title: const Text('Share'), onTap: () => Navigator.pop(ctx, 'share')),
            ListTile(leading: const Icon(Icons.photo_library_outlined), title: const Text('Save to Photos'), onTap: () => Navigator.pop(ctx, 'gallery')),
          ]),
        ),
      ),
    );
    if (action == null) return;
    try {
      final files = await Exporter.imageFiles(_doc!, format, progress: _progress('Preparing image'));
      _setBusy(null);
      if (!mounted) return;
      if (action == 'share') {
        await Exporter.shareImages(context, files, format);
      } else {
        final n = await Exporter.saveImagesToGallery(files, format);
        if (!mounted) return;
        if (n < 0) {
          context.snack('Saving to Photos needs Android 10 or newer. Use Share instead.');
        } else {
          context.snack('$n image${n == 1 ? '' : 's'} saved to Photos.');
        }
      }
    } catch (e) {
      if (mounted) context.snack('Could not export: ${_msg(e)}');
    } finally {
      _setBusy(null);
    }
  }

  Future<void> _rename() async {
    final d = _doc!;
    final c = TextEditingController(text: d.name);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename'),
        content: TextField(controller: c, autofocus: true, decoration: const InputDecoration(labelText: 'Name')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, c.text.trim()), child: const Text('OK')),
        ],
      ),
    );
    if (name == null || name.isEmpty || name == d.name) return;
    d.name = name;
    await DocStore.save(d);
    setState(() {});
  }

  Future<void> _delete() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete this document?'),
        content: Text('${_doc!.pages.length} page(s) will be deleted. This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
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
      Navigator.of(context).pop();
      return;
    }
    setState(() {});
  }

  // ---- UI

  @override
  Widget build(BuildContext context) {
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
            Text('${d.pages.length} page${d.pages.length == 1 ? '' : 's'} · hold a page to reorder',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
          ]),
        ),
        actions: [
          IconButton(
            tooltip: 'Text (OCR)',
            icon: const Icon(Icons.text_fields),
            onPressed: d.pages.isEmpty
                ? null
                : () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TextScreen(doc: d))),
          ),
          IconButton(tooltip: 'Share PDF', icon: const Icon(Icons.share), onPressed: d.pages.isEmpty ? null : _sharePdf),
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
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'save', child: ListTile(leading: Icon(Icons.save_alt), title: Text('Save PDF to a folder'))),
              PopupMenuItem(value: 'images', child: ListTile(leading: Icon(Icons.image_outlined), title: Text('Export as JPEG / PNG'))),
              PopupMenuItem(value: 'rename', child: ListTile(leading: Icon(Icons.edit_outlined), title: Text('Rename'))),
              PopupMenuDivider(),
              PopupMenuItem(value: 'delete', child: ListTile(leading: Icon(Icons.delete_outline), title: Text('Delete document'))),
            ],
          ),
        ],
      ),
      body: Stack(children: [
        if (d.pages.isEmpty)
          const Center(child: Text('No pages. Tap Add pages.'))
        else
          ReorderGrid(
            count: d.pages.length,
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
            onReorder: _reorder,
            itemBuilder: (context, i) => _PageCell(
              file: d.pageFile(d.pages[i]),
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
                      Text(_busy!),
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
              label: const Text('Add pages'),
            ),
    );
  }
}

class _PageCell extends StatelessWidget {
  final File file;
  final int number;
  final VoidCallback onTap;
  const _PageCell({required this.file, required this.number, required this.onTap});

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
          Image.file(file, fit: BoxFit.cover, cacheWidth: 300, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image)),
          Positioned(
            left: 6,
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
