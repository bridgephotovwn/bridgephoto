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
