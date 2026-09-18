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
  String city = '';
  String country = '';
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
        'city': city,
        'country': country,
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
/// Country by dialling code and by well-known city / country words.
class _Country {
  final String name, dial;
  final List<String> words;
  const _Country(this.name, this.dial, this.words);
}

const _countries = [
  _Country('UAE', '971', ['uae', 'u.a.e', 'united arab emirates', 'emirates', 'dubai', 'abu dhabi', 'abudhabi', 'sharjah',
      'ajman', 'fujairah', 'ras al khaimah', 'rak', 'umm al quwain', 'al ain', 'musaffah', 'mussafah', 'al quoz', 'deira',
      'jebel ali', 'jafza', 'dafza', 'jlt', 'dip', 'icad', 'kizad']),
  _Country('Nepal', '977', ['nepal', 'kathmandu', 'pokhara', 'lalitpur', 'biratnagar', 'birgunj', 'butwal', 'bhairahawa']),
  _Country('Saudi Arabia', '966', ['saudi', 'ksa', 'riyadh', 'jeddah', 'dammam', 'khobar', 'jubail', 'makkah', 'madinah']),
  _Country('Qatar', '974', ['qatar', 'doha']),
  _Country('Oman', '968', ['oman', 'muscat', 'sohar', 'salalah']),
  _Country('Kuwait', '965', ['kuwait']),
  _Country('Bahrain', '973', ['bahrain', 'manama']),
  _Country('India', '91', ['india', 'mumbai', 'delhi', 'new delhi', 'chennai', 'bangalore', 'bengaluru', 'kolkata', 'hyderabad',
      'pune', 'ahmedabad', 'kochi', 'cochin', 'kerala', 'gujarat', 'tamil nadu']),
  _Country('Pakistan', '92', ['pakistan', 'karachi', 'lahore', 'islamabad', 'rawalpindi', 'peshawar']),
  _Country('Bangladesh', '880', ['bangladesh', 'dhaka', 'chittagong']),
  _Country('Sri Lanka', '94', ['sri lanka', 'colombo']),
  _Country('Philippines', '63', ['philippines', 'manila', 'cebu']),
  _Country('Egypt', '20', ['egypt', 'cairo', 'alexandria']),
  _Country('Jordan', '962', ['jordan', 'amman']),
  _Country('Lebanon', '961', ['lebanon', 'beirut']),
  _Country('Turkey', '90', ['turkey', 'türkiye', 'istanbul', 'ankara']),
  _Country('United Kingdom', '44', ['united kingdom', 'england', 'london', 'manchester', 'birmingham']),
  _Country('Germany', '49', ['germany', 'deutschland', 'berlin', 'hamburg', 'munich', 'münchen', 'frankfurt']),
  _Country('Italy', '39', ['italy', 'italia', 'milan', 'milano', 'rome', 'roma']),
  _Country('France', '33', ['france', 'paris', 'lyon', 'marseille']),
  _Country('Spain', '34', ['spain', 'españa', 'madrid', 'barcelona']),
  _Country('Netherlands', '31', ['netherlands', 'amsterdam', 'rotterdam']),
  _Country('China', '86', ['china', 'shanghai', 'beijing', 'guangzhou', 'shenzhen', 'ningbo', 'hangzhou', 'xiamen', 'qingdao']),
  _Country('Hong Kong', '852', ['hong kong']),
  _Country('Japan', '81', ['japan', 'tokyo', 'osaka', 'yokohama']),
  _Country('South Korea', '82', ['korea', 'seoul', 'busan']),
  _Country('Singapore', '65', ['singapore']),
  _Country('Malaysia', '60', ['malaysia', 'kuala lumpur', 'penang']),
  _Country('Indonesia', '62', ['indonesia', 'jakarta', 'surabaya']),
  _Country('Thailand', '66', ['thailand', 'bangkok']),
  _Country('Vietnam', '84', ['vietnam', 'hanoi', 'ho chi minh']),
  _Country('Australia', '61', ['australia', 'sydney', 'melbourne', 'perth', 'brisbane']),
  _Country('USA', '1', ['usa', 'u.s.a', 'united states', 'new york', 'houston', 'chicago', 'los angeles', 'texas', 'florida',
      'california', 'miami']),
  _Country('Canada', '1', ['canada', 'toronto', 'vancouver', 'montreal']),
  _Country('South Africa', '27', ['south africa', 'johannesburg', 'cape town', 'durban']),
  _Country('Kenya', '254', ['kenya', 'nairobi', 'mombasa']),
  _Country('Nigeria', '234', ['nigeria', 'lagos', 'abuja']),
  _Country('Russia', '7', ['russia', 'moscow', 'st. petersburg']),
];

/// The country a number belongs to, by its international prefix.
_Country? _countryByDial(String n) {
  if (!n.startsWith('+')) return null;
  final digits = n.substring(1);
  _Country? best;
  for (final c in _countries) {
    if (digits.startsWith(c.dial) && (best == null || c.dial.length > best.dial.length)) best = c;
  }
  return best;
}

/// A country named (or a well-known city of it) in the text.
_Country? _countryByWords(String lower) {
  for (final c in _countries) {
    if (_hasWord(lower, c.words)) return c;
  }
  return null;
}

/// The city word found in the text, capitalised.
String _cityIn(String lower, _Country c) {
  for (final w in c.words.skip(1)) {
    if (_hasWord(lower, w.split(RegExp(r'\s+')).length > 1 ? [w] : [w])) {
      if (['uae', 'u.a.e', 'emirates', 'saudi', 'ksa', 'usa', 'u.s.a', 'united states', 'korea', 'nepal', 'india', 'china',
              'japan', 'italy', 'italia', 'france', 'spain', 'españa', 'germany', 'deutschland', 'england', 'united kingdom',
              'egypt', 'oman', 'qatar', 'kuwait', 'bahrain', 'jordan', 'lebanon', 'turkey', 'türkiye', 'netherlands',
              'singapore', 'malaysia', 'indonesia', 'thailand', 'vietnam', 'australia', 'canada', 'south africa', 'kenya',
              'nigeria', 'russia', 'pakistan', 'bangladesh', 'sri lanka', 'philippines', 'hong kong', 'texas', 'florida',
              'california', 'kerala', 'gujarat', 'tamil nadu', 'jafza', 'dafza', 'jlt', 'dip', 'icad', 'kizad']
          .contains(w)) {
        continue;
      }
      return w.split(' ').map((p) => p.isEmpty ? p : p[0].toUpperCase() + p.substring(1)).join(' ');
    }
  }
  return '';
}

/// "050 571 9594" in the UAE -> "+971505719594"; already-international numbers stay.
String _internationalise(String n, _Country? c) {
  if (n.isEmpty || n.startsWith('+') || c == null) return n;
  if (n.startsWith('00')) return '+${n.substring(2)}';
  if (n.startsWith('0')) return '+${c.dial}${n.substring(1)}';
  // Nepal mobiles are written without a leading zero: 98xxxxxxxx
  if (c.dial == '977' && n.length == 10 && n.startsWith('9')) return '+977$n';
  return n;
}

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
  if (s.length < 7 || s.length > 13) return ''; // longer runs are tax or account numbers
  return (plus ? '+' : '') + s;
}

String _stripLabel(String line) {
  var s = line.trim();
  // "Tel : ", "E-mail:", "Mob. " ... at the start
  // Longest label first, so "website" wins over "web" and "site" is not left behind.
  final labels = [..._labelWords]..sort((a, b) => b.length.compareTo(a.length));
  s = s.replaceFirst(RegExp(r'^(?:' + labels.map(RegExp.escape).join('|') + r')\.?\s*[:\-]?\s*', caseSensitive: false), '');
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
      // Tax numbers, order numbers, boxes, accounts: digits, but not phones.
      if (RegExp(r'trn|tax|vat|box|order|invoice|\binv\b|lpo|account|\bacc\b|iban|licen|\breg|\bcr\b|date|ref|serial|\bs/?n\b').hasMatch(labelZone)) {
        rest = rest.replaceFirst(m.group(0)!, ' ');
        continue;
      }
      // A mobile prefix outranks a generic "Tel" label: the number type is what
      // the contact needs (WhatsApp, dialling), and cards often say "Tel" for both.
      final mobilePrefix = RegExp(r'^(\+?9715\d{8}|05\d{8}|\+?9779[78]\d{8}|9[78]\d{8})$').hasMatch(n);
      if (RegExp(r'fax|\bf\b').hasMatch(labelZone)) {
        phonesFax.add(n);
      } else if (RegExp(r'mob|cell|gsm|whatsapp|\bm\b|\bhp\b').hasMatch(labelZone) || mobilePrefix) {
        phonesMobile.add(n);
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

  // Country: from an international prefix first, else from a city or country word anywhere on the card.
  final allLower = lines.join('\n').toLowerCase();
  _Country? country;
  for (final n in [...phonesMobile, ...phonesWork, ...phonesFax]) {
    country ??= _countryByDial(n);
  }
  country ??= _countryByWords(allLower);
  // A local UAE mobile (05x xxx xxxx) is a strong hint even without a prefix or a city.
  if (country == null && [...phonesMobile, ...phonesWork].any((n) => RegExp(r'^05\d{8}$').hasMatch(n))) {
    country = _countries.first; // UAE
  }
  if (country != null) {
    card.country = country.name;
    card.city = _cityIn(addressLines.join(' ').toLowerCase(), country);
    if (card.city.isEmpty) card.city = _cityIn(allLower, country);
  }
  String intl(String n) => _internationalise(n, country);

  card.mobile = phonesMobile.isNotEmpty ? intl(phonesMobile.first) : '';
  card.phone = phonesWork.isNotEmpty ? intl(phonesWork.first) : '';
  card.fax = phonesFax.isNotEmpty ? intl(phonesFax.first) : '';
  final extraPhones = [...phonesMobile.skip(1), ...phonesWork.skip(1), ...phonesFax.skip(1)].map(intl);

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

  // No company line? The web or email domain names it: www.gorkha.ae -> Gorkha.
  if (card.company.isEmpty) {
    final fromDomain = _companyFromDomain(card.website.isNotEmpty ? card.website : card.email);
    if (fromDomain.isNotEmpty) card.company = fromDomain;
  }

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

/// "www.gorkha.ae" or "info@al-yamama.com" -> "Gorkha" / "Al Yamama".
String _companyFromDomain(String s) {
  var d = s.trim().toLowerCase();
  if (d.isEmpty) return '';
  if (d.contains('@')) d = d.substring(d.indexOf('@') + 1);
  d = d.replaceFirst(RegExp(r'^https?://'), '').replaceFirst(RegExp(r'^www\.'), '').split('/').first;
  final parts = d.split('.').where((p) => p.isNotEmpty).toList();
  if (parts.length < 2) return '';
  // drop the public suffix (.com, .ae, .co.uk ...)
  var label = parts[parts.length - 2];
  if (label.length <= 3 && parts.length >= 3 && ['co', 'com', 'net', 'org', 'ac', 'gov', 'edu'].contains(label)) {
    label = parts[parts.length - 3];
  }
  if (['gmail', 'yahoo', 'hotmail', 'outlook', 'live', 'icloud', 'me', 'proton', 'protonmail', 'aol', 'msn', 'ymail',
       'rediffmail', 'mail', 'email', 'example'].contains(label)) {
    return '';
  }
  return label
      .split(RegExp(r'[-_]+'))
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
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
