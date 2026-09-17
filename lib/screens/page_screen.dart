import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../main.dart';
import '../ocr.dart';
import '../store.dart';

/// One page, full screen, with rotate / share / copy text / delete.
class PageScreen extends StatefulWidget {
  final Doc doc;
  final int index;
  const PageScreen({super.key, required this.doc, required this.index});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  late final PageController _pc = PageController(initialPage: widget.index);
  late int _index = widget.index;
  bool _busy = false;
  int _version = 0; // bumps the image key after a rotation

  Doc get d => widget.doc;
  String get page => d.pages[_index];

  Future<void> _rotate(int degrees) async {
    setState(() => _busy = true);
    try {
      final f = d.pageFile(page);
      await Engine.transform(f.path, f.path, rotate: degrees);
      await Ocr.invalidate(d, page);
      await DocStore.save(d);
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      setState(() => _version++);
    } on PlatformException catch (e) {
      if (mounted) context.snack(e.message ?? 'Could not rotate.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final files = await Exporter.imageFiles(d, 'jpg', only: [page]);
    if (mounted) await Exporter.shareImages(context, files, 'jpg');
  }

  Future<void> _copyText() async {
    setState(() => _busy = true);
    try {
      final r = await Ocr.page(d, page);
      if (!mounted) return;
      final text = r.text.trim();
      if (text.isEmpty) {
        context.snack('No text found on this page.');
        return;
      }
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Page ${_index + 1} text'),
          content: SizedBox(
            width: 600,
            child: SingleChildScrollView(child: SelectableText(text)),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
            FilledButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copy'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                Navigator.pop(ctx);
                context.snack('Copied.');
              },
            ),
          ],
        ),
      );
    } on PlatformException catch (e) {
      if (mounted) context.snack(e.message ?? 'Text recognition failed.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _delete() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete page ${_index + 1}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );
    if (ok != true) return;
    await DocStore.removePage(d, page);
    await DocStore.save(d);
    if (!mounted) return;
    if (d.pages.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _index = _index.clamp(0, d.pages.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Page ${_index + 1} of ${d.pages.length}'),
        actions: [
          IconButton(tooltip: 'Rotate left', icon: const Icon(Icons.rotate_left), onPressed: _busy ? null : () => _rotate(-90)),
          IconButton(tooltip: 'Rotate right', icon: const Icon(Icons.rotate_right), onPressed: _busy ? null : () => _rotate(90)),
          IconButton(tooltip: 'Copy text', icon: const Icon(Icons.text_fields), onPressed: _busy ? null : _copyText),
          IconButton(tooltip: 'Share image', icon: const Icon(Icons.share), onPressed: _busy ? null : _share),
          IconButton(tooltip: 'Delete page', icon: const Icon(Icons.delete_outline), onPressed: _busy ? null : _delete),
        ],
      ),
      body: Stack(children: [
        PageView.builder(
          controller: _pc,
          itemCount: d.pages.length,
          onPageChanged: (i) => setState(() => _index = i),
          itemBuilder: (context, i) => InteractiveViewer(
            minScale: 1,
            maxScale: 6,
            child: Center(
              child: Image.file(
                d.pageFile(d.pages[i]),
                key: ValueKey('${d.pages[i]}-$_version'),
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
        ),
        if (_busy) const Center(child: CircularProgressIndicator()),
      ]),
    );
  }
}
