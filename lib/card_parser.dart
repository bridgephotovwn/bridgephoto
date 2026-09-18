/// Turns the recognised text of a business card into contact fields.
/// Heuristics only, on the phone; the user reviews before saving.
class ContactCard {
  String name = '';
  String company = '';
  String jobTitle = '';
  String mobile = '';
  String phone = '';
  String fax = '';
  String email = '';
  String website = '';
  String address = '';
  String notes = '';

  Map<String, String> toMap() => {
        'name': name,
        'company': company,
        'jobTitle': jobTitle,
        'mobile': mobile,
        'phone': phone,
        'fax': fax,
        'email': email,
        'website': website,
        'address': address,
        'notes': notes,
      };

  bool get isEmpty => toMap().values.every((v) => v.trim().isEmpty);
}

final _emailRx = RegExp(r'[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}');
final _webRx = RegExp(
    r'(?:https?://)?(?:www\.)[A-Za-z0-9\-]+(?:\.[A-Za-z0-9\-]+)+(?:/\S*)?|(?<![@\w])[A-Za-z0-9\-]+\.(?:com|net|org|ae|co|io|info|biz|me|uk|in|np|sa|qa|om|kw|bh|de|fr|it|es|nl|ch|at|jp|cn|kr|au|ca|us|eu|tv|app|dev|shop|store)\b(?:/\S*)?',
    caseSensitive: false);
final _phoneRx = RegExp(r'\+?\(?\d[\d\s().\-]{5,}\d');
final _digitsRx = RegExp(r'\d');

const _companyWords = [
  'llc', 'l.l.c', 'ltd', 'limited', 'inc', 'corp', 'corporation', 'co.', 'company', 'trading', 'tr.', 'est', 'establishment',
  'group', 'fze', 'fzco', 'fzc', 'dmcc', 'plc', 'gmbh', 'industries', 'industrial', 'services', 'solutions', 'technologies',
  'technology', 'enterprises', 'enterprise', 'international', 'general', 'contracting', 'equipment', 'spare parts', 'spares',
  'traders', 'trade', 'engineering', 'machinery', 'motors', 'automotive', 'supplies', 'store', 'stores', 'center', 'centre',
  'holdings', 'bank', 'hospital', 'clinic', 'school', 'university', 'consultancy', 'consultants', 'logistics', 'shipping',
  'transport', 'tourism', 'travels', 'restaurant', 'cafe', 'hotel', 'agency', 'agencies', 'partners', 'associates',
  'foundation', 'institute', 'factory', 'manufacturing', 'marine', 'oilfield', 'energy', 'power', 'electrical', 'electronics',
  'construction', 'builders', 'developers', 'properties', 'real estate', 'pharmacy', 'medical', 'textiles', 'garments',
  'foods', 'heavy', 'parts', 'systems', 'networks', 'media', 'studio', 'design', 'exports', 'imports', 'workshop', 'garage',
];
const _titleWords = [
  'manager', 'director', 'ceo', 'cfo', 'coo', 'cto', 'engineer', 'sales', 'executive', 'officer', 'head of', 'president',
  'vice', 'founder', 'owner', 'partner', 'consultant', 'supervisor', 'coordinator', 'accountant', 'secretary',
  'representative', 'chairman', 'specialist', 'assistant', 'marketing', 'purchase', 'purchasing', 'procurement', 'managing',
  'in-charge', 'incharge', 'technician', 'analyst', 'developer', 'designer', 'architect', 'proprietor', 'agent', 'advisor',
  'lead', 'chief', 'administrator', 'admin', 'clerk', 'controller', 'auditor', 'surveyor', 'foreman', 'mechanic',
  'operator', 'md', 'gm', 'business development', 'relationship', 'account', 'customer service', 'supply chain',
];
const _addressWords = [
  'p.o.box', 'po box', 'p.o. box', 'p o box', 'pobox', 'street', 'st.', 'road', 'rd.', 'avenue', 'building', 'bldg',
  'tower', 'office', 'floor', 'suite', 'area', 'industrial', 'zone', 'plot', 'shop no', 'warehouse', 'block', 'near',
  'opposite', 'behind', 'dubai', 'abu dhabi', 'sharjah', 'ajman', 'fujairah', 'ras al khaimah', 'umm al quwain', 'al ain',
  'musaffah', 'mussafah', 'al quoz', 'deira', 'jebel ali', 'uae', 'u.a.e', 'united arab emirates', 'emirates', 'saudi',
  'riyadh', 'jeddah', 'dammam', 'doha', 'qatar', 'kuwait', 'muscat', 'oman', 'bahrain', 'kathmandu', 'nepal', 'india',
  'pakistan', 'p.o', 'box',
];
const _labelWords = [
  'tel', 'tele', 'telephone', 'phone', 'ph', 'fax', 'mobile', 'mob', 'cell', 'gsm', 'whatsapp', 'e-mail', 'email', 'mail',
  'web', 'website', 'www', 'address', 'add', 'off', 'office', 'direct', 'toll free',
];

bool _hasWord(String lower, List<String> words) {
  for (final w in words) {
    final i = lower.indexOf(w);
    if (i < 0) continue;
    final before = i == 0 ? ' ' : lower[i - 1];
    final afterIdx = i + w.length;
    final after = afterIdx >= lower.length ? ' ' : lower[afterIdx];
    final wordChar = RegExp(r'[a-z0-9]');
    if (!wordChar.hasMatch(before) && !wordChar.hasMatch(after)) return true;
  }
  return false;
}

/// Keeps '+' and digits; fixes the usual OCR confusions inside a number.
String _cleanPhone(String raw) {
  var s = raw.trim().replaceAll(RegExp(r'[Oo]'), '0').replaceAll(RegExp(r'[lI|]'), '1');
  final plus = s.startsWith('+');
  s = s.replaceAll(RegExp(r'[^\d]'), '');
  if (s.length < 7 || s.length > 16) return '';
  return (plus ? '+' : '') + s;
}

String _stripLabel(String line) {
  var s = line.trim();
  // "Tel : ", "E-mail:", "Mob. " ... at the start
  s = s.replaceFirst(RegExp(r'^(?:' + _labelWords.map(RegExp.escape).join('|') + r')\.?\s*[:\-]?\s*', caseSensitive: false), '');
  return s.trim();
}

ContactCard parseCard(String text) {
  final card = ContactCard();
  final rawLines = text.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty).toList();

  // Drop lines that are not readable Latin text (Arabic read by the Latin model, noise).
  final lines = <String>[];
  for (final l in rawLines) {
    if (l.contains('�')) continue; // unreadable script read by the Latin model
    final letters = RegExp(r'[A-Za-z0-9]').allMatches(l).length;
    final junk = RegExp(r'[^\w\s@.+\-:/(),&#]').allMatches(l).length;
    if (letters == 0) continue;
    if (junk > letters) continue;
    lines.add(l);
  }

  final phonesMobile = <String>[], phonesWork = <String>[], phonesFax = <String>[];
  final leftovers = <String>[];
  final addressLines = <String>[];
  final companyLines = <String>[];
  final titleLines = <String>[];
  final nameCandidates = <String>[];

  for (var l in lines) {
    l = _fixDigits(l);
    final lower = l.toLowerCase();

    // emails and websites first, then remove them from the line
    for (final m in _emailRx.allMatches(l)) {
      if (card.email.isEmpty) card.email = m.group(0)!;
    }
    l = l.replaceAll(_emailRx, ' ');
    for (final m in _webRx.allMatches(l)) {
      final w = m.group(0)!;
      if (card.website.isEmpty && !w.contains('@')) card.website = w;
    }
    l = l.replaceAll(_webRx, ' ');

    // phone numbers, typed by the label that precedes them on the line
    var rest = l;
    for (final m in _phoneRx.allMatches(l)) {
      final n = _cleanPhone(m.group(0)!);
      if (n.isEmpty) continue;
      final before = l.substring(0, m.start).toLowerCase();
      final labelZone = before.length > 18 ? before.substring(before.length - 18) : before;
      if (RegExp(r'fax|\bf\b').hasMatch(labelZone)) {
        phonesFax.add(n);
      } else if (RegExp(r'mob|cell|gsm|whatsapp|\bm\b|\bhp\b').hasMatch(labelZone)) {
        phonesMobile.add(n);
      } else if (RegExp(r'tel|phone|\bph\b|\bt\b|off|direct').hasMatch(labelZone)) {
        phonesWork.add(n);
      } else if (RegExp(r'^(\+?9715|05)').hasMatch(n) || RegExp(r'^(\+?977(97|98)|(97|98))').hasMatch(n)) {
        phonesMobile.add(n); // UAE / Nepal mobile prefixes
      } else {
        phonesWork.add(n);
      }
      rest = rest.replaceFirst(m.group(0)!, ' ');
    }
    rest = _stripLabel(rest).replaceAll(RegExp(r'\s{2,}'), ' ').trim();
    // a line that was only labels/numbers is done
    if (rest.replaceAll(RegExp(r'[^A-Za-z]'), '').length < 2) continue;
    if (rest != l.trim() && _hasWord(rest.toLowerCase(), _labelWords) && rest.length < 12) continue;

    final restLower = rest.toLowerCase();
    if (_hasWord(restLower, _addressWords) || RegExp(r'\b\d{3,6}\b').hasMatch(rest) && _hasWord(lower, _addressWords)) {
      addressLines.add(rest);
    } else if (_hasWord(restLower, _companyWords)) {
      companyLines.add(rest);
    } else if (_hasWord(restLower, _titleWords)) {
      titleLines.add(rest);
    } else if (!_digitsRx.hasMatch(rest) &&
        rest.length <= 40 &&
        !rest.contains('&') &&
        RegExp(r'^[A-Za-z][A-Za-z.\-\x27 ]+$').hasMatch(rest) &&
        rest.split(RegExp(r'\s+')).length <= 4) {
      nameCandidates.add(rest);
    } else {
      leftovers.add(rest);
    }
  }

  card.mobile = phonesMobile.isNotEmpty ? phonesMobile.first : '';
  card.phone = phonesWork.isNotEmpty ? phonesWork.first : '';
  card.fax = phonesFax.isNotEmpty ? phonesFax.first : '';
  final extraPhones = [...phonesMobile.skip(1), ...phonesWork.skip(1), ...phonesFax.skip(1)];

  // Company: prefer an all-caps line, they are usually the letterhead.
  if (companyLines.isNotEmpty) {
    companyLines.sort((a, b) => (b == b.toUpperCase() ? 1 : 0) - (a == a.toUpperCase() ? 1 : 0));
    card.company = _titleCaseIfShouting(companyLines.first);
  }
  if (titleLines.isNotEmpty) card.jobTitle = _titleCaseIfShouting(titleLines.first);

  // Name: strip honorifics; prefer a candidate that is not the company.
  String clean(String s) => s.replaceFirst(RegExp(r'^(mr|mrs|ms|miss|dr|eng|er|engr|prof)\.?\s+', caseSensitive: false), '').trim();
  final names = nameCandidates.map(clean).where((n) => n.split(' ').length >= 2 || n.length >= 4).toList();
  if (names.isNotEmpty) {
    card.name = _titleCaseIfShouting(names.first);
    if (card.company.isEmpty && names.length > 1) {
      // A second all-caps candidate is usually the company.
      final shout = names.skip(1).where((n) => n == n.toUpperCase()).toList();
      if (shout.isNotEmpty) card.company = _titleCaseIfShouting(shout.first);
    }
  }
  if (card.address.isEmpty && addressLines.isNotEmpty) card.address = addressLines.join(', ');

  final notes = <String>[
    ...leftovers.where((l) => l != card.name && l != card.company),
    ...nameCandidates.map(clean).where((n) => _titleCaseIfShouting(n) != card.name && _titleCaseIfShouting(n) != card.company),
    ...companyLines.skip(1),
    ...titleLines.skip(1),
    ...extraPhones,
  ];
  card.notes = notes.join('\n').trim();
  if (card.notes.length > 600) card.notes = card.notes.substring(0, 600);
  return card;
}

/// "05O 123 4567" -> "050 123 4567": inside tokens that are mostly digits,
/// the letters O, I, l and | are OCR misreads of 0 and 1.
String _fixDigits(String line) {
  return line.split(' ').map((tok) {
    final digits = RegExp(r'\d').allMatches(tok).length;
    final confusable = RegExp(r'[OoIl|]').allMatches(tok).length;
    final punct = RegExp(r'[+()\-.]').allMatches(tok).length;
    final other = tok.length - digits - confusable - punct;
    if (digits >= 2 && confusable > 0 && other == 0) {
      return tok.replaceAll(RegExp(r'[Oo]'), '0').replaceAll(RegExp(r'[Il|]'), '1');
    }
    return tok;
  }).join(' ');
}

const _keepCaps = {
  'LLC', 'L.L.C', 'L.L.C.', 'FZE', 'FZCO', 'FZC', 'DMCC', 'PLC', 'GMBH', 'UAE', 'U.A.E', 'U.A.E.', 'USA', 'UK', 'KSA',
  'JLT', 'DIP', 'DAFZA', 'JAFZA', 'AG', 'SA', 'BV', 'NV', 'PVT', 'LLP', 'LP', 'P.O.', 'CEO', 'CFO', 'COO', 'CTO', 'MD', 'GM',
  'HR', 'IT', 'QA', 'QC', 'HSE', 'PRO', 'VP', 'SVP', 'EVP', 'II', 'III', '&',
};

String _titleCaseIfShouting(String s) {
  // "EQUIPMENT&SPARE" -> "EQUIPMENT & SPARE"
  s = s.replaceAll(RegExp(r'\s*&\s*'), ' & ').replaceAll(RegExp(r'\s{2,}'), ' ').trim();
  if (s != s.toUpperCase() || s.length < 4) return s;
  String cap(String w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase();
  return s
      .split(' ')
      .map((w) {
        final core = w.replaceAll(RegExp(r'[.,;:]+$'), ''); // "LLC." keeps its capitals
        if (_keepCaps.contains(core)) return w;
        return w.split('-').map(cap).join('-'); // Al-Yamama, Abu-Dhabi
      })
      .join(' ');
}
