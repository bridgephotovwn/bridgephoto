import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../main.dart';
import '../ocr.dart';
import '../search_index.dart';
import '../store.dart';

/// Covers parts of a page for good.
///
/// Most apps that offer this draw a black box on top of a PDF and leave the
/// words underneath, where anyone can select and read them. People have been
/// embarrassed in court by exactly that. Here the pixels are replaced in the
/// picture itself, the recognised text is thrown away, and the untouched copy
/// kept for "Original scan" is deleted — because a hidden copy of what you
/// just hid is not a feature, it is a leak.
class RedactScreen extends StatefulWidget {
  final Doc doc;
  final String page;
  /// Boxes proposed by the app — where it thinks an ID number is. They arrive
  /// already drawn so the person can see exactly what would go, and move or
  /// clear them before anything happens.
  final List<Rect> proposed;
  const RedactScreen({
    super.key,
    required this.doc,
    required this.page,
    this.proposed = const [],
  });

  @override
  State<RedactScreen> createState() => _RedactScreenState();
}

class _RedactScreenState extends State<RedactScreen> {
  final _boxes = <Rect>[]; // in the image's own pixels
  Rect? _drawing;
  Size? _imageSize;
  bool _busy = false;
  ImageStream? _stream;
  ImageStreamListener? _listener;
  late final _provider = FileImage(widget.doc.pageFile(widget.page));

  @override
  void initState() {
    super.initState();
    _boxes.addAll(widget.proposed);
    // The page is decoded anyway to show it; read its real size from the same
    // decode rather than reading the file twice.
    _stream = _provider.resolve(ImageConfiguration.empty);
    _listener = ImageStreamListener((info, _) {
      if (!mounted) return;
      setState(() => _imageSize =
          Size(info.image.width.toDouble(), info.image.height.toDouble()));
    }, onError: (_, __) {
      if (mounted) setState(() => _imageSize = null);
    });
    _stream!.addListener(_listener!);
  }

  @override
  void dispose() {
    if (_stream != null && _listener != null) _stream!.removeListener(_listener!);
    super.dispose();
  }

  static String _msg(Object e) {
    if (e is PlatformException) return e.message ?? e.code;
    return e.toString().replaceFirst('Exception: ', '');
  }

  /// Where the page is actually drawn inside [box], keeping its shape.
  Rect _fitted(Size box) {
    final s = _imageSize!;
    final k = (box.width / s.width) < (box.height / s.height)
        ? box.width / s.width
        : box.height / s.height;
    final w = s.width * k, h = s.height * k;
    return Rect.fromLTWH((box.width - w) / 2, (box.height - h) / 2, w, h);
  }

  Rect _toImage(Rect onScreen, Rect shown) {
    final k = _imageSize!.width / shown.width;
    final r = Rect.fromLTRB(
      (onScreen.left - shown.left) * k,
      (onScreen.top - shown.top) * k,
      (onScreen.right - shown.left) * k,
      (onScreen.bottom - shown.top) * k,
    );
    // A box dragged past the edge of the page must stop at the page.
    return Rect.fromLTRB(
      r.left.clamp(0, _imageSize!.width),
      r.top.clamp(0, _imageSize!.height),
      r.right.clamp(0, _imageSize!.width),
      r.bottom.clamp(0, _imageSize!.height),
    );
  }

  Rect _toScreen(Rect inImage, Rect shown) {
    final k = shown.width / _imageSize!.width;
    return Rect.fromLTRB(
      shown.left + inImage.left * k,
      shown.top + inImage.top * k,
      shown.left + inImage.right * k,
      shown.top + inImage.bottom * k,
    );
  }

  Future<void> _apply() async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.redactConfirmTitle),
        content: Text(l.redactConfirmBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true), child: Text(l.redactApply)),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _busy = true);
    final d = widget.doc;
    final p = widget.page;
    try {
      await Engine.redact(d.pageFile(p).path, [
        for (final b in _boxes)
          {'x': b.left, 'y': b.top, 'w': b.width, 'h': b.height}
      ]);
      // The other two copies of what was just hidden.
      final original = d.originalFile(p);
      if (await original.exists()) await original.delete();
      await Ocr.invalidate(d, p);
      await SearchIndex.load([d]);
      await DocStore.save(d);
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      if (mounted) {
        context.snack(l.redacted);
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) context.snack(l.couldNotRedact(_msg(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(l.redactTitle),
        actions: [
          IconButton(
            tooltip: l.undo,
            icon: const Icon(Icons.undo),
            onPressed: _busy || _boxes.isEmpty
                ? null
                : () => setState(_boxes.removeLast),
          ),
          IconButton(
            tooltip: l.clearAll,
            icon: const Icon(Icons.delete_outline),
            onPressed: _busy || _boxes.isEmpty ? null : () => setState(_boxes.clear),
          ),
        ],
      ),
      body: Column(children: [
        if (_busy) const LinearProgressIndicator(),
        Expanded(
          child: _imageSize == null
              ? const Center(child: CircularProgressIndicator())
              : LayoutBuilder(builder: (context, c) {
                  final box = Size(c.maxWidth, c.maxHeight);
                  final shown = _fitted(box);
                  return GestureDetector(
                    onPanStart: (e) => setState(() =>
                        _drawing = Rect.fromPoints(e.localPosition, e.localPosition)),
                    onPanUpdate: (e) => setState(() => _drawing =
                        Rect.fromPoints(_drawing!.topLeft, e.localPosition)),
                    onPanEnd: (_) => setState(() {
                      final r = _drawing;
                      _drawing = null;
                      if (r == null) return;
                      final inImage = _toImage(
                          Rect.fromLTRB(
                            r.left < r.right ? r.left : r.right,
                            r.top < r.bottom ? r.top : r.bottom,
                            r.left < r.right ? r.right : r.left,
                            r.top < r.bottom ? r.bottom : r.top,
                          ),
                          shown);
                      // A tap is not a box; ignore anything too small to be
                      // meant, so a stray touch cannot black out a word.
                      if (inImage.width < 4 || inImage.height < 4) return;
                      _boxes.add(inImage);
                    }),
                    child: Stack(fit: StackFit.expand, children: [
                      Image(image: _provider, fit: BoxFit.contain),
                      CustomPaint(
                        painter: _BoxPainter(
                          boxes: [for (final b in _boxes) _toScreen(b, shown)],
                          drawing: _drawing,
                        ),
                      ),
                    ]),
                  );
                }),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(children: [
              Text(
                _boxes.isEmpty ? l.redactHint : l.redactCount(_boxes.length),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _busy || _boxes.isEmpty ? null : _apply,
                  icon: const Icon(Icons.visibility_off),
                  label: Text(l.redactApply),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _BoxPainter extends CustomPainter {
  final List<Rect> boxes;
  final Rect? drawing;
  const _BoxPainter({required this.boxes, this.drawing});

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = Colors.black;
    for (final b in boxes) {
      canvas.drawRect(b, fill);
    }
    if (drawing != null) {
      canvas.drawRect(
          drawing!,
          Paint()
            ..color = Colors.black.withValues(alpha: 0.55));
      canvas.drawRect(
          drawing!,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(_BoxPainter old) =>
      old.drawing != drawing || old.boxes.length != boxes.length;
}
