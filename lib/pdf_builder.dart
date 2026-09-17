import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'engine.dart';
import 'ocr.dart';
import 'prefs.dart';
import 'store.dart';

/// Builds the PDF for a document: one page per image (JPEG bytes embedded as
/// they are), plus an invisible OCR text layer so the PDF is searchable.
class PdfBuilder {
  static Uint8List? _notoBytes;

  static Future<Uint8List> build(Doc d,
      {void Function(int done, int total)? onProgress}) async {
    final doc = pw.Document(
      title: d.name,
      author: 'BRIDGE PHOTO',
      creator: 'BRIDGE PHOTO',
      compress: true,
    );
    final sizeMode = Prefs.pdfSize;
    final withText = Prefs.pdfOcr;

    final latin = pw.Font.helvetica();
    pw.Font? noto; // loaded only when a page has non-Latin text

    for (var i = 0; i < d.pages.length; i++) {
      final p = d.pages[i];
      final bytes = await d.pageFile(p).readAsBytes();
      // MemoryImage reads the JPEG header and EXIF orientation, the same
      // numbers drawImage will use, so the text layer lines up.
      final image = pw.MemoryImage(bytes);
      final iw = (image.width ?? 1000).toDouble();
      final ih = (image.height ?? 1414).toDouble();

      OcrResult? ocr;
      if (withText) {
        try {
          ocr = await Ocr.page(d, p);
        } catch (_) {
          ocr = null; // OCR unavailable (model not downloaded yet): image-only page
        }
      }
      if (ocr != null && noto == null && _needsNoto(ocr)) {
        noto = await _loadNoto();
      }

      final lay = _layout(sizeMode, iw, ih);
      final text = ocr;
      final notoFont = noto;

      doc.addPage(pw.Page(
        pageFormat: PdfPageFormat(lay.pw, lay.ph),
        margin: pw.EdgeInsets.zero,
        build: (ctx) => pw.CustomPaint(
          size: PdfPoint(lay.pw, lay.ph),
          painter: (canvas, size) {
            canvas.drawImage(image.resolve(ctx, PdfPoint(lay.w, lay.h)),
                lay.x, lay.y, lay.w, lay.h);
            if (text != null) {
              _drawTextLayer(canvas, ctx, text, lay, latin, notoFont);
            }
          },
        ),
      ));
      onProgress?.call(i + 1, d.pages.length);
    }
    return doc.save();
  }

  // ---- text layer

  static void _drawTextLayer(PdfGraphics canvas, pw.Context ctx, OcrResult ocr,
      _Layout lay, pw.Font latin, pw.Font? noto) {
    if (ocr.w <= 0 || ocr.h <= 0) return;
    final s = lay.w / ocr.w; // PDF points per image pixel
    final latinFont = latin.getFont(ctx);
    final notoFont = noto?.getFont(ctx);
    for (final ln in ocr.lines) {
      final txt = ln.text.trim();
      if (txt.isEmpty) continue;
      final boxW = (ln.r - ln.l) * s;
      final boxH = (ln.b - ln.t) * s;
      if (boxW <= 0.5 || boxH <= 0.5) continue;
      final fontSize = boxH * 0.8;
      final x0 = lay.x + ln.l * s;
      final y0 = lay.y + lay.h - ln.b * s + boxH * 0.15; // baseline

      // Split into runs: Latin-1 goes to Helvetica, the rest to Noto.
      final runs = _runs(txt);
      final widths = <double>[];
      var total = 0.0;
      for (final r in runs) {
        final f = r.latin ? latinFont : notoFont;
        if (f == null) {
          widths.add(0);
          continue;
        }
        final w = f.stringMetrics(r.text).advanceWidth * fontSize;
        widths.add(w);
        total += w;
      }
      if (total <= 0) continue;
      final scale = (boxW / total).clamp(0.2, 6.0);
      var cx = x0;
      for (var i = 0; i < runs.length; i++) {
        final r = runs[i];
        final f = r.latin ? latinFont : notoFont;
        if (f == null || widths[i] <= 0) continue;
        canvas.drawString(f, fontSize, r.text, cx, y0,
            mode: PdfTextRenderingMode.invisible, scale: scale);
        cx += widths[i] * scale;
      }
    }
  }

  static List<_Run> _runs(String text) {
    final out = <_Run>[];
    final buf = StringBuffer();
    bool? cur;
    for (final cp in text.runes) {
      final isLatin = cp <= 0xFF;
      if (cur != null && isLatin != cur) {
        out.add(_Run(buf.toString(), cur));
        buf.clear();
      }
      cur = isLatin;
      buf.writeCharCode(cp);
    }
    if (buf.isNotEmpty && cur != null) out.add(_Run(buf.toString(), cur));
    return out;
  }

  static bool _needsNoto(OcrResult r) =>
      r.lines.any((l) => l.text.runes.any((c) => c > 0xFF));

  static Future<pw.Font?> _loadNoto() async {
    try {
      _notoBytes ??= (await rootBundle
              .load('assets/fonts/NotoSansDevanagari-Regular.ttf'))
          .buffer
          .asUint8List();
      return pw.Font.ttf(ByteData.sublistView(_notoBytes!));
    } catch (_) {
      return null;
    }
  }

  // ---- page layout

  static _Layout _layout(String mode, double iw, double ih) {
    double pw_, ph;
    switch (mode) {
      case 'letter':
        pw_ = PdfPageFormat.letter.width;
        ph = PdfPageFormat.letter.height;
        break;
      case 'fit':
        // Page takes the image's shape; longest side = A4 height.
        final k = PdfPageFormat.a4.height / (iw > ih ? iw : ih);
        return _Layout(iw * k, ih * k, 0, 0, iw * k, ih * k);
      default:
        pw_ = PdfPageFormat.a4.width;
        ph = PdfPageFormat.a4.height;
    }
    // Landscape images get a landscape page.
    if (iw > ih) {
      final t = pw_;
      pw_ = ph;
      ph = t;
    }
    final k = (pw_ / iw) < (ph / ih) ? (pw_ / iw) : (ph / ih);
    final w = iw * k, h = ih * k;
    return _Layout(pw_, ph, (pw_ - w) / 2, (ph - h) / 2, w, h);
  }
}

class _Layout {
  final double pw, ph, x, y, w, h;
  const _Layout(this.pw, this.ph, this.x, this.y, this.w, this.h);
}

class _Run {
  final String text;
  final bool latin;
  const _Run(this.text, this.latin);
}
