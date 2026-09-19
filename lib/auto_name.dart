import 'engine.dart';

/// Gives a scanned document a name taken from what is written on it.
///
/// This is the single most-asked-for missing feature in this category: people
/// do not want a rename button, they want the app to read the page. Fourteen
/// reviewers across nine apps asked for it, several quoting the exact shape
/// they wanted — a date they can sort by, then something they can recognise.
///
/// So a name is built from three things, in this order:
///
///   `2026-09-19 Invoice 4471`
///    ^ date      ^ kind  ^ the number, or the issuer if there is no number
///
/// * the **date** comes first because it sorts. The date printed ON the
///   document is preferred over the day it was scanned — a bill photographed
///   three weeks late belongs under the date it was issued.
/// * the **kind** is what makes it recognisable at a glance in a list.
/// * the **number** is what makes it unique. Failing a number, the issuer's
///   name is used, which is nearly as good and much better than nothing.
///
/// Every part is optional. A page that gives us nothing keeps its plain scan
/// name rather than being given a confident wrong one.
class AutoName {
  /// Kinds of document, and the words that announce them. English plus Arabic,
  /// because those are the two scripts the app reads in this part of the
  /// world; the list is deliberately short and common rather than exhaustive.
  /// The FIRST match down this list wins, so the more specific kinds come
  /// before the vaguer ones — "tax invoice" is an invoice, but a "delivery
  /// note" is not a note.
  static const _kinds = <String, List<String>>{
    'Invoice': ['tax invoice', 'invoice', 'فاتورة'],
    'Receipt': ['receipt', 'إيصال', 'ايصال', 'وصل'],
    'Statement': ['account statement', 'bank statement', 'statement of account', 'كشف حساب'],
    'Quotation': ['quotation', 'quote no', 'عرض سعر'],
    'Purchase order': ['purchase order', 'local purchase order', 'أمر شراء'],
    'Delivery note': ['delivery note', 'delivery order', 'waybill', 'إذن تسليم'],
    'Payslip': ['payslip', 'pay slip', 'salary slip', 'salary certificate', 'كشف راتب'],
    'Contract': ['contract', 'agreement', 'عقد', 'اتفاقية'],
    'Certificate': ['certificate', 'شهادة'],
    'Prescription': ['prescription', 'وصفة طبية'],
    'Insurance': ['insurance policy', 'policy no', 'تأمين'],
    'Passport': ['passport', 'جواز سفر'],
    'Licence': ['driving licence', 'driving license', 'trade licence', 'trade license', 'رخصة'],
    'Visa': ['entry permit', 'residence visa', 'visa', 'تأشيرة'],
    'Ticket': ['boarding pass', 'e-ticket', 'ticket', 'تذكرة'],
    'ID card': ['identity card', 'emirates id', 'national id', 'هوية'],
    'Report': ['report', 'تقرير'],
    'Letter': ['to whom it may concern', 'letter'],
  };

  /// Labels that introduce the number that identifies a document.
  static const _numberLabels = [
    'invoice no', 'invoice number', 'invoice #', 'inv no', 'tax invoice no',
    'receipt no', 'receipt number', 'bill no', 'order no', 'order number',
    'lpo no', 'po no', 'p.o. no', 'quotation no', 'quote no', 'ref no',
    'reference no', 'reference number', 'document no', 'doc no', 'policy no',
    'certificate no', 'permit no', 'file no', 'serial no',
    'رقم الفاتورة', 'رقم الإيصال', 'رقم المرجع', 'الرقم',
  ];

  /// Words that are never an issuer's name, however big they are printed.
  static const _notAParty = [
    'invoice', 'tax invoice', 'receipt', 'statement', 'quotation', 'delivery',
    'purchase order', 'contract', 'agreement', 'certificate', 'prescription',
    'passport', 'licence', 'license', 'visa', 'ticket', 'report', 'payslip',
    'original', 'copy', 'duplicate', 'customer copy', 'date', 'page',
  ];

  /// The name for a scan, or null when the page says nothing useful and the
  /// plain scan name should stand.
  static String? from(OcrResult ocr, {DateTime? scannedAt}) {
    final lines = ocr.lines.where((l) => l.text.trim().isNotEmpty).toList();
    if (lines.isEmpty) return null;

    final kind = _kindOf(lines);
    final number = _numberIn(lines);
    final party = _partyIn(lines, ocr, kind);
    final date = _dateIn(lines) ?? scannedAt;

    // Something to recognise it by is the whole point; a bare date is not a
    // name, it is a timestamp, and we already have one of those.
    if (kind == null && number == null && party == null) return null;

    final tail = number ?? party;
    final parts = <String>[
      if (date != null) _iso(date),
      if (kind != null) kind,
      if (tail != null && tail != kind) tail,
    ];
    final name = parts.join(' ').trim();
    return name.isEmpty ? null : _tidy(name);
  }

  static String _iso(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  // ---------------------------------------------------------------- kind

  /// What kind of document this is: the FIRST such word down the page wins.
  ///
  /// Order matters more than the word itself. "Patient report" on line two is
  /// the title; "this is not an invoice" three lines below it is small print.
  /// Reading in page order gets that right without a list of exceptions.
  /// Within one line the longest match wins, so "tax invoice" is not mistaken
  /// for the bare word "invoice" sitting inside it.
  static String? _kindOf(List<OcrLine> lines) {
    for (final line in _topPortion(lines, 0.5)) {
      final low = line.text.toLowerCase();
      String? best;
      var bestLength = 0;
      for (final entry in _kinds.entries) {
        for (final word in entry.value) {
          if (word.length > bestLength && low.contains(word)) {
            best = entry.key;
            bestLength = word.length;
          }
        }
      }
      if (best != null) return best;
    }
    return null;
  }

  // -------------------------------------------------------------- number

  // The token may be a single character: plenty of small businesses are on
  // invoice 9. A digit is required separately, so this staying loose is safe.
  static final _tokenAfterLabel = RegExp(r'[:\s#\-]*([A-Za-z0-9][A-Za-z0-9/\-]{0,19})');

  static String? _numberIn(List<OcrLine> lines) {
    for (final line in lines) {
      final low = line.text.toLowerCase();
      for (final label in _numberLabels) {
        final at = low.indexOf(label);
        if (at < 0) continue;
        final rest = line.text.substring(at + label.length);
        final m = _tokenAfterLabel.firstMatch(rest);
        final token = m?.group(1);
        // A number with no digit in it is a word that followed a colon.
        if (token != null && RegExp(r'\d').hasMatch(token)) {
          return _trimPunctuation(token);
        }
      }
    }
    return null;
  }

  // --------------------------------------------------------------- party

  /// The issuer, taken as the BIGGEST line near the top of the page.
  ///
  /// This is the part other apps cannot easily copy: text recognition gives
  /// us a box around every line, so the letterhead is simply the tallest one
  /// up top. No model, no guessing at fonts.
  static String? _partyIn(List<OcrLine> lines, OcrResult ocr, String? kind) {
    final candidates = _topPortion(lines, 0.32, minLines: 3).where((l) {
      final t = l.text.trim();
      if (t.length < 3 || t.length > 42) return false;
      // It must read as a name, not a number or a date.
      if (!RegExp(r'[A-Za-z؀-ۿ]{3}').hasMatch(t)) return false;
      if (RegExp(r'^\d').hasMatch(t)) return false;
      final low = t.toLowerCase();
      if (_notAParty.any((w) => low == w || low.startsWith('$w '))) return false;
      if (kind != null && low.contains(kind.toLowerCase())) return false;
      return true;
    }).toList();
    if (candidates.isEmpty) return null;
    // Tallest box wins; on a tie, the one higher up the page.
    candidates.sort((a, b) {
      final h = (b.b - b.t).compareTo(a.b - a.t);
      return h != 0 ? h : a.t.compareTo(b.t);
    });
    return _titleIfShouting(_trimPunctuation(candidates.first.text.trim()));
  }

  // ---------------------------------------------------------------- date

  static final _dateNumeric =
      RegExp(r'\b(\d{1,4})[/\-.](\d{1,2})[/\-.](\d{2,4})\b');
  static final _dateWords = RegExp(
      r'\b(\d{1,2})[\s\-]*(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*[\s\-,]*(\d{4})\b',
      caseSensitive: false);
  static const _months = {
    'jan': 1, 'feb': 2, 'mar': 3, 'apr': 4, 'may': 5, 'jun': 6,
    'jul': 7, 'aug': 8, 'sep': 9, 'oct': 10, 'nov': 11, 'dec': 12,
  };

  static DateTime? _dateIn(List<OcrLine> lines) {
    for (final line in lines) {
      final w = _dateWords.firstMatch(line.text);
      if (w != null) {
        final d = int.parse(w.group(1)!);
        final m = _months[w.group(2)!.toLowerCase()]!;
        final y = int.parse(w.group(3)!);
        final got = _checked(y, m, d);
        if (got != null) return got;
      }
      final n = _dateNumeric.firstMatch(line.text);
      if (n != null) {
        final a = int.parse(n.group(1)!);
        final b = int.parse(n.group(2)!);
        var c = int.parse(n.group(3)!);
        if (c < 100) c += c > 70 ? 1900 : 2000;
        // yyyy-mm-dd if it starts with a year, otherwise dd/mm/yyyy, which is
        // what the rest of the world outside America writes.
        final got = a > 31 ? _checked(a, b, c) : _checked(c, b, a);
        if (got != null) return got;
      }
    }
    return null;
  }

  static DateTime? _checked(int y, int m, int d) {
    if (m < 1 || m > 12 || d < 1 || d > 31) return null;
    // A document dated far outside living memory is a misread, not a date.
    if (y < 1900 || y > DateTime.now().year + 2) return null;
    final dt = DateTime(y, m, d);
    return (dt.month == m && dt.day == d) ? dt : null;
  }

  // -------------------------------------------------------------- tidying

  static String _trimPunctuation(String s) =>
      s.replaceAll(RegExp(r'^[\s:#\-.,]+|[\s:#\-.,]+$'), '');

  /// A LETTERHEAD SET IN CAPITALS becomes readable again.
  static String _titleIfShouting(String s) {
    if (s != s.toUpperCase() || !RegExp(r'[A-Z]').hasMatch(s)) return s;
    return s
        .split(RegExp(r'\s+'))
        .map((w) => w.isEmpty
            ? w
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join(' ');
  }

  /// Squeezes the spaces and strips anything a file name cannot carry, while
  /// keeping the wording itself intact.
  static String _tidy(String s) => s
      .replaceAll(RegExp(r'[\\/:*?"<>|]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  /// The lines near the top of the page — where a title lives.
  ///
  /// Geometry alone is not enough: on a short till receipt the word RECEIPT
  /// is the third line of four and sits below half the page height, so a
  /// purely proportional window misses it. Always keep at least the first
  /// [minLines] lines as well.
  static List<OcrLine> _topPortion(List<OcrLine> lines, double fraction,
      {int minLines = 8}) {
    final bottom = lines.map((l) => l.b).reduce((a, b) => a > b ? a : b);
    final top = lines.map((l) => l.t).reduce((a, b) => a < b ? a : b);
    final cut = top + (bottom - top) * fraction;
    final byOrder = lines.take(minLines).toSet();
    final within =
        lines.where((l) => l.t <= cut || byOrder.contains(l)).toList();
    return within.isEmpty ? lines : within;
  }
}
