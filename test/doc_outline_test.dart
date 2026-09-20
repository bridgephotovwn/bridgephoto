import 'package:bridgephoto/doc_outline.dart';
import 'package:bridgephoto/engine.dart';
import 'package:flutter_test/flutter_test.dart';

OcrLine line(String text, int height, {int y = 100}) =>
    OcrLine(text, 60, y, 900, y + height);

void main() {
  test('a big short line is a heading, the body text is not', () {
    final levels = DocOutline.levels([
      line('TAX INVOICE', 46),
      line('Invoice No: INV-8821', 26),
      line('Date: 15 March 2026', 26),
      line('Bearing assembly, heavy duty, four off', 26),
      line('Carrier roller 8E-9642, six off', 26),
    ]);
    expect(levels.first, 1, reason: 'the title was not marked as a heading');
    expect(levels.sublist(1), everyElement(0));
  });

  test('a long line is never a heading however big it is set', () {
    // Recognition merges lines, and a merged line is tall AND long. Marking
    // that as a heading puts nonsense in the outline a blind reader navigates
    // by, which is worse than having no outline.
    final levels = DocOutline.levels([
      line('SHORT TITLE', 46),
      line('this is a very long line of running text that happens to have '
          'been recognised as one tall box across the whole page', 46),
      line('body text here', 26),
      line('more body text', 26),
    ]);
    expect(levels[0], 1);
    expect(levels[1], 0, reason: 'a long line was allowed into the outline');
  });

  test('two sizes of heading come out as two levels', () {
    final levels = DocOutline.levels([
      line('GORKHA HEAVY EQUIPMENT', 48),
      line('Terms of sale', 34),
      line('Payment within thirty days.', 26),
      line('Goods remain our property.', 26),
      line('Delivery is ex works.', 26),
    ]);
    expect(levels[0], 1);
    expect(levels[1], 2);
    expect(levels[2], 0);
  });

  test('a page all in one size gets no headings at all', () {
    final levels = DocOutline.levels([
      for (var i = 0; i < 6; i++) line('an ordinary line $i', 26),
    ]);
    expect(levels, everyElement(0),
        reason: 'inventing headings on a flat page misleads the reader');
  });

  test('too few lines to judge by means no headings', () {
    expect(DocOutline.levels([line('ONE', 40), line('two', 20)]),
        everyElement(0));
    expect(DocOutline.levels(const []), isEmpty);
  });

  test('blank and zero-height lines do not upset it', () {
    final levels = DocOutline.levels([
      line('', 0),
      line('TITLE', 46),
      line('   ', 30),
      line('body', 26),
      line('body', 26),
      line('body', 26),
    ]);
    expect(levels[1], 1);
    expect(levels[0], 0);
  });
}
