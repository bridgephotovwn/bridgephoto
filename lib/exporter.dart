import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'engine.dart';
import 'pdf_builder.dart';
import 'store.dart';

typedef Progress = void Function(int done, int total);

/// Share / save helpers. Files for sharing are staged in the cache folder.
class Exporter {
  static Future<Directory> _shareDir() async {
    final d = Directory('${(await getTemporaryDirectory()).path}/share');
    await d.create(recursive: true);
    return d;
  }

  /// Anchors the iPad share popover; harmless elsewhere.
  static Rect _origin(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), width: 1, height: 1);
  }

  static Future<File> pdfFile(Doc d, {Progress? progress}) async {
    final bytes = await PdfBuilder.build(d, onProgress: progress);
    final f = File('${(await _shareDir()).path}/${DocStore.safeName(d.name)}.pdf');
    await f.writeAsBytes(bytes, flush: true);
    return f;
  }

  static Future<void> sharePdf(BuildContext context, Doc d,
      {Progress? progress}) async {
    final f = await pdfFile(d, progress: progress);
    if (!context.mounted) return;
    await SharePlus.instance.share(ShareParams(
      files: [XFile(f.path, mimeType: 'application/pdf')],
      subject: d.name,
      sharePositionOrigin: _origin(context),
    ));
  }

  /// Opens the system "save as" dialog. Returns the saved path or null.
  static Future<String?> savePdf(Doc d, {Progress? progress}) async {
    final bytes = await PdfBuilder.build(d, onProgress: progress);
    return FilePicker.platform.saveFile(
      dialogTitle: 'Save PDF',
      fileName: '${DocStore.safeName(d.name)}.pdf',
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      bytes: bytes,
    );
  }

  static Future<String?> saveBytes(String fileName, Uint8List bytes,
      {String? ext}) {
    return FilePicker.platform.saveFile(
      dialogTitle: 'Save',
      fileName: fileName,
      type: ext == null ? FileType.any : FileType.custom,
      allowedExtensions: ext == null ? null : [ext],
      bytes: bytes,
    );
  }

  /// Page images as files ready to share or save. [format] jpg or png.
  static Future<List<File>> imageFiles(Doc d, String format,
      {Progress? progress, List<String>? only}) async {
    final pages = only ?? d.pages;
    final dir = await _shareDir();
    final base = DocStore.safeName(d.name);
    final out = <File>[];
    for (var i = 0; i < pages.length; i++) {
      final src = d.pageFile(pages[i]);
      final n = pages.length == 1 ? base : '$base-${(i + 1).toString().padLeft(2, '0')}';
      if (format == 'png') {
        final f = File('${dir.path}/$n.png');
        await Engine.transform(src.path, f.path, format: 'png');
        out.add(f);
      } else {
        final f = File('${dir.path}/$n.jpg');
        await src.copy(f.path);
        out.add(f);
      }
      progress?.call(i + 1, pages.length);
    }
    return out;
  }

  static Future<void> shareImages(BuildContext context, List<File> files,
      String format) async {
    final mime = format == 'png' ? 'image/png' : 'image/jpeg';
    await SharePlus.instance.share(ShareParams(
      files: files.map((f) => XFile(f.path, mimeType: mime)).toList(),
      sharePositionOrigin: _origin(context),
    ));
  }

  /// Returns how many were saved, or -1 when the platform cannot save
  /// to the gallery without extra permissions.
  static Future<int> saveImagesToGallery(List<File> files, String format) async {
    final mime = format == 'png' ? 'image/png' : 'image/jpeg';
    var n = 0;
    for (final f in files) {
      final ok = await Engine.saveToGallery(f.path, mime, f.uri.pathSegments.last);
      if (!ok) return n == 0 ? -1 : n;
      n++;
    }
    return n;
  }

  static Future<void> shareText(BuildContext context, String text,
      {String? subject}) {
    return SharePlus.instance.share(ShareParams(
      text: text,
      subject: subject,
      sharePositionOrigin: _origin(context),
    ));
  }

  static Future<void> shareFiles(BuildContext context, List<File> files,
      String mime, {String? subject}) {
    return SharePlus.instance.share(ShareParams(
      files: files.map((f) => XFile(f.path, mimeType: mime)).toList(),
      subject: subject,
      sharePositionOrigin: _origin(context),
    ));
  }

  static Future<void> shareFile(BuildContext context, File f, String mime,
      {String? subject}) {
    return SharePlus.instance.share(ShareParams(
      files: [XFile(f.path, mimeType: mime)],
      subject: subject,
      sharePositionOrigin: _origin(context),
    ));
  }

  /// Merges existing PDF files (lossless) into a temp file and returns it.
  static Future<File> mergePdfFiles(List<String> paths, String name) async {
    final f = File('${(await _shareDir()).path}/${DocStore.safeName(name)}.pdf');
    if (await f.exists()) await f.delete();
    await Engine.mergePdf(paths, f.path);
    return f;
  }

  /// Renders a PDF into a new document.
  static Future<Doc> importPdf(String path, String name) async {
    final tmp = Directory('${(await getTemporaryDirectory()).path}/import');
    await tmp.create(recursive: true);
    final files = await Engine.renderPdf(path, tmp.path);
    if (files.isEmpty) throw Exception('The PDF has no pages.');
    final d = await DocStore.create(name);
    for (final p in files) {
      await DocStore.addPageFile(d, p, move: true);
    }
    await DocStore.save(d);
    return d;
  }
}
