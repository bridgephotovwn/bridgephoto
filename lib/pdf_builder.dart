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
  static Uint8List? _arabicBytes;

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
    pw.Font? arabic; // and only when a page actually has Arabic on it

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
      if (ocr != null) {
        final scripts = _scriptsIn(ocr);
        if (noto == null && scripts.contains(_Script.other)) noto = await _loadNoto();
        if (arabic == null && scripts.contains(_Script.arabic)) {
          arabic = await _loadArabic();
        }
      }

      final lay = _layout(sizeMode, iw, ih);
      final text = ocr;
      final notoFont = noto;
      final arabicFont = arabic;

      doc.addPage(pw.Page(
        pageFormat: PdfPageFormat(lay.pw, lay.ph),
        margin: pw.EdgeInsets.zero,
        build: (ctx) => pw.CustomPaint(
          size: PdfPoint(lay.pw, lay.ph),
          painter: (canvas, size) {
            canvas.drawImage(image.resolve(ctx, PdfPoint(lay.w, lay.h)),
                lay.x, lay.y, lay.w, lay.h);
            if (text != null) {
              _drawTextLayer(canvas, ctx, text, lay, latin, notoFont, arabicFont);
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
      _Layout lay, pw.Font latin, pw.Font? noto, pw.Font? arabic) {
    if (ocr.w <= 0 || ocr.h <= 0) return;
    final s = lay.w / ocr.w; // PDF points per image pixel
    final latinFont = latin.getFont(ctx);
    final notoFont = noto?.getFont(ctx);
    final arabicFont = arabic?.getFont(ctx);
    PdfFont? fontFor(_Script k) => switch (k) {
          _Script.latin => latinFont,
          _Script.arabic => arabicFont,
          _Script.other => notoFont,
        };
    for (final ln in ocr.lines) {
      final txt = ln.text.trim();
      if (txt.isEmpty) continue;
      final boxW = (ln.r - ln.l) * s;
      final boxH = (ln.b - ln.t) * s;
      if (boxW <= 0.5 || boxH <= 0.5) continue;
      final fontSize = boxH * 0.8;
      final x0 = lay.x + ln.l * s;
      final y0 = lay.y + lay.h - ln.b * s + boxH * 0.15; // baseline

      // Split into runs: Latin-1 goes to Helvetica, Arabic to Noto Arabic,
      // everything else to Noto Devanagari.
      final runs = _runs(txt);
      final widths = <double>[];
      var total = 0.0;
      for (final r in runs) {
        final f = fontFor(r.script);
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
        final f = fontFor(r.script);
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
    _Script? cur;
    for (final cp in text.runes) {
      final k = _scriptOf(cp);
      if (cur != null && k != cur) {
        out.add(_Run(buf.toString(), cur));
        buf.clear();
      }
      cur = k;
      buf.writeCharCode(cp);
    }
    if (buf.isNotEmpty && cur != null) out.add(_Run(buf.toString(), cur));
    return out;
  }

  static _Script _scriptOf(int cp) {
    if (cp <= 0xFF) return _Script.latin;
    // Arabic, Arabic Supplement, Extended-A and the presentation forms.
    if ((cp >= 0x0600 && cp <= 0x06FF) ||
        (cp >= 0x0750 && cp <= 0x077F) ||
        (cp >= 0x08A0 && cp <= 0x08FF) ||
        (cp >= 0xFB50 && cp <= 0xFDFF) ||
        (cp >= 0xFE70 && cp <= 0xFEFF)) {
      return _Script.arabic;
    }
    return _Script.other;
  }

  /// Which fonts this page will need, so none is loaded for nothing.
  static Set<_Script> _scriptsIn(OcrResult r) {
    final out = <_Script>{};
    for (final l in r.lines) {
      for (final c in l.text.runes) {
        out.add(_scriptOf(c));
        if (out.length == _Script.values.length) return out;
      }
    }
    return out;
  }

  static Future<pw.Font?> _loadNoto() async {
    _notoBytes = await _fontBytes(
        'assets/fonts/NotoSansDevanagari-Regular.ttf', _notoBytes);
    return _notoBytes == null ? null : pw.Font.ttf(ByteData.sublistView(_notoBytes!));
  }

  static Future<pw.Font?> _loadArabic() async {
    _arabicBytes =
        await _fontBytes('assets/fonts/NotoSansArabic-Regular.ttf', _arabicBytes);
    return _arabicBytes == null
        ? null
        : pw.Font.ttf(ByteData.sublistView(_arabicBytes!));
  }

  static Future<Uint8List?> _fontBytes(String asset, Uint8List? cached) async {
    if (cached != null) return cached;
    try {
      return (await rootBundle.load(asset)).buffer.asUint8List();
    } catch (_) {
      return null; // the page just loses its text layer, the image is still there
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

/// Which font a stretch of text needs in the PDF.
enum _Script { latin, arabic, other }

class _Run {
  final String text;
  final _Script script;
  const _Run(this.text, this.script);
}
