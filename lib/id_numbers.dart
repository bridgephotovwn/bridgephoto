import 'engine.dart';

/// Finds national ID numbers on a scanned page so they can be hidden.
///
/// India's UIDAI warns people not to hand out plain photocopies of an Aadhaar
/// card and offers a "masked" version with the first eight digits covered.
/// Getting one means going to a government website; doing it to a photo you
/// already have means finding an app, and the only one that does it has fifty
/// thousand installs and ships advertising.
///
/// The number is worth finding properly rather than guessing: an Aadhaar
/// number carries a **Verhoeff check digit**, cannot begin with 0 or 1, and
/// is exactly twelve digits. Together those make a false alarm rare — a
/// twelve-digit invoice reference will almost never satisfy the checksum. So
/// this points at something only when it is fairly sure.
///
/// It never hides anything by itself. It proposes a box; a person looks at
/// the page and decides. Covering the wrong part of a document cannot be
/// undone, and an ID card is the worst possible place to be confidently wrong.
class IdNumbers {
  const IdNumbers._();

  /// Aadhaar is twelve digits, often printed in groups of four.
  static final _twelve = RegExp(r'(?<!\d)(\d[\d\s\-]{10,14}\d)(?!\d)');

  /// Numbers found on the page, with where they sit and how much to cover.
  static List<IdFound> find(OcrResult ocr) {
    final out = <IdFound>[];
    for (final line in ocr.lines) {
      for (final m in _twelve.allMatches(line.text)) {
        final raw = m.group(1)!;
        final digits = raw.replaceAll(RegExp(r'[^\d]'), '');
        if (digits.length != 12) continue;
        if (digits[0] == '0' || digits[0] == '1') continue;
        if (!verhoeff(digits)) continue;
        // Where the number sits along the line, estimated from how far into
        // the text it starts. Rough, which is exactly why a person confirms
        // it rather than the app acting alone.
        final startFraction = m.start / line.text.length;
        final endFraction = m.end / line.text.length;
        final width = line.r - line.l;
        final from = line.l + (width * startFraction).round();
        final to = line.l + (width * endFraction).round();
        // UIDAI masks the first EIGHT digits and leaves the last four
        // readable, which is what makes a masked copy still usable.
        final maskTo = from + ((to - from) * 8 / 12).round();
        out.add(IdFound(
          digits: digits,
          line: line.text,
          left: from,
          top: line.t,
          right: maskTo,
          bottom: line.b,
        ));
      }
    }
    return out;
  }

  /// The Verhoeff checksum. Catches every single-digit error and every
  /// transposition of neighbours, which is why India chose it.
  static bool verhoeff(String digits) {
    if (digits.isEmpty || digits.length > 20) return false;
    var c = 0;
    var i = 0;
    for (var k = digits.length - 1; k >= 0; k--) {
      final n = digits.codeUnitAt(k) - 0x30;
      if (n < 0 || n > 9) return false;
      c = _d[c][_p[i % 8][n]];
      i++;
    }
    return c == 0;
  }

  static const _d = <List<int>>[
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
  ];

  static const _p = <List<int>>[
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8],
  ];
}

/// One number found, and the part of the page that would be covered.
class IdFound {
  final String digits;
  final String line;
  final int left, top, right, bottom;
  const IdFound({
    required this.digits,
    required this.line,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  /// The number as it would read once masked, for showing the user.
  String get masked => 'XXXX XXXX ${digits.substring(8)}';
}
