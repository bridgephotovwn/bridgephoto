import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../engine.dart';
import '../main.dart';
import '../ocr.dart';
import '../store.dart';

/// Place a saved signature on a page: drag to move, pinch to resize, Apply
/// bakes it into the page image. Pops with true when applied.
class SignPlaceScreen extends StatefulWidget {
  final Doc doc;
  final String page;
  final File signature;
  const SignPlaceScreen({super.key, required this.doc, required this.page, required this.signature});

  @override
  State<SignPlaceScreen> createState() => _SignPlaceScreenState();
}

class _SignPlaceScreenState extends State<SignPlaceScreen> {
  int? _iw, _ih; // page pixels
  double _aspect = 0.4; // signature height / width
  // Signature box in page pixels (top-left + width)
  double _x = 0, _y = 0, _w = 0;
  double _startW = 0;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _measure();
  }

  Future<(int, int)> _dims(File f) async {
    final buf = await ui.ImmutableBuffer.fromUint8List(await f.readAsBytes());
    final d = await ui.ImageDescriptor.encoded(buf);
    final r = (d.width, d.height);
    d.dispose();
    buf.dispose();
    return r;
  }

  Future<void> _measure() async {
    try {
      final p = await _dims(widget.doc.pageFile(widget.page));
      final s = await _dims(widget.signature);
      if (!mounted) return;
      setState(() {
        _iw = p.$1;
        _ih = p.$2;
        _aspect = s.$2 / s.$1;
        _w = p.$1 * 0.32;
        _x = p.$1 * 0.60;
        _y = p.$2 * 0.82 - _w * _aspect;
        _clamp();
      });
    } catch (e) {
      if (mounted) {
        context.snack('Could not read the page: $e');
        Navigator.of(context).pop(false);
      }
    }
  }

  void _clamp() {
    final iw = _iw!.toDouble(), ih = _ih!.toDouble();
    _w = _w.clamp(iw * 0.06, iw * 0.95);
    final h = _w * _aspect;
    _x = _x.clamp(0, (iw - _w).clamp(0, iw));
    _y = _y.clamp(0, (ih - h).clamp(0, ih));
  }

  Future<void> _apply() async {
    setState(() => _busy = true);
    try {
      final f = widget.doc.pageFile(widget.page);
      await Engine.overlay(f.path, widget.signature.path,
          x: _x.round(), y: _y.round(), w: _w.round(), h: (_w * _aspect).round());
      await Ocr.invalidate(widget.doc, widget.page);
      await DocStore.save(widget.doc);
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (mounted) {
        context.snack('Could not sign: $e');
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Place signature'),
        actions: [
          TextButton(
            onPressed: _busy || _iw == null ? null : _apply,
            child: const Text('APPLY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: _iw == null
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              Expanded(
                child: LayoutBuilder(builder: (context, cons) {
                  final iw = _iw!.toDouble(), ih = _ih!.toDouble();
                  final s = (cons.maxWidth / iw) < (cons.maxHeight / ih)
                      ? cons.maxWidth / iw
                      : cons.maxHeight / ih;
                  final dw = iw * s, dh = ih * s;
                  final left = (cons.maxWidth - dw) / 2, top = (cons.maxHeight - dh) / 2;
                  final sh = _w * _aspect;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onScaleStart: (_) => _startW = _w,
                    onScaleUpdate: (d) => setState(() {
                      _x += d.focalPointDelta.dx / s;
                      _y += d.focalPointDelta.dy / s;
                      if (d.pointerCount > 1) _w = _startW * d.scale;
                      _clamp();
                    }),
                    child: Stack(children: [
                      Positioned(
                        left: left,
                        top: top,
                        width: dw,
                        height: dh,
                        child: Image.file(widget.doc.pageFile(widget.page), fit: BoxFit.fill),
                      ),
                      Positioned(
                        left: left + _x * s,
                        top: top + _y * s,
                        width: _w * s,
                        height: sh * s,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: cs.primary, width: 2),
                            color: cs.primary.withValues(alpha: 0.06),
                          ),
                          child: Image.file(widget.signature, fit: BoxFit.fill),
                        ),
                      ),
                      if (_busy)
                        const Positioned.fill(
                            child: ColoredBox(color: Colors.black38, child: Center(child: CircularProgressIndicator()))),
                    ]),
                  );
                }),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: Row(children: [
                    const Expanded(
                      child: Text('Drag to move. Pinch to resize.', style: TextStyle(color: Colors.white70)),
                    ),
                    IconButton(
                      tooltip: 'Smaller',
                      color: Colors.white,
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => setState(() {
                        _w *= 0.85;
                        _clamp();
                      }),
                    ),
                    IconButton(
                      tooltip: 'Larger',
                      color: Colors.white,
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => setState(() {
                        _w *= 1.18;
                        _clamp();
                      }),
                    ),
                  ]),
                ),
              ),
            ]),
    );
  }
}
