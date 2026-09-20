import 'dart:typed_data';

import 'package:bridgephoto/engine.dart';
import 'package:bridgephoto/pdf_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// The stamp has to be VISIBLE on a page that also carries the searchable
/// text layer — which is nearly every page, since the text layer is on by
/// default.
///
/// It was not. "Invisible" is a text state the PDF carries forward until
/// something changes it, written into the file as `3 Tr`, and the pdf package
/// only writes that operator out when the mode is not the ordinary one. So
/// the text layer switched the page to invisible, the stamp asked for
/// ordinary text, nothing was written, and the stamp inherited the
/// invisibility. On the phone the stamp appeared on exactly one page of nine:
/// the blank one, the only page with no text to make searchable.
///
/// Reading the pixels back cannot catch this — an invisible stamp and no
/// stamp look identical. So this reads the page's instructions and works out
/// which text state each piece of text is actually drawn in.
void main() {
  test('the stamp is drawn visibly on a page that has a text layer', () async {
    final bytes = await _pageWithTextLayerAndStamp();
    final modes = _renderModesOfDrawnText(bytes);

    expect(modes, isNotEmpty, reason: 'nothing was drawn at all');
    expect(modes.where((m) => m == 3).length, greaterThan(0),
        reason: 'the searchable text layer should be invisible (3 Tr)');
    expect(modes.last, 0,
        reason: 'the stamp is drawn last and must be ordinary, visible text');
  });

  test('a stamp on a page with no text layer is visible too', () async {
    final bytes = await _pageWithTextLayerAndStamp(withTextLayer: false);
    final modes = _renderModesOfDrawnText(bytes);
    expect(modes, isNotEmpty, reason: 'nothing was drawn at all');
    expect(modes, everyElement(0));
  });
}

/// One page built the way the app builds one: an invisible text layer, then
/// the stamp on top.
Future<Uint8List> _pageWithTextLayerAndStamp({bool withTextLayer = true}) async {
  // Uncompressed so the page's instructions can simply be read.
  final doc = pw.Document(compress: false);
  const fmt = PdfPageFormat.a4;
  final font = pw.Font.helvetica();
  doc.addPage(pw.Page(
    pageFormat: fmt,
    margin: pw.EdgeInsets.zero,
    build: (ctx) => pw.CustomPaint(
      size: PdfPoint(fmt.width, fmt.height),
      painter: (canvas, size) {
        if (withTextLayer) {
          // The REAL text layer, not a copy of it. A copy would keep passing
          // however pdf_builder changed.
          PdfBuilder.drawTextLayerOnPage(
            canvas,
            ctx,
            const OcrResult(600, 850, [OcrLine('TAX INVOICE', 40, 60, 300, 90)]),
            fmt.width,
            fmt.height,
            font,
          );
        }
        PdfBuilder.drawStamp(canvas, ctx, font, 'COPY', fmt.width, fmt.height);
      },
    ),
  ));
  return Uint8List.fromList(await doc.save());
}

/// Walks the page's instructions and returns, for each piece of text drawn,
/// the text rendering mode in force at that moment. 0 is ordinary visible
/// text; 3 is invisible. `q` and `Q` save and restore the state, and `Tr`
/// sets it.
List<int> _renderModesOfDrawnText(Uint8List pdf) {
  final content = _contentStreams(pdf);
  final modes = <int>[];
  var mode = 0;
  final stack = <int>[];
  // The operators are not all separated by spaces — text comes out as
  // `[(COPY)]TJ` — so these are matched in the order they appear rather than
  // split on whitespace.
  final op = RegExp(r'(?<![\w/])([qQ])(?![\w])|(\d+)\s+Tr\b|[\]\)]\s*(TJ|Tj)\b');
  for (final m in op.allMatches(content)) {
    if (m.group(1) == 'q') {
      stack.add(mode);
    } else if (m.group(1) == 'Q') {
      if (stack.isNotEmpty) mode = stack.removeLast();
    } else if (m.group(2) != null) {
      mode = int.parse(m.group(2)!);
    } else {
      modes.add(mode);
    }
  }
  return modes;
}

/// The uncompressed page instructions. The pdf package writes these streams
/// uncompressed when asked, but to stay independent of that this simply takes
/// whatever is readable between `stream` and `endstream`.
String _contentStreams(Uint8List pdf) {
  final text = String.fromCharCodes(pdf);
  final out = StringBuffer();
  for (final m in RegExp(r'stream\r?\n(.*?)endstream', dotAll: true)
      .allMatches(text)) {
    final body = m.group(1)!;
    // Skip anything that is plainly binary (an image or a compressed stream);
    // page instructions are ASCII operators.
    final printable =
        body.codeUnits.where((c) => c == 10 || c == 13 || (c >= 32 && c < 127)).length;
    if (body.isNotEmpty && printable / body.length > 0.95) out.writeln(body);
  }
  return out.toString();
}
