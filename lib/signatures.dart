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
    final points = _strokes.expand((s) => s).toList();
    if (points.isEmpty) {
      context.snack('Draw your signature first.');
      return;
    }
    setState(() => _saving = true);
    try {
      // Tight bounds around the ink, with a margin for the round caps.
      var l = points.first.dx, t = points.first.dy, r = l, b = t;
      for (final p in points) {
        if (p.dx < l) l = p.dx;
        if (p.dx > r) r = p.dx;
        if (p.dy < t) t = p.dy;
        if (p.dy > b) b = p.dy;
      }
      final pad = _width * 2;
      final bounds = Rect.fromLTRB(l - pad, t - pad, r + pad, b + pad);
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
      if (data == null) throw Exception('Could not render the signature.');
      final f = await SignatureStore.save(data.buffer.asUint8List());
      if (mounted) Navigator.of(context).pop(f);
    } catch (e) {
      if (mounted) context.snack('Could not save: $e');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New signature'),
        actions: [
          IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.delete_sweep_outlined),
              onPressed: _strokes.isEmpty ? null : () => setState(_strokes.clear)),
          IconButton(
              tooltip: 'Undo',
              icon: const Icon(Icons.undo),
              onPressed: _strokes.isEmpty ? null : () => setState(_strokes.removeLast)),
          TextButton(onPressed: _saving ? null : _save, child: const Text('SAVE')),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text('Sign in the box with your finger. Turn the phone sideways for more room.',
              style: TextStyle(color: cs.onSurfaceVariant)),
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
                  padding: const EdgeInsets.only(right: 10),
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
                segments: const [
                  ButtonSegment(value: 2.5, label: Text('Thin')),
                  ButtonSegment(value: 4, label: Text('Medium')),
                  ButtonSegment(value: 6.5, label: Text('Thick')),
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
