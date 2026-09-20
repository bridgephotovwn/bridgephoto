import 'package:bridgephoto/page_tidy.dart';
import 'package:flutter_test/flutter_test.dart';

/// A fingerprint with [flipped] bits changed, to stand for a page
/// re-photographed slightly differently.
int near(int hash, int flipped) {
  var h = hash;
  for (var i = 0; i < flipped; i++) {
    h ^= 1 << i;
  }
  return h;
}

void main() {
  _splitTests();
  const a = 0x0F1E2D3C4B5A6978;
  const b = 0x7788990011223344;

  test('an empty page is found, a written one is not', () {
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.0002, a),
      const PageFacts('p2', 0.031, b),
    ]);
    expect(r.blanks, ['p1']);
    expect(r.duplicates, isEmpty);
  });

  test('a page carrying ONE line of text is never called empty', () {
    // A single line on A4 is about a thousandth of the page — much less than
    // it feels like. This is the test that stops a signature, a stamp or one
    // sentence being offered up for deletion.
    final r = PageTidy.inspect([const PageFacts('p1', 0.001, a)]);
    expect(r.blanks, isEmpty);
  });

  test('a page with only edge shadow and sensor noise is empty', () {
    final r = PageTidy.inspect([const PageFacts('p1', 0.0003, a)]);
    expect(r.blanks, ['p1']);
  });

  test('the same page photographed twice is spotted', () {
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.03, a),
      PageFacts('p2', 0.031, near(a, 3)), // same page, slightly different shot
      const PageFacts('p3', 0.04, b),
    ]);
    expect(r.duplicates.keys, ['p2']);
    expect(r.duplicates['p2'], 'p1');
  });

  test('the FIRST copy is kept, the later one offered up', () {
    final r = PageTidy.inspect([
      const PageFacts('first', 0.03, a),
      PageFacts('second', 0.03, near(a, 1)),
      PageFacts('third', 0.03, near(a, 2)),
    ]);
    expect(r.duplicates.keys.toSet(), {'second', 'third'});
    expect(r.duplicates.values.toSet(), {'first'});
  });

  test('two genuinely different pages are not merged', () {
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.03, a),
      const PageFacts('p2', 0.03, b),
    ]);
    expect(r.duplicates, isEmpty);
  });

  test('blank pages are not reported twice as duplicates of each other', () {
    // Two empty pages have near-identical fingerprints. They are blanks, and
    // saying "also, these are duplicates" would be noise.
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.0001, a),
      PageFacts('p2', 0.0001, near(a, 1)),
      const PageFacts('p3', 0.05, b),
    ]);
    expect(r.blanks, ['p1', 'p2']);
    expect(r.duplicates, isEmpty);
  });

  test('a clean document reports nothing at all', () {
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.03, a),
      const PageFacts('p2', 0.04, b),
      const PageFacts('p3', 0.05, 0x1234567890ABCDEF),
    ]);
    expect(r.isEmpty, isTrue);
    expect(r.total, 0);
  });

  test('a page just past the likeness limit stays its own page', () {
    final r = PageTidy.inspect([
      const PageFacts('p1', 0.03, a),
      PageFacts('p2', 0.03, near(a, PageTidy.sameDistance + 1)),
    ]);
    expect(r.duplicates, isEmpty);
  });

  test('no pages at all is not a crash', () {
    final r = PageTidy.inspect(const []);
    expect(r.isEmpty, isTrue);
  });
}

void _splitTests() {
  const a = 0x0F1E2D3C4B5A6978;
  group('splitting a batch at blank dividers', () {
    PageFacts ink(String p) => PageFacts(p, 0.03, a);
    PageFacts blank(String p) => PageFacts(p, 0.0002, a);

    test('a blank sheet between two papers makes two documents', () {
      final g = PageTidy.splitAtBlanks([
        ink('p1'), ink('p2'), blank('sep'), ink('p3'),
      ]);
      expect(g, [
        ['p1', 'p2'],
        ['p3'],
      ]);
    });

    test('the blank sheets themselves are not kept', () {
      final g = PageTidy.splitAtBlanks([ink('p1'), blank('sep'), ink('p2')]);
      expect(g.expand((x) => x), isNot(contains('sep')));
    });

    test('two blanks in a row do not make an empty document', () {
      final g = PageTidy.splitAtBlanks([
        ink('p1'), blank('s1'), blank('s2'), ink('p2'),
      ]);
      expect(g, [
        ['p1'],
        ['p2'],
      ]);
    });

    test('a blank at the start or the end is just ignored', () {
      final g = PageTidy.splitAtBlanks([
        blank('s0'), ink('p1'), ink('p2'), blank('s1'),
      ]);
      expect(g, [
        ['p1', 'p2'],
      ]);
    });

    test('no blanks at all means one document, unchanged', () {
      final g = PageTidy.splitAtBlanks([ink('p1'), ink('p2'), ink('p3')]);
      expect(g, [
        ['p1', 'p2', 'p3'],
      ]);
    });

    test('nothing but blanks yields nothing, not an empty document', () {
      expect(PageTidy.splitAtBlanks([blank('s1'), blank('s2')]), isEmpty);
    });
  });

  group('pages measured off a real phone', () {
    // These are the actual figures the engine reported for a nine-page test
    // document on a Galaxy S24. Page 6 is a genuine re-scan of page 1; the
    // rest are plainly different documents. Before the fingerprint was fixed
    // the app offered to delete pages 2, 5 and 9 as copies of page 1, every
    // box pre-ticked, so these numbers are kept as a guard.
    const invoice   = PageFacts('p1', 0.01700, 0x0000000101014145);
    const columns   = PageFacts('p2', 0.04042, 0x0000000009030b03);
    const blankPage = PageFacts('p4', 0.00000, 0x0000000000000000);
    const idCard    = PageFacts('p5', 0.00912, 0x0000000000010101);
    const rescan    = PageFacts('p6', 0.01700, 0x0000000101014145);
    const twoUp     = PageFacts('p9', 0.00608, 0x0004060604000606);

    test('the re-scan of page 1 is recognised as the same page', () {
      expect(PageTidy.same(invoice, rescan), isTrue);
    });

    test('an ID card is not an invoice, however alike they look', () {
      // Their fingerprints sit five bits apart - close enough that a small
      // change to the threshold would merge them. The ink settles it.
      expect(PageTidy.same(invoice, idCard), isFalse);
    });

    test('a two-up sheet is not an invoice', () {
      expect(PageTidy.same(invoice, twoUp), isFalse);
    });

    test('a page of columns is not an invoice', () {
      expect(PageTidy.same(invoice, columns), isFalse);
    });

    test('the whole document gives up exactly one blank and one copy', () {
      final r = PageTidy.inspect(
          [invoice, columns, blankPage, idCard, rescan, twoUp]);
      expect(r.blanks, ['p4']);
      expect(r.duplicates, {'p6': 'p1'});
      expect(r.total, 2, reason: 'anything more is a page someone loses');
    });

    test('ink alone cannot condemn a page either', () {
      // Same coverage, nothing else alike: two different forms filled in to
      // the same extent must not be merged.
      const other = PageFacts('px', 0.01700, 0x7fffffffffffffff);
      expect(PageTidy.same(invoice, other), isFalse);
    });
  });
}
