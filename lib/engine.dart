import 'dart:io';

import 'package:flutter/services.dart';

/// One recognised line of text with its box in ORIGINAL image pixels
/// (origin top-left).
class OcrLine {
  final String text;
  final int l, t, r, b;
  const OcrLine(this.text, this.l, this.t, this.r, this.b);

  Map<String, dynamic> toJson() => {'text': text, 'l': l, 't': t, 'r': r, 'b': b};

  factory OcrLine.fromJson(Map<String, dynamic> j) => OcrLine(
        (j['text'] ?? '') as String,
        (j['l'] as num).toInt(),
        (j['t'] as num).toInt(),
        (j['r'] as num).toInt(),
        (j['b'] as num).toInt(),
      );
}

/// OCR result for one page image.
class OcrResult {
  final int w, h;
  final List<OcrLine> lines;
  const OcrResult(this.w, this.h, this.lines);

  String get text => lines.map((e) => e.text).join('\n');

  Map<String, dynamic> toJson() =>
      {'w': w, 'h': h, 'lines': lines.map((e) => e.toJson()).toList()};

  factory OcrResult.fromJson(Map<String, dynamic> j) => OcrResult(
        (j['w'] as num).toInt(),
        (j['h'] as num).toInt(),
        ((j['lines'] as List?) ?? const [])
            .map((e) => OcrLine.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
      );
}

/// The user cancelled the scanner. Not an error.
class ScanCancelled implements Exception {}

/// Bridge to the small native engine (Kotlin on Android, Swift on iOS).
/// Android: Google ML Kit document scanner + text recognition, PDFBox.
/// iOS: VisionKit document camera, Vision text recognition, PDFKit.
class Engine {
  static const MethodChannel _ch = MethodChannel('bridgephoto/engine');

  static bool get isAndroid => Platform.isAndroid;

  /// Android only: pages of a scan that finished after the activity was
  /// recreated behind the scanner (nobody was awaiting them). Set by the
  /// home screen so nothing is lost.
  static void Function(List<String> paths)? onPendingScan;

  /// Scanner lifecycle from the native side: 'preparing' (waiting for Google
  /// Play services, slow on first use), 'open' (camera showing), 'closed'.
  static void Function(String state)? onScanState;

  static void init() {
    _ch.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'pendingScan':
          final paths = ((call.arguments as List?) ?? const []).cast<String>();
          if (paths.isNotEmpty) onPendingScan?.call(paths);
        case 'scanState':
          onScanState?.call(call.arguments as String? ?? '');
      }
      return null;
    });
  }

  /// The crash report written by the previous run, if any. Reading it
  /// deletes it. Nothing is ever sent unless the user shares it.
  static Future<String?> takeCrashLog() async {
    try {
      return await _ch.invokeMethod<String>('takeCrashLog');
    } catch (_) {
      return null;
    }
  }

  /// Records a Dart-side error in the same private crash file.
  static Future<void> logError(String text) async {
    try {
      await _ch.invokeMethod('logError', {'text': text});
    } catch (_) {
      // never let logging fail the app
    }
  }

  /// Android: ask Play services to download the scanner module in the
  /// background so the first Scan is quick. Harmless elsewhere.
  static Future<void> warmUp() async {
    if (!isAndroid) return;
    try {
      await _ch.invokeMethod('warmUp');
    } catch (_) {
      // best effort
    }
  }

  /// Fetches (and clears) parked pages saved while the app was not listening.
  static Future<List<String>> takePendingScan() async {
    try {
      final r = await _ch.invokeMethod<List<dynamic>>('takePendingScan');
      return (r ?? const []).cast<String>();
    } catch (_) {
      return const [];
    }
  }

  /// Opens the platform document scanner. Returns the JPEG files it produced
  /// (already cropped, straightened and upright). Empty when cancelled.
  static Future<List<String>> scan({
    required String mode,
    required bool gallery,
    required int pageLimit,
  }) async {
    final r = await _ch.invokeMethod<List<dynamic>>('scan', {
      'mode': mode,
      'gallery': gallery,
      'pageLimit': pageLimit,
    });
    return (r ?? const []).cast<String>();
  }

  /// On-device text recognition. [script] is latin, devanagari or auto.
  static Future<OcrResult> ocr(String path, String script) async {
    final m = await _ch.invokeMapMethod<String, dynamic>('ocr', {
      'path': path,
      'script': script,
    });
    return OcrResult.fromJson(m ?? const {'w': 0, 'h': 0, 'lines': []});
  }

  /// Lossless merge of existing PDF files into [output].
  static Future<void> mergePdf(List<String> inputs, String output) =>
      _ch.invokeMethod('mergePdf', {'inputs': inputs, 'output': output});

  /// Renders every page of a PDF to a JPEG in [outDir]. Returns the files.
  static Future<List<String>> renderPdf(String input, String outDir,
      {int maxDim = 2200}) async {
    final r = await _ch.invokeMethod<List<dynamic>>('renderPdf', {
      'input': input,
      'outDir': outDir,
      'maxDim': maxDim,
    });
    return (r ?? const []).cast<String>();
  }

  /// Rotates and/or re-encodes an image. [format] is jpg or png.
  /// [input] and [output] may be the same file.
  static Future<void> transform(String input, String output,
          {int rotate = 0, String format = 'jpg', int quality = 92}) =>
      _ch.invokeMethod('transform', {
        'input': input,
        'output': output,
        'rotate': rotate,
        'format': format,
        'quality': quality,
      });

  /// Saves an image into the system photo gallery. Returns false when the
  /// platform cannot do it (Android 9 and older, or Photos access denied on
  /// iOS). Real failures throw a [PlatformException].
  static Future<bool> saveToGallery(String path, String mime, String name) async =>
      await _ch.invokeMethod<bool>('saveToGallery', {
        'path': path,
        'mime': mime,
        'name': name,
      }) ??
      false;
}
