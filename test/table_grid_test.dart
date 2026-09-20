import 'package:bridgephoto/engine.dart';
import 'package:bridgephoto/table_grid.dart';
import 'package:flutter_test/flutter_test.dart';

/// Lines as recognition hands them over: one box per line, no word positions.
OcrResult _page(List<String> lines, {int w = 1000, int lineHeight = 40}) {
  final out = <OcrLine>[];
  for (var i = 0; i < lines.length; i++) {
    out.add(OcrLine(lines[i], 60, 100 + i * lineHeight, w - 60,
        100 + i * lineHeight + 30));
  }
  return OcrResult(w, 100 + lines.length * lineHeight + 100, out);
}

void main() {
  group('a table becomes cells', () {
    test('an invoice with four columns comes out as four columns', () {
      final g = TableGrid.from(_page([
        'Item    Description              Qty      Amount',
        '1       Track chain assembly     2        4,800.00',
        '2       Carrier roller 8E-9642   6        1,260.00',
        '3       Idler group CAT 320D     1        2,150.00',
        '4       Sprocket segment set     4        3,400.00',
      ]));
      expect(g, isNotNull);
      expect(g!.length, 5);
      expect(g.first.length, greaterThanOrEqualTo(4));
      // the number and the money must not end up in the same cell
      final row = g[1];
      expect(row.join('|'), contains('4,800.00'));
      final amountCell = row.lastIndexWhere((c) => c.contains('4,800.00'));
      final qtyCell = row.lastIndexWhere((c) => c.trim() == '2');
      expect(amountCell, isNot(qtyCell),
          reason: 'quantity and amount collapsed into one cell');
    });

    test('a single space between columns is still a column', () {
      // The failure the old splitter had: it needed two spaces, and
      // recognition does not reliably give two.
      final g = TableGrid.from(_page([
        'Date Ref Amount',
        '01-03 A118 250.00',
        '02-03 A119 480.00',
        '03-03 A120 125.00',
      ]));
      expect(g, isNotNull);
      expect(g!.first.length, greaterThanOrEqualTo(3),
          reason: 'single-spaced columns were not found');
    });
  });

  group('what is NOT a table is left alone', () {
    test('a paragraph of prose is refused', () {
      final g = TableGrid.from(_page([
        'The tenant shall pay the rent in four cheques,',
        'each drawn on a bank in the United Arab Emirates,',
        'and the landlord shall maintain the air conditioning',
        'at his own cost throughout the term of this lease.',
      ]));
      expect(g, isNull,
          reason: 'prose forced into columns is worse than the plain text');
    });

    test('too few lines is refused however neat they look', () {
      final g = TableGrid.from(_page([
        'Qty    Price',
        '2      50.00',
      ]));
      expect(g, isNull);
    });

    test('an empty page does not crash', () {
      expect(TableGrid.from(OcrResult(0, 0, const [])), isNull);
      expect(TableGrid.from(_page(const [])), isNull);
    });

    test('a page of blank lines is refused', () {
      expect(TableGrid.from(_page(['', '   ', ''])), isNull);
    });
  });

  group('the cells hold the right words', () {
    test('a description with spaces in it stays in one cell', () {
      final g = TableGrid.from(_page([
        'Code   Part                      Qty',
        'BM01   Bearing assembly heavy    4',
        'BM02   Seal kit front cover      2',
        'BM03   Gasket set upper          1',
      ]));
      expect(g, isNotNull);
      final joined = g![1].join('|');
      expect(joined, contains('Bearing assembly heavy'),
          reason: 'a multi-word description was split across cells');
    });

    test('every row comes back with the same number of cells', () {
      final g = TableGrid.from(_page([
        'A      B        C',
        '1      2        3',
        '4      5        6',
        '7      8        9',
      ]));
      expect(g, isNotNull);
      final widths = g!.map((r) => r.length).toSet();
      expect(widths.length, 1, reason: 'ragged rows break every spreadsheet');
    });
  });
}
