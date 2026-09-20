import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../engine.dart';
import '../main.dart';

/// What the four shots are for.
enum ShapeMode {
  /// The shape of the page: an embossed seal, a dry stamp, the dent a biro
  /// leaves, the stamped plate on a machine.
  relief,

  /// Taking the glare off something behind plastic or glass.
  glare,
}

/// Four photographs of one page with the torch in a different place each time.
///
/// The whole feature rests on two measured facts, and the screen is built
/// around them rather than around what looks nice.
///
/// **The phone has to move far enough.** A torch sits a centimetre from the
/// lens, so the only way to move the light is to move the phone, and light
/// arriving nearly straight down casts no shadow — which is the entire signal.
/// Measured against a page whose true shape was known, the relief comes back
/// at 0.89 when the phone slides as far as it is high, 0.67 at a third of its
/// height, and 0.12 at a tenth. So the instruction is a slide of a hand's
/// width, and anything less is worth nothing.
///
/// **The phone has to stay FLAT.** Sliding a level phone sideways over a flat
/// page moves the picture by a pure translation, which is exactly what the
/// frame aligner can undo. Tilting it does not, and no amount of aligning
/// afterwards will put that right. So the tilt is watched the whole time and
/// the shutter is refused while the phone is leaning.
class ShapeCaptureScreen extends StatefulWidget {
  final ShapeMode mode;
  const ShapeCaptureScreen({super.key, required this.mode});

  @override
  State<ShapeCaptureScreen> createState() => _ShapeCaptureScreenState();
}

class _ShapeCaptureScreenState extends State<ShapeCaptureScreen> {
  /// Beyond this many degrees off flat, the shutter is refused.
  static const _maxTiltDegrees = 9.0;

  CameraController? _cam;
  StreamSubscription<AccelerometerEvent>? _tilt;
  double _tiltDegrees = 0;
  int _shot = 0;
  final _taken = <String>[];
  String? _error;
  bool _busy = false;
  String? _result;

  @override
  void initState() {
    super.initState();
    _start();
    _tilt = accelerometerEventStream().listen((e) {
      // flat means gravity is straight down the z axis
      final g = math.sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      if (g < 1) return;
      final off = math.acos((e.z.abs() / g).clamp(0.0, 1.0)) * 180 / math.pi;
      if (mounted && (off - _tiltDegrees).abs() > 0.4) {
        setState(() => _tiltDegrees = off);
      }
    });
  }

  Future<void> _start() async {
    try {
      final cams = await availableCameras();
      final back = cams.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cams.first,
      );
      final c = CameraController(back, ResolutionPreset.high,
          enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
      await c.initialize();
      // The torch stays ON for every shot. It is the light being moved.
      await c.setFlashMode(FlashMode.torch);
      await c.setFocusMode(FocusMode.auto);
      if (!mounted) {
        await c.dispose();
        return;
      }
      setState(() => _cam = c);
      _say(_instruction(0));
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    }
  }

  @override
  void dispose() {
    _tilt?.cancel();
    final c = _cam;
    _cam = null;
    c?.setFlashMode(FlashMode.off).catchError((_) {}).whenComplete(() => c.dispose());
    for (final p in _taken) {
      try {
        File(p).deleteSync();
      } catch (_) {
        // a leftover in the cache is not worth failing over
      }
    }
    super.dispose();
  }

  bool get _level => _tiltDegrees <= _maxTiltDegrees;

  String _instruction(int shot) {
    final l = context.l10n;
    return switch (shot) {
      0 => l.shapeStepLeft,
      1 => l.shapeStepRight,
      2 => l.shapeStepAway,
      _ => l.shapeStepNear,
    };
  }

  /// Says it out loud through whatever screen reader the person already uses,
  /// rather than carrying a speech engine of our own. Somebody who cannot see
  /// the preview can still be told where to hold the phone, which is the one
  /// thing every scanner app leaves them without.
  void _say(String text) {
    if (!mounted) return;
    SemanticsService.sendAnnouncement(
      View.of(context),
      text,
      Directionality.of(context),
      // assertive: the person is holding a phone over a document waiting to be
      // told where to move it, so this must interrupt rather than queue behind
      // whatever the screen reader was saying about the buttons.
      assertiveness: Assertiveness.assertive,
    );
  }

  Future<void> _capture() async {
    final c = _cam;
    if (c == null || _busy) return;
    final l = context.l10n;
    if (!_level) {
      HapticFeedback.heavyImpact();
      _say(l.shapeHoldFlat);
      context.snack(l.shapeHoldFlat);
      return;
    }
    setState(() => _busy = true);
    try {
      final shot = await c.takePicture();
      _taken.add(shot.path);
      HapticFeedback.mediumImpact();
      if (_taken.length < 4) {
        setState(() {
          _shot = _taken.length;
          _busy = false;
        });
        _say(_instruction(_shot));
        return;
      }
      _say(l.shapeWorking);
      final out = '${Directory.systemTemp.path}/shape_${DateTime.now().millisecondsSinceEpoch}.jpg';
      if (widget.mode == ShapeMode.relief) {
        await Engine.relief(_taken, out);
      } else {
        await Engine.deglare(_taken, out);
      }
      if (!mounted) return;
      setState(() {
        _result = out;
        _busy = false;
      });
      HapticFeedback.heavyImpact();
      _say(l.shapeDone);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    final title = widget.mode == ShapeMode.relief ? l.shapeReliefTitle : l.shapeGlareTitle;

    if (_result != null) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(children: [
          Expanded(child: InteractiveViewer(child: Image.file(File(_result!)))),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() {
                    _result = null;
                    _taken.clear();
                    _shot = 0;
                  }),
                  child: Text(l.shapeAgain),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.pop(context, _result),
                  child: Text(l.shapeKeep),
                ),
              ),
            ]),
          ),
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _error != null
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(l.shapeCameraFailed(_error!),
                    style: TextStyle(color: cs.error)),
              ),
            )
          : _cam == null
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  Expanded(child: CameraPreview(_cam!)),
                  Container(
                    width: double.infinity,
                    color: cs.surfaceContainerHighest,
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                    child: Column(children: [
                      Semantics(
                        liveRegion: true,
                        child: Text(
                          _instruction(_shot),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(l.shapeShotOf(_taken.length + 1, 4),
                          style: TextStyle(color: cs.onSurfaceVariant)),
                      const SizedBox(height: 12),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(_level ? Icons.check_circle : Icons.warning_amber,
                            color: _level ? cs.primary : cs.error, size: 20),
                        const SizedBox(width: 8),
                        Text(_level ? l.shapeFlat : l.shapeHoldFlat,
                            style: TextStyle(color: _level ? cs.primary : cs.error)),
                      ]),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: _busy ? null : _capture,
                          icon: const Icon(Icons.camera),
                          label: Text(_busy ? l.shapeWorking : l.shapeTake),
                        ),
                      ),
                    ]),
                  ),
                ]),
    );
  }
}
