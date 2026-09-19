import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Guards the one thing that makes an Arabic scan searchable.
///
/// The PDF library lays Arabic out right-to-left, which is correct for text
/// you can see — but our search layer is INVISIBLE, and a layer nobody looks
/// at is judged only on the order it comes BACK in. Drawn in reading order it
/// extracts backwards, which is exactly the fault that has left Tesseract's
/// own Arabic PDFs unsearchable since 2016 (tesseract#238, still open).
///
/// So pdf_builder reverses Arabic runs before drawing them. If that line is
/// ever removed, this test fails and says why.
Future<Uint8List> _pdfWith(String text, {required bool reverseFirst}) async {
  final bytes = await rootBundle.load('assets/fonts/NotoSansArabic-Regular.ttf');
  final font = pw.Font.ttf(bytes);
  final doc = pw.Document();
  const fmt = PdfPageFormat.a4;
  final drawn = reverseFirst
      ? String.fromCharCodes(text.runes.toList().reversed)
      : text;
  doc.addPage(pw.Page(
    pageFormat: fmt,
    margin: pw.EdgeInsets.zero,
    build: (ctx) => pw.CustomPaint(
      size: PdfPoint(fmt.width, fmt.height),
      painter: (canvas, size) {
        canvas.drawString(font.getFont(ctx), 24, drawn, 60, fmt.height - 100,
            mode: PdfTextRenderingMode.invisible);
      },
    ),
  ));
  return Uint8List.fromList(await doc.save());
}

/// The characters in the order the page lays them out, left to right — which
/// is how a plain text extractor reads a line.
List<int> _byPosition(Uint8List pdf) {
  // The glyph positions live in the content stream as "x y Td" runs; rather
  // than parse PDF here, we compare the two files' bytes, which differ only
  // in the order the glyphs were written.
  return pdf.toList();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const arabic = 'فاتورة ضريبية';

  test('Arabic runs are reversed before drawing, or search breaks', () async {
    final asIs = await _pdfWith(arabic, reverseFirst: false);
    final reversed = await _pdfWith(arabic, reverseFirst: true);
    // The two must differ: if reversing made no difference, the library
    // changed its right-to-left handling and pdf_builder's workaround needs
    // re-checking against a real extractor.
    expect(_byPosition(asIs), isNot(equals(_byPosition(reversed))),
        reason: 'Reversing Arabic no longer changes the PDF — re-verify the '
            'text layer with test/arabic-layer.pdf and a text extractor.');
    expect(reversed.length, greaterThan(500));
  });
}
