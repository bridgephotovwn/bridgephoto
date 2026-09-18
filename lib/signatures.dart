import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'main.dart';

/// Saved signatures: transparent PNG files in the app's private folder.
class SignatureStore {
  static Future<Directory> dir() async {
    final d = Directory('${(await getApplicationDocumentsDirectory()).path}/signatures');
    await d.create(recursive: true);
    return d;
  }

  static Future<List<File>> list() async {
    final d = await dir();
    final files = (await d.list().toList())
        .whereType<File>()
        .where((f) => f.path.endsWith('.png'))
        .toList();
    files.sort((a, b) => b.path.compareTo(a.path)); // newest first
    return files;
  }

  static Future<File> save(Uint8List png) async {
    final f = File('${(await dir()).path}/sig_${DateTime.now().millisecondsSinceEpoch}.png');
    await f.writeAsBytes(png, flush: true);
    return f;
  }

  static Future<void> delete(File f) async {
    if (await f.exists()) await f.delete();
  }
}

/// Draw a signature with a finger. Pops with the saved PNG file, or null.
class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final List<List<Offset>> _strokes = [];
  Color _color = Colors.black;
  double _width = 4;
  bool _saving = false;

  void _start(Offset p) => setState(() => _strokes.add([p]));
  void _move(Offset p) => setState(() => _strokes.last.add(p));

  Future<void> _save() async {
    final l = context.l10n;
    final points = _strokes.expand((s) => s).toList();
    if (points.isEmpty) {
      context.snack(l.drawFirst);
      return;
    }
    setState(() => _saving = true);
    try {
      // Tight bounds around the ink, with a margin for the round caps.
      var left = points.first.dx, top = points.first.dy, right = left, bottom = top;
      for (final p in points) {
        if (p.dx < left) left = p.dx;
        if (p.dx > right) right = p.dx;
        if (p.dy < top) top = p.dy;
        if (p.dy > bottom) bottom = p.dy;
      }
      final pad = _width * 2;
      final bounds = Rect.fromLTRB(left - pad, top - pad, right + pad, bottom + pad);
      const k = 3.0; // render at 3x for crisp placement on large pages
      final rec = ui.PictureRecorder();
      final canvas = Canvas(rec);
      canvas.scale(k);
      canvas.translate(-bounds.left, -bounds.top);
      _paintStrokes(canvas, _strokes, _color, _width);
      final pic = rec.endRecording();
      final img = await pic.toImage(
          (bounds.width * k).ceil().clamp(1, 4000), (bounds.height * k).ceil().clamp(1, 4000));
      final data = await img.toByteData(format: ui.ImageByteFormat.png);
      img.dispose();
      if (data == null) throw Exception('render failed');
      final f = await SignatureStore.save(data.buffer.asUint8List());
      if (mounted) Navigator.of(context).pop(f);
    } catch (e) {
      if (mounted) context.snack(l.couldNotSave('$e'));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.newSignature),
        actions: [
          IconButton(
              tooltip: l.clear,
              icon: const Icon(Icons.delete_sweep_outlined),
              onPressed: _strokes.isEmpty ? null : () => setState(_strokes.clear)),
          IconButton(
              tooltip: l.undo,
              icon: const Icon(Icons.undo),
              onPressed: _strokes.isEmpty ? null : () => setState(_strokes.removeLast)),
          TextButton(onPressed: _saving ? null : _save, child: Text(l.save.toUpperCase())),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(l.signHint, style: TextStyle(color: cs.onSurfaceVariant)),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant),
            ),
            clipBehavior: Clip.antiAlias,
            child: GestureDetector(
              onPanStart: (d) => _start(d.localPosition),
              onPanUpdate: (d) => _move(d.localPosition),
              child: CustomPaint(
                painter: _SigPainter(_strokes, _color, _width),
                size: Size.infinite,
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(children: [
              for (final c in [Colors.black, const Color(0xFF1D4ED8)])
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: InkWell(
                    onTap: () => setState(() => _color = c),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                        border: Border.all(color: _color == c ? cs.primary : Colors.transparent, width: 3),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              SegmentedButton<double>(
                segments: [
                  ButtonSegment(value: 2.5, label: Text(l.thin)),
                  ButtonSegment(value: 4, label: Text(l.medium)),
                  ButtonSegment(value: 6.5, label: Text(l.thick)),
                ],
                selected: {_width},
                onSelectionChanged: (s) => setState(() => _width = s.first),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

void _paintStrokes(Canvas canvas, List<List<Offset>> strokes, Color color, double width) {
  final paint = Paint()
    ..color = color
    ..strokeWidth = width
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true;
  for (final s in strokes) {
    if (s.length == 1) {
      canvas.drawCircle(s.first, width / 2, Paint()..color = color);
      continue;
    }
    final path = Path()..moveTo(s.first.dx, s.first.dy);
    for (var i = 1; i < s.length; i++) {
      path.lineTo(s[i].dx, s[i].dy);
    }
    canvas.drawPath(path, paint);
  }
}

class _SigPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final Color color;
  final double width;
  _SigPainter(this.strokes, this.color, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    // Baseline guide
    final y = size.height * 0.72;
    canvas.drawLine(Offset(24, y), Offset(size.width - 24, y),
        Paint()..color = const Color(0xFFCBD5E1)..strokeWidth = 1);
    _paintStrokes(canvas, strokes, color, width);
  }

  @override
  bool shouldRepaint(_SigPainter old) => true;
}
