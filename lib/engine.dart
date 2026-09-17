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
  /// platform cannot do it without extra permissions (Android 9 and older).
  static Future<bool> saveToGallery(String path, String mime, String name) async {
    try {
      return await _ch.invokeMethod<bool>('saveToGallery', {
            'path': path,
            'mime': mime,
            'name': name,
          }) ??
          false;
    } on PlatformException {
      return false;
    }
  }
}
