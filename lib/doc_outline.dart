import 'engine.dart';

/// Working out which lines of a scan are headings.
///
/// This exists for one reader in particular. Somebody using a screen reader
/// moves through a document by its headings — that is how you skip to the
/// part you want instead of listening to all of it — and a scan has none,
/// because a photograph of a page carries no structure at all. Of the people
/// who use a screen reader daily, 68.9% call Word the most accessible
/// document format and only 12.9% say that of PDF, so the Word export is the
/// one worth giving an outline to.
///
/// The signal is already in hand and costs nothing: recognition returns a box
/// for every line, and a heading is set bigger than the text around it.
class DocOutline {
  const DocOutline._();

  /// Taller than this many times the ordinary line, and it is a main heading.
  static const bigHeading = 1.55;

  /// Taller than this, a lesser one.
  static const smallHeading = 1.22;

  /// A heading is short. A tall line running the width of the page is a title
  /// in a large face, or more often a line recognition merged badly.
  static const maxHeadingWords = 12;

  /// The heading level of every line: 0 for ordinary text, 1 for the largest,
  /// 2 for the next. Same length and order as [lines].
  static List<int> levels(List<OcrLine> lines) {
    final out = List.filled(lines.length, 0);
    final heights = <int>[];
    for (final l in lines) {
      final h = l.b - l.t;
      if (h > 0 && l.text.trim().isNotEmpty) heights.add(h);
    }
    if (heights.length < 3) return out; // too little to judge a normal size by
    final ordinary = _commonest(heights);
    if (ordinary <= 0) return out;
    for (var i = 0; i < lines.length; i++) {
      final text = lines[i].text.trim();
      if (text.isEmpty) continue;
      if (text.split(RegExp(r'\s+')).length > maxHeadingWords) continue;
      final ratio = (lines[i].b - lines[i].t) / ordinary;
      if (ratio >= bigHeading) {
        out[i] = 1;
      } else if (ratio >= smallHeading) {
        out[i] = 2;
      }
    }
    return out;
  }

  /// The height most of the lines share, which is the body text.
  ///
  /// Not the middle line. The middle of a short page can itself be a heading —
  /// take a page of four lines where two are titles and the middle value IS a
  /// title, and then nothing is bigger than "ordinary" and the page comes back
  /// with no outline at all. Body text is whatever size turns up most often,
  /// however many headings sit above it.
  ///
  /// Heights are grouped in twos so that a line one pixel taller than its
  /// neighbour does not count as a different size.
  static int _commonest(List<int> heights) {
    final counts = <int, int>{};
    for (final h in heights) {
      final bucket = h ~/ 2;
      counts[bucket] = (counts[bucket] ?? 0) + 1;
    }
    var bestBucket = 0;
    var bestCount = 0;
    counts.forEach((bucket, n) {
      // on a tie the SMALLER height wins: body text is never the biggest
      if (n > bestCount || (n == bestCount && bucket < bestBucket)) {
        bestCount = n;
        bestBucket = bucket;
      }
    });
    return bestBucket * 2 + 1;
  }
}
