import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:bridgephoto/office_export.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, String> unzip(List<int> bytes) {
  final a = ZipDecoder().decodeBytes(bytes);
  // The parts are UTF-8: reading them as raw code units mangles every
  // non-Latin character and makes the test lie about the file.
  return {for (final f in a.files) f.name: utf8.decode(f.content as List<int>)};
}

void main() {
  test('a Word file has the parts Word insists on', () {
    final parts = unzip(OfficeExport.docx(['Hello', 'World']));
    expect(parts.keys, containsAll(['[Content_Types].xml', '_rels/.rels', 'word/document.xml']));
    expect(parts['word/document.xml'], contains('Hello'));
    expect(parts['word/document.xml'], contains('World'));
    // Without a section the file opens with every page the wrong size.
    expect(parts['word/document.xml'], contains('<w:sectPr>'));
  });

  test('a spreadsheet has the parts Excel insists on', () {
    final parts = unzip(OfficeExport.xlsx([
      ['Date', 'Amount'],
      ['2026-09-19', '128.50'],
    ]));
    expect(parts.keys,
        containsAll(['xl/workbook.xml', 'xl/_rels/workbook.xml.rels', 'xl/worksheets/sheet1.xml']));
    final sheet = parts['xl/worksheets/sheet1.xml']!;
    expect(sheet, contains('r="A1"'));
    expect(sheet, contains('r="B2"'));
    expect(sheet, contains('128.50'));
  });

  test('a number keeps its leading zero instead of being helpfully eaten', () {
    // A part number 0012 or a phone number 050... must survive.
    final sheet = unzip(OfficeExport.xlsx([['0012', '0501234567']]))['xl/worksheets/sheet1.xml']!;
    expect(sheet, contains('>0012<'));
    expect(sheet, contains('>0501234567<'));
    expect(sheet, contains('t="inlineStr"'));
  });

  test('characters XML cannot carry are escaped, not dropped', () {
    final doc = unzip(OfficeExport.docx(['a & b < c > d "e" \'f\'']))['word/document.xml']!;
    expect(doc, contains('&amp;'));
    expect(doc, contains('&lt;'));
    expect(doc, contains('&gt;'));
    expect(doc, isNot(contains('a & b')));
  });

  test('control characters from a bad read cannot poison the file', () {
    // OCR of a smudge can produce these, and Word refuses the whole file.
    final doc = unzip(OfficeExport.docx(['ok\u0000\u0007still ok']))['word/document.xml']!;
    expect(doc, contains('okstill ok'));
  });

  test('Arabic and Devanagari survive the round trip', () {
    final doc = unzip(OfficeExport.docx(['فاتورة ضريبية', 'नेपाल']))['word/document.xml']!;
    expect(doc, contains('فاتورة'));
    expect(doc, contains('नेपाल'));
  });

  test('column names go past Z the way a spreadsheet does', () {
    final row = List.generate(30, (i) => 'c$i');
    final sheet = unzip(OfficeExport.xlsx([row]))['xl/worksheets/sheet1.xml']!;
    expect(sheet, contains('r="Z1"'));
    expect(sheet, contains('r="AA1"'));
    expect(sheet, contains('r="AD1"'));
  });

  test('an empty document is still a valid file', () {
    expect(() => unzip(OfficeExport.docx(const [])), returnsNormally);
    expect(() => unzip(OfficeExport.xlsx(const [])), returnsNormally);
  });

  test('written out for a real program to open', () async {
    final dir = Platform.environment['PDF_PREVIEW_DIR'];
    if (dir == null || dir.isEmpty) return;
    await File('$dir/out.docx').writeAsBytes(OfficeExport.docx(
        ['GORKHA HEAVY EQUIPMENT', 'Tax Invoice', 'Invoice No: INV-4471', 'فاتورة ضريبية']));
    await File('$dir/out.xlsx').writeAsBytes(OfficeExport.xlsx([
      ['Line', 'Part', 'Qty', 'Price'],
      ['1', '0012', '4', '128.50'],
      ['2', '7Y0762', '1', '96.00'],
    ]));
  });
}
