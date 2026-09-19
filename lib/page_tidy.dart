/// Finding the pages nobody wants: the blank back of a sheet that went
/// through the feeder anyway, and the page that got photographed twice.
///
/// The open-source world has had a request for this since 2015 and no phone
/// app does it. It is not hard — it is just nobody's job. What matters is
/// that it never acts on its own: it says what it found and a person decides.
/// Silently deleting somebody's scan because it looked empty to a threshold
/// is the kind of help nobody asks for twice.
class PageTidy {
  const PageTidy._();

  /// Below this share of dark pixels a page is empty.
  ///
  /// Deliberately low. A single line of text on A4 covers only about a
  /// thousandth of the page — far less than intuition suggests — so a
  /// generous threshold would quietly offer up a page carrying one sentence,
  /// a signature, or a stamp. The cost of the two mistakes is not equal:
  /// missing a blank page wastes a sheet of paper, while removing a page
  /// someone needed is a lost document. So it errs towards keeping.
  static const blankInk = 0.0008;

  /// How many of the 64 fingerprint bits may differ for two pages to be the
  /// same page. Zero would miss a re-photograph; too high and two blank pages
  /// or two similar forms merge. Four is the usual working figure.
  static const sameDistance = 4;

  /// What was found. Nothing is removed here — this is a report.
  static PageReport inspect(List<PageFacts> pages) {
    final blanks = <String>[];
    for (final p in pages) {
      if (p.ink < blankInk) blanks.add(p.page);
    }
    // Duplicates: the FIRST page of a matching set is kept, the later ones
    // are the ones offered for removal. Keeping the first respects the order
    // the person scanned in.
    final duplicates = <String, String>{}; // later page -> the one it repeats
    final kept = <PageFacts>[];
    for (final p in pages) {
      if (blanks.contains(p.page)) continue;
      final match = kept.where((k) => _distance(k.hash, p.hash) <= sameDistance);
      if (match.isNotEmpty) {
        duplicates[p.page] = match.first.page;
      } else {
        kept.add(p);
      }
    }
    return PageReport(blanks: blanks, duplicates: duplicates);
  }

  /// Groups pages into separate documents, cut wherever a blank page was
  /// used as a divider.
  ///
  /// This is how every desk scanner has worked for thirty years: put a blank
  /// sheet between papers, feed the lot through once, get separate files. No
  /// phone app does it, so people photograph one document, save it, and start
  /// again — twenty times.
  ///
  /// The blank sheets themselves are not returned; they were punctuation, not
  /// content. A run with nothing in it disappears, so two blanks in a row do
  /// not produce an empty document.
  static List<List<String>> splitAtBlanks(List<PageFacts> pages) {
    final groups = <List<String>>[];
    var current = <String>[];
    for (final p in pages) {
      if (p.ink < blankInk) {
        if (current.isNotEmpty) groups.add(current);
        current = <String>[];
      } else {
        current.add(p.page);
      }
    }
    if (current.isNotEmpty) groups.add(current);
    return groups;
  }

  /// How many bits differ between two fingerprints.
  static int _distance(int a, int b) {
    var x = a ^ b;
    var n = 0;
    while (x != 0) {
      n += x & 1;
      x >>>= 1;
    }
    return n;
  }
}

/// What the engine measured about one page.
class PageFacts {
  final String page;
  /// Share of the page covered in ink, 0 to 1.
  final double ink;
  /// The 64-bit difference hash.
  final int hash;
  const PageFacts(this.page, this.ink, this.hash);
}

class PageReport {
  /// Pages with essentially nothing on them.
  final List<String> blanks;
  /// Later page -> the earlier page it repeats.
  final Map<String, String> duplicates;
  const PageReport({required this.blanks, required this.duplicates});

  bool get isEmpty => blanks.isEmpty && duplicates.isEmpty;
  int get total => blanks.length + duplicates.length;
}
