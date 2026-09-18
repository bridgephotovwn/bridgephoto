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
    expect(c.country, 'UAE');
    expect(c.city, 'Dubai');
  });

  test('country from the dialling code, local numbers made international', () {
    const text = '''
Sita Gurung
Sales Coordinator
Everest Spare Parts Trading LLC
Mob: 055 123 4567
Tel: 02 555 1234
''';
    final c = parseCard(text);
    expect(c.country, 'UAE');
    expect(c.mobile, '+971551234567');
    expect(c.phone, '+97125551234');
  });

  test('Nepal card', () {
    const text = '''
Hari Prasad Sharma
Managing Director
Himalaya Machinery Pvt. Ltd.
Kathmandu, Nepal
Mobile: 9841 234 567
''';
    final c = parseCard(text);
    expect(c.country, 'Nepal');
    expect(c.city, 'Kathmandu');
    expect(c.mobile, '+9779841234567');
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
    expect(c.mobile, '+971501234567'); // 050… made international from the +971 line
    expect(c.phone, '+97148801122');
    expect(c.country, 'UAE');
    expect(c.email, 'info@gorkha-example.ae');
  });

  test('tax and order numbers are not phones', () {
    const text = '''
GORKHA HEAVY EQUIPMENT SPARE PARTS TRADING LLC SPC
Customer TRN : 104923739700003
Delivery Order No : 470
TelePhone : +971 50 421 2345
Mussaffah 11 | Abu Dhabi, UAE
''';
    final c = parseCard(text);
    expect(c.mobile, '+971504212345');
    expect(c.phone, '');
    expect(c.fax, '');
    expect(c.country, 'UAE');
    expect(c.city, 'Abu Dhabi');
  });

  test('company from the web address when the card names none', () {
    const text = '''
Bhuban Dhamala
Mob: +971 56 736 2687
sales@gorkha.ae
www.gorkha.ae
''';
    final c = parseCard(text);
    expect(c.name, 'Bhuban Dhamala');
    expect(c.company, 'Gorkha');
    expect(c.country, 'UAE');
    final free = parseCard('Ram Thapa\nram.thapa@gmail.com');
    expect(free.company, '');
  });

  test('empty and junk lines', () {
    final c = parseCard('�ylail guilytio\n\n***\n');
    expect(c.name, '');
    expect(c.company, '');
    expect(c.mobile, '');
    expect(c.phone, '');
    expect(c.email, '');
  });

  test('a personal e-mail names the person, not the company', () {
    const text = '''
SUNRISE STATIONERY SUPPLIES
Priya Sharma
Sales Manager
Mobile +971 50 000 0000
Tel +971 4 000 0000
priya.sharma@example.com
www.example.com
12 Harbour Road, Dubai, UAE
''';
    final c = parseCard(text);
    expect(c.name, 'Priya Sharma');
    expect(c.company, 'Sunrise Stationery Supplies');
    expect(c.jobTitle, 'Sales Manager');
    expect(c.mobile, '+971500000000');
    expect(c.phone, '+97140000000');
    expect(c.city, 'Dubai');
    expect(c.country, 'UAE');
  });

  test('a shouting line still becomes the company (free-mail local part)', () {
    const text = '''
TAIWAN-HOT
Sales Department
taiwanhot2021@gmail.com
+886 2 1234 5678
''';
    final c = parseCard(text);
    expect(c.company, 'Taiwan-Hot');
    expect(c.name, '');
  });

  test('round shapes inside a number are zeros', () {
    final a = parseCard('Mobile +971 50 000 ○000\nram@shop.ae');
    expect(a.mobile, '+971500000000');
    final b = parseCard('Mobile +971 50 000 °000\nram@shop.ae');
    expect(b.mobile, '+971500000000');
    final c = parseCard('Tel +971 4 2Q5 3456\nram@shop.ae');
    expect(c.phone, '+97142053456');
  });

  test('digits of any script become plain digits', () {
    // A card read with the Devanagari model comes back with Devanagari or
    // Bengali digits; Contacts needs plain ones.
    final a = parseCard('Priya Sharma\nMobile +৯৭১ ৫০ ১২৩ ৪৫৬৭\npriya@shop.ae');
    expect(a.mobile, '+971501234567');
    final b = parseCard('Ram Thapa\nMobile +३१ ९८७६५४३२१\nram@shop.np');
    expect(b.mobile, '+31987654321');
  });
}
