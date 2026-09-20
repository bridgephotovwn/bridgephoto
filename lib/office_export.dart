import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';

/// Writes a Word document or a spreadsheet from recognised text.
///
/// Nine of the scanner and PDF apps we looked at charge for this, and one
/// walls it at a single file of 15 MB. It is expensive for them because they
/// have to take a finished PDF apart again and work out what the words were.
/// We never had to: the text and the position of every line are already ours
/// from reading the page, so all that is left is writing the file.
///
/// Both formats are a zip of XML with a fixed skeleton. Nothing is generated
/// beyond what Word and Excel need to open the file without complaint — no
/// styles, no themes, no fonts. A plain document that opens everywhere beats
/// a clever one that opens in one program.
class OfficeExport {
  const OfficeExport._();

  /// A Word document: one paragraph per line of text.
  /// [headings] marks which paragraphs are headings, by level: 0 is ordinary
  /// text, 1 the biggest heading, 2 the next. [language] is the document's
  /// language tag, such as "en" or "ar".
  ///
  /// Both exist for the same reason. A blind reader gets far more out of a
  /// Word file than a PDF — of the people who use a screen reader every day,
  /// 68.9% call Word the most accessible document format and only 12.9% say
  /// that of PDF — so this, not the PDF, is the accessible output, and it is
  /// worth making properly. Headings are what let somebody jump through a
  /// document instead of listening to all of it, and the language tag is what
  /// stops an Arabic page being read aloud in an English voice.
  static Uint8List docx(
    List<String> paragraphs, {
    List<int>? headings,
    String language = 'en',
  }) {
    final body = StringBuffer();
    for (var i = 0; i < paragraphs.length; i++) {
      final level = (headings != null && i < headings.length) ? headings[i] : 0;
      final style = level > 0
          ? '<w:pPr><w:pStyle w:val="Heading$level"/>'
              '<w:outlineLvl w:val="${level - 1}"/></w:pPr>'
          : '';
      body.write('<w:p>$style<w:r>'
          '<w:rPr><w:lang w:val="${_xml(language)}"/></w:rPr>'
          '<w:t xml:space="preserve">${_xml(paragraphs[i])}</w:t></w:r></w:p>');
    }
    // Word insists on a section at the end of the body; without it the file
    // opens but every page is the wrong size.
    body.write('<w:sectPr><w:pgSz w:w="11906" w:h="16838"/>'
        '<w:pgMar w:top="1134" w:right="1134" w:bottom="1134" w:left="1134"/></w:sectPr>');

    return _zip({
      '[Content_Types].xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
          '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
          '<Default Extension="xml" ContentType="application/xml"/>'
          '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>'
          '<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>'
          '</Types>',
      '_rels/.rels': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
          '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>'
          '</Relationships>',
      'word/_rels/document.xml.rels': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
          '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>'
          '</Relationships>',
      // Without a styles part the heading names resolve to nothing, Word shows
      // them as ordinary text, and the outline a blind reader navigates by is
      // silently absent — the file opens perfectly and the feature is gone.
      'word/styles.xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
          '${_headingStyles()}</w:styles>',
      'word/document.xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
          '<w:body>$body</w:body></w:document>',
    });
  }

  /// Heading styles, three deep. Sizes are in half-points, as Word counts.
  static String _headingStyles() {
    final b = StringBuffer();
    const sizes = [32, 26, 24];
    for (var i = 1; i <= 3; i++) {
      b.write('<w:style w:type="paragraph" w:styleId="Heading$i">'
          '<w:name w:val="heading $i"/><w:basedOn w:val="Normal"/>'
          '<w:pPr><w:outlineLvl w:val="${i - 1}"/></w:pPr>'
          '<w:rPr><w:b/><w:sz w:val="${sizes[i - 1]}"/></w:rPr></w:style>');
    }
    b.write('<w:style w:type="paragraph" w:default="1" w:styleId="Normal">'
        '<w:name w:val="Normal"/></w:style>');
    return b.toString();
  }

  /// A spreadsheet: one row per list, one cell per entry.
  ///
  /// Every cell is written as inline text. Numbers stay text on purpose — a
  /// part number like 0012 or a phone number with a leading zero must not be
  /// silently turned into 12 by a spreadsheet trying to be helpful.
  static Uint8List xlsx(List<List<String>> rows) {
    final sheet = StringBuffer();
    for (var r = 0; r < rows.length; r++) {
      sheet.write('<row r="${r + 1}">');
      for (var c = 0; c < rows[r].length; c++) {
        final ref = '${_column(c)}${r + 1}';
        sheet.write('<c r="$ref" t="inlineStr"><is><t xml:space="preserve">'
            '${_xml(rows[r][c])}</t></is></c>');
      }
      sheet.write('</row>');
    }

    return _zip({
      '[Content_Types].xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
          '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
          '<Default Extension="xml" ContentType="application/xml"/>'
          '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>'
          '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
          '</Types>',
      '_rels/.rels': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
          '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>'
          '</Relationships>',
      'xl/workbook.xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" '
          'xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'
          '<sheets><sheet name="Scan" sheetId="1" r:id="rId1"/></sheets></workbook>',
      'xl/_rels/workbook.xml.rels': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
          '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>'
          '</Relationships>',
      'xl/worksheets/sheet1.xml': '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
          '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
          '<sheetData>$sheet</sheetData></worksheet>',
    });
  }

  /// A, B, ... Z, AA, AB, ... — a spreadsheet column name.
  static String _column(int index) {
    var n = index;
    final out = StringBuffer();
    while (true) {
      out.write(String.fromCharCode(65 + n % 26));
      n = n ~/ 26 - 1;
      if (n < 0) break;
    }
    return String.fromCharCodes(out.toString().codeUnits.reversed);
  }

  /// The five characters XML cannot carry raw, plus the control characters
  /// that make Word refuse a file outright — OCR of a smudge can produce them.
  static String _xml(String s) {
    final out = StringBuffer();
    for (final r in s.runes) {
      if (r < 0x20 && r != 0x09 && r != 0x0A && r != 0x0D) continue;
      switch (r) {
        case 0x26:
          out.write('&amp;');
        case 0x3C:
          out.write('&lt;');
        case 0x3E:
          out.write('&gt;');
        case 0x22:
          out.write('&quot;');
        case 0x27:
          out.write('&apos;');
        default:
          out.writeCharCode(r);
      }
    }
    return out.toString();
  }

  static Uint8List _zip(Map<String, String> parts) {
    final archive = Archive();
    parts.forEach((name, text) {
      final data = utf8.encode(text);
      archive.add(ArchiveFile.bytes(name, data));
    });
    return Uint8List.fromList(ZipEncoder().encode(archive));
  }
}
