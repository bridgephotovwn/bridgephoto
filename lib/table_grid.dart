import 'engine.dart';

/// Finding the columns in a photographed table.
///
/// The spreadsheet export until now split each line wherever it found two or
/// more spaces. That works on a line that came out cleanly and fails on the
/// line above it, because recognition puts a single space between two columns
/// as readily as three — so a row silently collapses into one cell and the
/// person has to retype it. Which is the whole point: scanning a page costs
/// pennies, and the typing that follows it is what people actually pay for.
///
/// A column is not a gap in one line. It is a place where MANY lines begin a
/// word at the same distance across the page. So this looks down the page
/// rather than along a line, and a column has to be voted for by several rows
/// before it exists at all.
class TableGrid {
  const TableGrid._();

  /// How close two word-starts must be, as a share of the page width, to be
  /// counted as the same column.
  static const tolerance = 0.025;

  /// A column has to be used by at least this share of the rows.
  ///
  /// High on purpose. A real column is filled in nearly every row — that is
  /// what makes it a column. Set this low and two things go wrong at once:
  /// prose gets accepted because four lines of a paragraph will always share
  /// a couple of word positions by chance, and a long description gets torn
  /// in half because its middle words gather enough votes to invent a column
  /// of their own. Both were happening at a third; neither happens at three
  /// fifths. The cost is a column that is usually blank — a notes field — and
  /// losing that is much cheaper than shredding a description.
  static const minRowShare = 0.6;

  /// Fewer rows than this is not a table, whatever the spacing looks like.
  static const minRows = 3;

  /// The rows and cells of [ocr], or null when the page is not a table.
  ///
  /// Returning null matters as much as returning a grid: forcing prose into
  /// columns produces a spreadsheet that is worse than the plain text it came
  /// from, and the caller can fall back to what it did before.
  static List<List<String>>? from(OcrResult ocr) {
    final lines = ocr.lines
        .where((l) => l.text.trim().isNotEmpty && l.r > l.l)
        .toList()
      ..sort((a, b) => a.t.compareTo(b.t));
    if (lines.length < minRows || ocr.w <= 0) return null;

    final words = <List<_Word>>[];
    for (final line in lines) {
      final w = _wordsOf(line);
      if (w.isNotEmpty) words.add(w);
    }
    if (words.length < minRows) return null;

    final edges = _columnEdges(words, ocr.w);
    if (edges.length < 2) return null; // one column is not a table

    final slack = (ocr.w * tolerance / 2).round();
    final rows = <List<String>>[];
    for (final line in words) {
      final cells = List.filled(edges.length, '');
      for (final word in line) {
        final c = _columnFor(word.left, edges, slack);
        cells[c] = cells[c].isEmpty ? word.text : '${cells[c]} ${word.text}';
      }
      rows.add(cells);
    }
    // A grid where almost everything landed in one column is prose that
    // happened to satisfy the voting; say so rather than emit it.
    var filled = 0;
    for (final r in rows) {
      filled += r.where((c) => c.isNotEmpty).length;
    }
    if (filled < rows.length * 1.5) return null;
    return rows;
  }

  /// Where each word sits across the page.
  ///
  /// Recognition hands back one box for a whole line, not one per word, so a
  /// word's position is estimated from how far into the line it starts. That
  /// is only right for even spacing, which is why a column needs votes from
  /// several rows before it is believed — the errors do not agree with each
  /// other, and real columns do.
  static List<_Word> _wordsOf(OcrLine line) {
    final text = line.text;
    final width = line.r - line.l;
    final out = <_Word>[];
    var i = 0;
    while (i < text.length) {
      if (text.codeUnitAt(i) == 32) {
        i++;
        continue;
      }
      final start = i;
      while (i < text.length && text.codeUnitAt(i) != 32) {
        i++;
      }
      final left = line.l + (width * start / text.length).round();
      final right = line.l + (width * i / text.length).round();
      out.add(_Word(text.substring(start, i), left, right));
    }
    return out;
  }

  /// A column must have clear space before it in at least this share of the
  /// rows.
  ///
  /// This is what actually separates a table from a paragraph, and without it
  /// prose was being accepted: four lines of text will always share a couple
  /// of word positions by luck, and voting alone cannot tell that apart from a
  /// column. But a column is padded — every row leaves a gap before it — while
  /// prose runs on with one space between words. So a candidate has to be
  /// preceded by real space, in row after row, before it counts.
  static const minGapShare = 0.03;

  /// The left edge of every column the page votes for.
  static List<int> _columnEdges(List<List<_Word>> rows, int pageWidth) {
    final starts = <int>[];
    for (final r in rows) {
      for (final w in r) {
        starts.add(w.left);
      }
    }
    starts.sort();
    final gap = (pageWidth * tolerance).round().clamp(1, pageWidth);
    // group the starts that sit within a tolerance of each other
    final groups = <List<int>>[];
    for (final s in starts) {
      if (groups.isNotEmpty && s - groups.last.last <= gap) {
        groups.last.add(s);
      } else {
        groups.add([s]);
      }
    }
    final needed = (rows.length * minRowShare).ceil();
    final edges = <int>[];
    for (final g in groups) {
      // count the ROWS that use this group, not the words: a row with three
      // words in one column must not out-vote three separate rows
      var used = 0;
      var padded = 0;
      final minGap = (pageWidth * minGapShare).round();
      for (final r in rows) {
        final at = r.where((w) => w.left >= g.first && w.left <= g.last);
        if (at.isEmpty) continue;
        used++;
        // is there clear space in front of it, or does the previous word run
        // straight into it the way prose does?
        final word = at.first;
        var before = -1;
        for (final w in r) {
          if (w.right <= word.left && w.right > before) before = w.right;
        }
        if (before < 0 || word.left - before >= minGap) padded++;
      }
      if (used >= needed && padded >= needed) {
        edges.add(g.reduce((a, b) => a + b) ~/ g.length);
      }
    }
    edges.sort();
    return edges;
  }

  /// The column a word at [left] belongs to: the LAST edge at or before it.
  ///
  /// Not the nearest one. Text runs rightwards from where its column begins,
  /// so a long description drifts far from its own edge and ends up closer to
  /// the next — and picking the nearest edge then tears the description in
  /// half and files its tail under the quantity. It did exactly that:
  /// "Bearing assembly heavy  4" came out as "Bearing assembly" and "heavy 4".
  /// A word stays in its column until the next column actually starts.
  ///
  /// [slack] forgives a word that begins a hair before its own edge, which
  /// happens because word positions are estimated rather than measured.
  static int _columnFor(int left, List<int> edges, int slack) {
    var best = 0;
    for (var i = 0; i < edges.length; i++) {
      if (edges[i] <= left + slack) {
        best = i;
      } else {
        break;
      }
    }
    return best;
  }
}

class _Word {
  final String text;
  final int left;
  final int right;
  const _Word(this.text, this.left, this.right);
}
