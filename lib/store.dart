import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// A scanned document: an ordered list of page image files in its own folder.
class Doc {
  final String id;
  String name;
  final int created;
  int modified;
  final List<String> pages; // file names inside [dir], in page order

  Doc(this.id, this.name, this.created, this.modified, this.pages);

  Directory get dir => Directory('${DocStore.root.path}/$id');
  File pageFile(String p) => File('${dir.path}/$p');
  File ocrFile(String p) => File('${dir.path}/$p.ocr.json');
  File? get cover => pages.isEmpty ? null : pageFile(pages.first);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created': created,
        'modified': modified,
        'pages': pages,
      };

  factory Doc.fromJson(Map<String, dynamic> j) => Doc(
        j['id'] as String,
        (j['name'] ?? '') as String,
        (j['created'] as num?)?.toInt() ?? 0,
        (j['modified'] as num?)?.toInt() ?? 0,
        ((j['pages'] as List?) ?? const []).cast<String>().toList(),
      );
}

/// Everything lives in the app's private documents folder:
/// `docs/ID/meta.json`, `docs/ID/p_*.jpg`, `docs/ID/p_*.jpg.ocr.json`
class DocStore {
  static late Directory root;
  static int _seq = 0;

  static Future<void> init() async {
    final base = await getApplicationDocumentsDirectory();
    root = Directory('${base.path}/docs');
    await root.create(recursive: true);
  }

  static Future<List<Doc>> list() async {
    final out = <Doc>[];
    await for (final e in root.list()) {
      if (e is! Directory) continue;
      final d = await _read(e);
      if (d != null) out.add(d);
    }
    out.sort((a, b) => b.modified.compareTo(a.modified));
    return out;
  }

  static Future<Doc?> load(String id) => _read(Directory('${root.path}/$id'));

  static Future<Doc?> _read(Directory dir) async {
    final meta = File('${dir.path}/meta.json');
    if (!await meta.exists()) return null;
    try {
      final j = jsonDecode(await meta.readAsString()) as Map<String, dynamic>;
      final d = Doc.fromJson(j);
      // Drop pages whose file went missing.
      d.pages.removeWhere((p) => !d.pageFile(p).existsSync());
      return d;
    } catch (_) {
      return null;
    }
  }

  static Future<Doc> create(String name) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final d = Doc('d${now}_${_seq++}', name, now, now, []);
    await d.dir.create(recursive: true);
    await save(d);
    return d;
  }

  static Future<void> save(Doc d) async {
    d.modified = DateTime.now().millisecondsSinceEpoch;
    final meta = File('${d.dir.path}/meta.json');
    final tmp = File('${d.dir.path}/meta.json.tmp');
    await tmp.writeAsString(jsonEncode(d.toJson()), flush: true);
    await tmp.rename(meta.path);
  }

  static Future<void> delete(Doc d) async {
    if (await d.dir.exists()) await d.dir.delete(recursive: true);
  }

  static String newPageName() =>
      'p_${DateTime.now().millisecondsSinceEpoch}_${_seq++}.jpg';

  /// Copies (or moves) an image file into the document as its last page.
  static Future<String> addPageFile(Doc d, String srcPath,
      {bool move = false}) async {
    final name = newPageName();
    final dst = d.pageFile(name);
    final src = File(srcPath);
    if (move) {
      try {
        await src.rename(dst.path);
      } on FileSystemException {
        await src.copy(dst.path);
        try {
          await src.delete();
        } catch (_) {}
      }
    } else {
      await src.copy(dst.path);
    }
    d.pages.add(name);
    return name;
  }

  static Future<void> removePage(Doc d, String p) async {
    d.pages.remove(p);
    for (final f in [d.pageFile(p), d.ocrFile(p)]) {
      if (await f.exists()) await f.delete();
    }
  }

  /// A new document made of copies of all pages of [docs], in order.
  static Future<Doc> merge(String name, List<Doc> docs) async {
    final out = await create(name);
    for (final d in docs) {
      for (final p in d.pages) {
        final n = await addPageFile(out, d.pageFile(p).path);
        final ocr = d.ocrFile(p);
        if (await ocr.exists()) await ocr.copy(out.ocrFile(n).path);
      }
    }
    await save(out);
    return out;
  }

  /// Date-time stamp used in default names: "2026-09-18 08.05".
  static String stamp([DateTime? at]) {
    final t = at ?? DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    return '${t.year}-${two(t.month)}-${two(t.day)} ${two(t.hour)}.${two(t.minute)}';
  }

  static String defaultName([DateTime? at]) => 'Scan ${stamp(at)}';

  /// A file name that is safe on every platform.
  static String safeName(String n) {
    final s = n.replaceAll(RegExp(r'[^A-Za-z0-9 _\-\.]'), '_').trim();
    return s.isEmpty ? 'document' : s;
  }
}
