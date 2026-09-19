import 'package:bridgephoto/engine.dart';
import 'package:bridgephoto/id_numbers.dart';
import 'package:flutter_test/flutter_test.dart';

OcrResult page(List<String> lines, {int width = 1000}) {
  var y = 40;
  final out = <OcrLine>[];
  for (final t in lines) {
    out.add(OcrLine(t, 60, y, width - 60, y + 30));
    y += 48;
  }
  return OcrResult(width, y + 40, out);
}

void main() {
  // Computed independently, outside Dart, so this checks the implementation
  // rather than letting it mark its own work.
  const valid = ['234567890124', '998877665548', '500112233448'];
  const wrongCheckDigit = '234567890125';

  group('the check digit', () {
    test('accepts numbers that satisfy it', () {
      for (final n in valid) {
        expect(IdNumbers.verhoeff(n), isTrue, reason: n);
      }
    });

    test('rejects a single wrong digit', () {
      expect(IdNumbers.verhoeff(wrongCheckDigit), isFalse);
    });

    test('catches two neighbouring digits swapped — the typing mistake', () {
      // This is exactly why India chose this scheme over a simpler one.
      final n = valid.first;
      final swapped = n.substring(0, 4) + n[5] + n[4] + n.substring(6);
      expect(IdNumbers.verhoeff(swapped), isFalse);
    });

    test('rubbish in does not throw', () {
      expect(IdNumbers.verhoeff(''), isFalse);
      expect(IdNumbers.verhoeff('abc'), isFalse);
      expect(IdNumbers.verhoeff('1' * 40), isFalse);
    });
  });

  group('finding one on a page', () {
    test('a printed number in groups of four is found', () {
      final found = IdNumbers.find(page([
        'GOVERNMENT OF INDIA',
        'Name: Ram Bahadur',
        '2345 6789 0124',
      ]));
      expect(found, hasLength(1));
      expect(found.first.digits, '234567890124');
    });

    test('only the first eight digits are covered', () {
      final f = IdNumbers.find(page(['2345 6789 0124'])).first;
      expect(f.masked, 'XXXX XXXX 0124');
      // The box stops short of the whole number.
      expect(f.right, lessThan(940));
      expect(f.right, greaterThan(f.left));
    });

    test('a twelve-digit number that fails the checksum is left alone', () {
      expect(IdNumbers.find(page(['Ref $wrongCheckDigit'])), isEmpty);
    });

    test('a number starting 0 or 1 is not an Aadhaar and is left alone', () {
      expect(IdNumbers.find(page(['012345678901', '112345678901'])), isEmpty);
    });

    test('a phone number and a VAT number are not mistaken for one', () {
      final found = IdNumbers.find(page([
        'Tel 050 123 4567',
        'TRN 100123456700003',
        'Invoice 4471',
      ]));
      expect(found, isEmpty);
    });

    test('an ordinary invoice page raises no false alarm', () {
      final found = IdNumbers.find(page([
        'GORKHA HEAVY EQUIPMENT',
        'TAX INVOICE',
        'Invoice No: INV-4471',
        'Date 14/09/2026',
        'Total AED 1,284.50',
        'Account 0123456789',
      ]));
      expect(found, isEmpty);
    });

    test('two numbers on one page are both found', () {
      final found = IdNumbers.find(page([valid[0], 'and', valid[1]]));
      expect(found.map((f) => f.digits), [valid[0], valid[1]]);
    });

    test('the covered box sits on the line it found', () {
      final f = IdNumbers.find(page(['Name', '2345 6789 0124'])).first;
      expect(f.top, greaterThan(40)); // the second line, not the first
      expect(f.bottom, greaterThan(f.top));
    });
  });
}
