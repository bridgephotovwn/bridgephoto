import 'package:bridgephoto/auto_name.dart';
import 'package:bridgephoto/engine.dart';
import 'package:flutter_test/flutter_test.dart';

/// Builds a page the way text recognition hands it to us: lines with boxes.
/// [big] marks the letterhead, which is simply the tallest line on the page.
OcrResult page(List<(String, int)> lines, {int width = 1000}) {
  var y = 40;
  final out = <OcrLine>[];
  for (final (text, height) in lines) {
    out.add(OcrLine(text, 60, y, width - 60, y + height));
    y += height + 18;
  }
  return OcrResult(width, y + 60, out);
}

void main() {
  final scanned = DateTime(2026, 9, 19);

  test('a UAE tax invoice: date, kind and its number', () {
    final name = AutoName.from(
      page([
        ('GORKHA HEAVY EQUIPMENT SPARE PARTS TRADING LLC', 44),
        ('Abu Dhabi, United Arab Emirates', 20),
        ('TAX INVOICE', 30),
        ('Invoice No: INV-4471', 20),
        ('Date: 14/09/2026', 20),
        ('TRN: 100123456700003', 20),
      ]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-14 Invoice INV-4471');
  });

  test('the date printed on the document beats the day it was scanned', () {
    final name = AutoName.from(
      page([
        ('ADNOC DISTRIBUTION', 40),
        ('RECEIPT', 26),
        ('Date 01/03/2026', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, startsWith('2026-03-01'));
  });

  test('no number: the biggest line at the top names it', () {
    final name = AutoName.from(
      page([
        ('CARREFOUR HYPERMARKET', 42),
        ('Marina Mall', 18),
        ('RECEIPT', 24),
        ('Total AED 128.50', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-19 Receipt Carrefour Hypermarket');
  });

  test('a passport is recognised without any number at all', () {
    final name = AutoName.from(
      page([
        ('REPUBLIC OF NEPAL', 40),
        ('PASSPORT', 34),
        ('Type P', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-19 Passport Republic Of Nepal');
  });

  test('an Arabic invoice is read too', () {
    final name = AutoName.from(
      page([
        ('شركة غورخا لقطع غيار المعدات الثقيلة', 40),
        ('فاتورة', 30),
        ('رقم الفاتورة: 7788', 20),
      ]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-19 Invoice 7788');
  });

  test('a page with nothing useful keeps its plain scan name', () {
    expect(AutoName.from(page([('...', 18), ('- - -', 18)]), scannedAt: scanned), isNull);
    expect(AutoName.from(OcrResult(0, 0, const []), scannedAt: scanned), isNull);
  });

  test('a word in the small print at the foot is not the title', () {
    final name = AutoName.from(
      page([
        ('AL NOOR MEDICAL CENTRE', 40),
        ('Patient report', 24),
        ('Findings within normal limits.', 16),
        ('This is not an invoice and cannot be used as a receipt.', 12),
        ('Terms: payment due on receipt of invoice.', 12),
      ]),
      scannedAt: scanned,
    );
    // "Report" wins because it is up top; the invoice wording at the foot is
    // ignored, which is the whole reason only the top half is read.
    expect(name, '2026-09-19 Report Al Noor Medical Centre');
  });

  test('"Invoice No: Pending" is not a number', () {
    final name = AutoName.from(
      page([
        ('BLUE SKY TRADING', 40),
        ('INVOICE', 28),
        ('Invoice No: Pending', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-19 Invoice Blue Sky Trading');
  });

  test('a nonsense date is ignored rather than trusted', () {
    final name = AutoName.from(
      page([
        ('SOME COMPANY', 40),
        ('INVOICE', 28),
        ('Date: 45/13/2026', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, startsWith('2026-09-19')); // fell back to the scan date
  });

  test('30/02 is rejected: the month has no such day', () {
    final name = AutoName.from(
      page([('ACME LTD', 40), ('RECEIPT', 26), ('30/02/2026', 18)]),
      scannedAt: scanned,
    );
    expect(name, startsWith('2026-09-19'));
  });

  test('a written-out date is read', () {
    final name = AutoName.from(
      page([
        ('EMIRATES NBD', 40),
        ('ACCOUNT STATEMENT', 26),
        ('Issued 3 March 2026', 18),
      ]),
      scannedAt: scanned,
    );
    expect(name, startsWith('2026-03-03'));
  });

  test('the name never contains characters a file system rejects', () {
    final name = AutoName.from(
      page([('A/B: TRADING <LLC>', 40), ('INVOICE', 28), ('Invoice No: 1/2', 18)]),
      scannedAt: scanned,
    );
    expect(name, isNotNull);
    for (final c in r'\/:*?"<>|'.split('')) {
      expect(name!.contains(c), isFalse, reason: 'found $c in "$name"');
    }
  });

  test('the kind is never repeated as the party', () {
    final name = AutoName.from(
      page([('TAX INVOICE', 44), ('Invoice No 9', 18)]),
      scannedAt: scanned,
    );
    expect(name, '2026-09-19 Invoice 9');
  });

  test('a two-digit year is read as this century', () {
    final name = AutoName.from(
      page([('SHOP', 40), ('RECEIPT', 26), ('12/05/26', 18)]),
      scannedAt: scanned,
    );
    expect(name, startsWith('2026-05-12'));
  });
}
