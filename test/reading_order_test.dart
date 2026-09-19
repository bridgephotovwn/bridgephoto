import 'package:bridgephoto/engine.dart';
import 'package:bridgephoto/reading_order.dart';
import 'package:flutter_test/flutter_test.dart';

OcrLine ln(String text, int l, int t, int r, int b) => OcrLine(text, l, t, r, b);
List<String> words(OcrResult r) => r.lines.map((l) => l.text).toList();

void main() {
  test('a plain page is left exactly as it was', () {
    final r = OcrResult(1000, 800, [
      ln('One', 50, 40, 900, 70),
      ln('Two', 50, 90, 900, 120),
      ln('Three', 50, 140, 900, 170),
      ln('Four', 50, 190, 900, 220),
    ]);
    expect(words(ReadingOrder.sort(r)), ['One', 'Two', 'Three', 'Four']);
  });

  test('two columns are read one after the other, not across', () {
    // Left column at x 50-450, right at x 550-950, interleaved by height —
    // which is exactly how recognition hands them over.
    final r = OcrResult(1000, 800, [
      ln('L1', 50, 100, 450, 130),
      ln('R1', 550, 105, 950, 135),
      ln('L2', 50, 150, 450, 180),
      ln('R2', 550, 155, 950, 185),
      ln('L3', 50, 200, 450, 230),
      ln('R3', 550, 205, 950, 235),
    ]);
    expect(words(ReadingOrder.sort(r)), ['L1', 'L2', 'L3', 'R1', 'R2', 'R3']);
  });

  test('a heading above two columns stays above both', () {
    final r = OcrResult(1000, 900, [
      ln('HEADING ACROSS THE PAGE', 40, 40, 960, 80),
      ln('L1', 50, 120, 450, 150),
      ln('R1', 550, 125, 950, 155),
      ln('L2', 50, 170, 450, 200),
      ln('R2', 550, 175, 950, 205),
    ]);
    expect(words(ReadingOrder.sort(r)),
        ['HEADING ACROSS THE PAGE', 'L1', 'L2', 'R1', 'R2']);
  });

  test('a heading between two blocks separates them', () {
    final r = OcrResult(1000, 1200, [
      ln('PART ONE', 40, 40, 960, 80),
      ln('A1', 50, 120, 450, 150),
      ln('B1', 550, 125, 950, 155),
      ln('A2', 50, 170, 450, 200),
      ln('B2', 550, 175, 950, 205),
      ln('PART TWO', 40, 260, 960, 300),
      ln('C1', 50, 340, 450, 370),
      ln('D1', 550, 345, 950, 375),
      ln('C2', 50, 390, 450, 420),
      ln('D2', 550, 395, 950, 425),
    ]);
    expect(words(ReadingOrder.sort(r)),
        ['PART ONE', 'A1', 'A2', 'B1', 'B2', 'PART TWO', 'C1', 'C2', 'D1', 'D2']);
  });

  test('an Arabic page reads its columns right to left', () {
    final r = OcrResult(1000, 800, [
      ln('يمين ١', 550, 100, 950, 130),
      ln('يسار ١', 50, 105, 450, 135),
      ln('يمين ٢', 550, 150, 950, 180),
      ln('يسار ٢', 50, 155, 450, 185),
      ln('يمين ٣', 550, 200, 950, 230),
      ln('يسار ٣', 50, 205, 450, 235),
    ]);
    // The right-hand column comes first in Arabic.
    expect(words(ReadingOrder.sort(r)),
        ['يمين ١', 'يمين ٢', 'يمين ٣', 'يسار ١', 'يسار ٢', 'يسار ٣']);
  });

  test('a narrow gap between words is not mistaken for a column', () {
    // Two lines of ordinary prose with a wide word space in the middle.
    final r = OcrResult(1000, 400, [
      ln('the quick brown', 50, 100, 480, 130),
      ln('fox jumps over', 500, 100, 950, 130),
      ln('the lazy dog and', 50, 150, 480, 180),
      ln('then runs away', 500, 150, 950, 180),
    ]);
    // Only a 20px gap on a 1000px page — under the threshold, so these stay
    // in reading position rather than being split into columns.
    final got = words(ReadingOrder.sort(r));
    expect(got.first, 'the quick brown');
    expect(got[1], 'fox jumps over');
  });

  test('a stray line beside a block does not become a column', () {
    final r = OcrResult(1000, 800, [
      ln('Body one', 50, 100, 600, 130),
      ln('Body two', 50, 150, 600, 180),
      ln('Body three', 50, 200, 600, 230),
      ln('Body four', 50, 250, 600, 280),
      ln('x', 900, 150, 950, 175), // a page number or a margin mark
    ]);
    final got = words(ReadingOrder.sort(r));
    expect(got.take(2), ['Body one', 'Body two']);
  });

  test('too few lines to judge are left alone', () {
    final r = OcrResult(1000, 400, [
      ln('B', 550, 100, 950, 130),
      ln('A', 50, 100, 450, 130),
    ]);
    expect(words(ReadingOrder.sort(r)).length, 2);
  });

  test('nothing is ever lost or duplicated', () {
    final r = OcrResult(1000, 900, [
      ln('HEAD', 40, 40, 960, 80),
      ln('L1', 50, 120, 450, 150),
      ln('R1', 550, 125, 950, 155),
      ln('L2', 50, 170, 450, 200),
      ln('R2', 550, 175, 950, 205),
      ln('FOOT', 40, 300, 960, 330),
    ]);
    final before = words(r)..sort();
    final after = words(ReadingOrder.sort(r))..sort();
    expect(after, before);
  });

  test('three columns work as well as two', () {
    final r = OcrResult(1200, 800, [
      ln('A1', 40, 100, 340, 130),
      ln('B1', 450, 100, 750, 130),
      ln('C1', 860, 100, 1160, 130),
      ln('A2', 40, 150, 340, 180),
      ln('B2', 450, 150, 750, 180),
      ln('C2', 860, 150, 1160, 180),
    ]);
    expect(words(ReadingOrder.sort(r)), ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']);
  });
}
