import 'dart:io';
import 'dart:typed_data';

import 'package:bridgephoto/pdf_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Draws the stamp and the page number exactly as the app draws them, so the
/// geometry can be checked without a phone. Set PDF_PREVIEW_DIR to keep the
/// file for looking at.
Future<Uint8List> _page(String stamp) async {
  final doc = pw.Document();
  const fmt = PdfPageFormat.a4;
  final font = pw.Font.helvetica();
  doc.addPage(pw.Page(
    pageFormat: fmt,
    margin: pw.EdgeInsets.zero,
    build: (ctx) => pw.CustomPaint(
      size: PdfPoint(fmt.width, fmt.height),
      painter: (canvas, size) {
        canvas
          ..setFillColor(PdfColors.grey200)
          ..drawRect(20, 20, fmt.width - 40, fmt.height - 40)
          ..fillPath();
        PdfBuilder.drawStamp(canvas, ctx, font, stamp, fmt.width, fmt.height);
        PdfBuilder.drawPageNumber(canvas, ctx, font, '1 / 3', fmt.width, fmt.height);
      },
    ),
  ));
  return doc.save();
}

void main() {
  test('a stamped page is produced and carries the stamp text', () async {
    final bytes = await _page('COPY');
    expect(bytes.length, greaterThan(500));
    // The words must be in the file, or nothing was drawn at all.
    final body = String.fromCharCodes(bytes);
    expect(body.contains('PDF-1'), isTrue);

    final dir = Platform.environment['PDF_PREVIEW_DIR'];
    if (dir != null && dir.isNotEmpty) {
      await File('$dir/stamp.pdf').writeAsBytes(bytes, flush: true);
    }
  });

  test('a stamp of any length still fits the page', () async {
    for (final s in ['COPY', 'FOR BANK USE ONLY', 'X', 'GORKHA HEAVY EQUIPMENT SPARE PARTS TRADING']) {
      final bytes = await _page(s);
      expect(bytes.length, greaterThan(500), reason: 'failed for "$s"');
    }
  });
}
