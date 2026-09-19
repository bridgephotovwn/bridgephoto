import 'engine.dart';

/// Puts recognised lines into the order a person would read them.
///
/// Text recognition hands back lines roughly top to bottom, which is right
/// for a letter and wrong for anything in columns: a newspaper, a contract
/// with two languages side by side, a form with two panels. Read straight
/// down, the two columns interleave and the text becomes nonsense. Blind
/// users described this more than any other fault — their reader speaks the
/// jumble aloud and there is no way to tell it is jumbled.
///
/// The method is old and needs no model. Look for a vertical gap that runs
/// the height of a block of text with no words in it — a gutter. If there is
/// one, the block is in columns, and each column is read out fully before the
/// next. Headings that span the full width break the page into blocks first,
/// so a title above two columns stays above them instead of being swallowed
/// into one.
class ReadingOrder {
  const ReadingOrder._();

  /// A line this wide is a heading or a rule across the page, not a column.
  static const _fullWidth = 0.68;

  /// A gutter narrower than this is the space between words, not columns.
  static const _minGutter = 0.045;

  /// A column with fewer lines than this is a stray, not a column.
  static const _minLinesPerColumn = 2;

  /// The same result with its lines in reading order.
  static OcrResult sort(OcrResult r) {
    if (r.lines.length < 4 || r.w <= 0) return r;
    final lines = [...r.lines]..sort((a, b) => a.t.compareTo(b.t));
    final rtl = _isRightToLeft(lines);
    final out = <OcrLine>[];

    // Full-width lines cut the page into blocks; columns are looked for
    // inside each block, never across a heading.
    var block = <OcrLine>[];
    for (final line in lines) {
      if ((line.r - line.l) >= r.w * _fullWidth) {
        out.addAll(_orderBlock(block, r.w, rtl));
        block = [];
        out.add(line);
      } else {
        block.add(line);
      }
    }
    out.addAll(_orderBlock(block, r.w, rtl));
    return OcrResult(r.w, r.h, out);
  }

  static List<OcrLine> _orderBlock(List<OcrLine> block, int pageW, bool rtl) {
    if (block.length < _minLinesPerColumn * 2) return _byPosition(block, rtl);
    final cuts = _gutters(block, pageW);
    if (cuts.isEmpty) return _byPosition(block, rtl);

    final bounds = <int>[0, ...cuts, pageW];
    final columns = <List<OcrLine>>[];
    for (var i = 0; i < bounds.length - 1; i++) {
      final from = bounds[i], to = bounds[i + 1];
      final inHere = block.where((l) {
        final mid = (l.l + l.r) / 2;
        return mid >= from && mid < to;
      }).toList();
      if (inHere.isNotEmpty) columns.add(inHere);
    }
    // If the split did not actually separate anything, leave it alone.
    if (columns.length < 2 || columns.any((c) => c.length < _minLinesPerColumn)) {
      return _byPosition(block, rtl);
    }
    if (rtl) columns.sort((a, b) => _mid(b).compareTo(_mid(a)));
    return [
      for (final c in columns) ...(c..sort((a, b) => a.t.compareTo(b.t))),
    ];
  }

  /// The x positions where a vertical gap runs through the whole block.
  static List<int> _gutters(List<OcrLine> block, int pageW) {
    // Mark every column of pixels that any line covers, at a coarse
    // resolution — the exact edge does not matter, only where the space is.
    const bins = 240;
    final covered = List<bool>.filled(bins, false);
    for (final l in block) {
      final from = (l.l * bins / pageW).floor().clamp(0, bins - 1);
      final to = (l.r * bins / pageW).ceil().clamp(0, bins - 1);
      for (var i = from; i <= to; i++) {
        covered[i] = true;
      }
    }
    final minRun = (bins * _minGutter).ceil();
    final cuts = <int>[];
    var runStart = -1;
    for (var i = 0; i < bins; i++) {
      if (!covered[i]) {
        if (runStart < 0) runStart = i;
      } else {
        if (runStart >= 0 && i - runStart >= minRun) {
          // Ignore the margins: a gutter is between columns, not beside them.
          if (runStart > 0) cuts.add(((runStart + i) / 2 * pageW / bins).round());
        }
        runStart = -1;
      }
    }
    return cuts;
  }

  static List<OcrLine> _byPosition(List<OcrLine> lines, bool rtl) {
    final out = [...lines];
    out.sort((a, b) {
      // Lines within a whisker of each other are on the same row.
      final sameRow = (a.t - b.t).abs() < ((a.b - a.t) * 0.6);
      if (sameRow) return rtl ? b.l.compareTo(a.l) : a.l.compareTo(b.l);
      return a.t.compareTo(b.t);
    });
    return out;
  }

  static double _mid(List<OcrLine> c) =>
      c.map((l) => (l.l + l.r) / 2).reduce((a, b) => a + b) / c.length;

  /// A page is read right to left when most of its letters are.
  static bool _isRightToLeft(List<OcrLine> lines) {
    var rtl = 0, ltr = 0;
    for (final l in lines) {
      for (final c in l.text.runes) {
        if ((c >= 0x0600 && c <= 0x06FF) ||
            (c >= 0x0750 && c <= 0x077F) ||
            (c >= 0x08A0 && c <= 0x08FF) ||
            (c >= 0xFB50 && c <= 0xFDFF) ||
            (c >= 0xFE70 && c <= 0xFEFF) ||
            (c >= 0x0590 && c <= 0x05FF)) {
          rtl++;
        } else if ((c >= 0x41 && c <= 0x5A) || (c >= 0x61 && c <= 0x7A)) {
          ltr++;
        }
      }
    }
    return rtl > ltr;
  }
}
