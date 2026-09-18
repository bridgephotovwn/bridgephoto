import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'ocr.dart';
import 'store.dart';

/// Full-text search over the recognised text of every page. The text comes
/// from the per-page OCR cache files, filled in the background after a scan.
class SearchIndex {
  static final Map<String, String> _text = {}; // doc id -> lower-case text
  static final Set<String> _indexing = {};

  /// Bumps whenever text was added, so lists can refresh.
  static final ValueNotifier<int> version = ValueNotifier<int>(0);

  static String textOf(String id) => _text[id] ?? '';

  /// Reads the cached OCR text of [docs] (fast, no recognition).
  static Future<void> load(List<Doc> docs) async {
    var changed = false;
    for (final d in docs) {
      final buf = StringBuffer();
      for (final p in d.pages) {
        final f = d.ocrFile(p);
        if (!await f.exists()) continue;
        try {
          final j = jsonDecode(await f.readAsString()) as Map<String, dynamic>;
          for (final ln in (j['lines'] as List? ?? const [])) {
            buf.writeln((ln as Map)['text'] ?? '');
          }
        } catch (_) {}
      }
      final t = buf.toString().toLowerCase();
      if (_text[d.id] != t) {
        _text[d.id] = t;
        changed = true;
      }
    }
    _text.removeWhere((id, _) => !docs.any((d) => d.id == id));
    if (changed) version.value++;
  }

  /// Recognises pages that have no cached text yet, one document at a time,
  /// and refreshes the index. Errors (model not downloaded yet) are ignored;
  /// the pages are retried next time.
  static Future<void> indexAll(List<Doc> docs) async {
    for (final d in docs) {
      if (_indexing.contains(d.id)) continue;
      final missing = <String>[];
      for (final p in d.pages) {
        if (!await d.ocrFile(p).exists()) missing.add(p);
      }
      if (missing.isEmpty) continue;
      _indexing.add(d.id);
      try {
        for (final p in missing) {
          try {
            await Ocr.page(d, p);
          } catch (_) {
            break; // engine not ready; try again later
          }
        }
        await load([d]);
      } finally {
        _indexing.remove(d.id);
      }
    }
  }

  static bool matches(Doc d, String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return d.name.toLowerCase().contains(q) || textOf(d.id).contains(q);
  }

  /// A short piece of text around the first match, or null when the match
  /// is in the name only.
  static String? snippet(Doc d, String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return null;
    final t = textOf(d.id);
    final i = t.indexOf(q);
    if (i < 0) return null;
    final start = (i - 24).clamp(0, t.length);
    final end = (i + q.length + 32).clamp(0, t.length);
    var s = t.substring(start, end).replaceAll(RegExp(r'\s+'), ' ').trim();
    if (start > 0) s = '…$s';
    if (end < t.length) s = '$s…';
    return s;
  }
}
