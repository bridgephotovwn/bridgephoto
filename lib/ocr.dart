import 'dart:convert';

import 'engine.dart';
import 'prefs.dart';
import 'store.dart';

/// OCR with a per-page cache file next to the image.
class Ocr {
  static Future<OcrResult> page(Doc d, String p, {bool force = false}) async {
    final script = Prefs.ocrScriptForEngine;
    final f = d.ocrFile(p);
    if (!force && await f.exists()) {
      try {
        final j = jsonDecode(await f.readAsString()) as Map<String, dynamic>;
        if (j['script'] == script) return OcrResult.fromJson(j);
      } catch (_) {
        // fall through and recognise again
      }
    }
    final r = await Engine.ocr(d.pageFile(p).path, script);
    final j = r.toJson()..['script'] = script;
    await f.writeAsString(jsonEncode(j), flush: true);
    return r;
  }

  /// The whole document as text, pages separated by a marker.
  static Future<String> document(Doc d,
      {bool force = false, void Function(int done, int total)? onProgress}) async {
    final buf = StringBuffer();
    for (var i = 0; i < d.pages.length; i++) {
      final r = await page(d, d.pages[i], force: force);
      if (d.pages.length > 1) buf.writeln('--- Page ${i + 1} ---');
      buf.writeln(r.text.trim());
      buf.writeln();
      onProgress?.call(i + 1, d.pages.length);
    }
    return buf.toString().trim();
  }

  /// Forget cached results (after a page was rotated, for example).
  static Future<void> invalidate(Doc d, String p) async {
    final f = d.ocrFile(p);
    if (await f.exists()) await f.delete();
  }
}
