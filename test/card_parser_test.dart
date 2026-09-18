import 'package:flutter_test/flutter_test.dart';

import 'package:bridgephoto/card_parser.dart';

void main() {
  test('typical UAE trading card', () {
    const text = '''
AL-YAMAMA HEAVY EQUIPMENT & SPARE PARTS TR. LLC
Ahmed Shaker Fathy
Manager
Tel.    : +971 2 5551234
Fax     : +971 2 5551235
Mobile  : +971 50 1234567
P.O.Box : 36384, Dubai, U.A.E
E-mail  : ashfathy@example.com
Website : www.alyamama-example.com
''';
    final c = parseCard(text);
    expect(c.name, 'Ahmed Shaker Fathy');
    expect(c.company, 'Al-Yamama Heavy Equipment & Spare Parts Tr. LLC');
    expect(c.jobTitle, 'Manager');
    expect(c.phone, '+97125551234');
    expect(c.fax, '+97125551235');
    expect(c.mobile, '+971501234567');
    expect(c.email, 'ashfathy@example.com');
    expect(c.website, 'www.alyamama-example.com');
    expect(c.address.contains('36384'), isTrue);
    expect(c.address.contains('Dubai'), isTrue);
  });

  test('unlabelled numbers and OCR confusions', () {
    const text = '''
Mr. Ram Bahadur Thapa
Sales Executive
Gorkha Machinery Trading Est.
05O 123 4567
+971 4 88O 1122
info@gorkha-example.ae
''';
    final c = parseCard(text);
    expect(c.name, 'Ram Bahadur Thapa');
    expect(c.jobTitle, 'Sales Executive');
    expect(c.company, 'Gorkha Machinery Trading Est.');
    expect(c.mobile, '0501234567');
    expect(c.phone, '+97148801122');
    expect(c.email, 'info@gorkha-example.ae');
  });

  test('empty and junk lines', () {
    final c = parseCard('�ylail guilytio\n\n***\n');
    expect(c.name, '');
    expect(c.company, '');
    expect(c.mobile, '');
    expect(c.phone, '');
    expect(c.email, '');
  });
}
