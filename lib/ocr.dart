import 'dart:convert';

import 'engine.dart';
import 'prefs.dart';
import 'reading_order.dart';
import 'store.dart';

/// OCR with a per-page cache file next to the image.
class Ocr {
  /// Bumped whenever the reading order changes, so cached text is redone
  /// instead of being served in the old order for ever.
  static const _orderVersion = 1;

  static Future<OcrResult> page(Doc d, String p, {bool force = false}) async {
    final script = Prefs.ocrScriptForEngine;
    final quality = Prefs.ocrQuality;
    final f = d.ocrFile(p);
    if (!force && await f.exists()) {
      try {
        final j = jsonDecode(await f.readAsString()) as Map<String, dynamic>;
        // `order` marks text that has been put into reading order. Pages
        // recognised before that existed are read again rather than served
        // in the jumbled order they were cached in.
        if (j['script'] == script &&
            (j['quality'] ?? 'best') == quality &&
            j['order'] == _orderVersion) {
          return OcrResult.fromJson(j);
        }
      } catch (_) {
        // fall through and recognise again
      }
    }
    // Straight from recognition the lines run top to bottom, which turns two
    // columns into nonsense. Put them in reading order ONCE, here, so the
    // text screen, search, the PDF layer and the name all get the same
    // sensible order without each of them having to think about it.
    final r = ReadingOrder.sort(
        await Engine.ocr(d.pageFile(p).path, script, maxDim: Prefs.ocrMaxDim));
    final j = r.toJson()
      ..['script'] = script
      ..['quality'] = quality
      ..['order'] = _orderVersion;
    await f.writeAsString(jsonEncode(j), flush: true);
    return r;
  }

  /// The whole document as text, pages separated by a marker.
  static Future<String> document(Doc d,
      {bool force = false,
      void Function(int done, int total)? onProgress,
      String Function(int pageNumber)? separator}) async {
    final buf = StringBuffer();
    for (var i = 0; i < d.pages.length; i++) {
      final r = await page(d, d.pages[i], force: force);
      if (d.pages.length > 1) {
        buf.writeln(separator?.call(i + 1) ?? '--- Page ${i + 1} ---');
      }
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
