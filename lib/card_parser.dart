/// Turns the recognised text of a business card into contact fields.
/// Heuristics only, on the phone; the user reviews before saving.
///
/// Rules were tuned on 40 real cards from 17 countries (see the test file).
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

// ---------------------------------------------------------------- word lists

final _emailRx = RegExp(r'[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}');
final _wwwRx = RegExp(r'(?:https?://)?www\.[A-Za-z0-9\-]+(?:\.[A-Za-z0-9\-]+)+(?:/\S*)?', caseSensitive: false);
final _bareDomainRx = RegExp(
    r'(?<![@\w.])[A-Za-z0-9][A-Za-z0-9\-]{2,}(?:\.[A-Za-z0-9\-]+)*\.(?:com|net|org|ae|co|io|info|biz|me|uk|in|np|sa|qa|om|kw|bh|de|fr|it|es|nl|be|at|ch|jp|cn|hk|kr|tw|vn|br|au|ca|us|eu|tv|app|dev|shop|store|pk|bd|lk|ph|eg|tr|za|ke|ng|ru|my|sg|id|th|pt|se|gr|pl|cz|hu|ro|ua)\b(?:/\S*)?',
    caseSensitive: false);
final _phoneRx = RegExp(r'(?<![A-Za-z])\+?\(?\d[\d\s().\-/]{4,}\d'); // H5: not glued to a letter ("a4 03 ...")
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
  // organisations and legal forms (D4)
  'embassy', 'consulate', 'ministry', 'department', 'authority', 'municipality', 'council', 'chamber', 'association',
  'society', 'federation', 'union', 'party', 'club', 'college', 'academy', 'service', 'rescue', 'fire', 'police',
  'assessoria', 'ltda', 's.a.', 's.a', 's.r.l', 'srl', 'sarl', 'pty', 'pvt', 'sdn', 'bhd', 'pte', 'k.k.', 'jsc', 'pjsc',
  'llp', 'oy', 'ab', 'bv', 'b.v.', 'nv', 'n.v.', 'healthcare', 'diputacion', 'diputación', 'ayuntamiento', 'commercial',
  'technical', 'national', 'global', 'regional', 'corporate',
];
// A title beats these company words when both occur on one line (D2).
const _weakCompanyWords = [
  'general', 'international', 'industrial', 'commercial', 'technical', 'national', 'global', 'regional', 'corporate',
  'services', 'service', 'solutions', 'group', 'media', 'design', 'studio', 'department',
];
final _strongCompanyWords = _companyWords.where((w) => !_weakCompanyWords.contains(w)).toList();

/// "Dubai, U.A.E.", "Balaju, Kathmandu": at least half the words name places.
bool _mostlyPlaceWords(String lower) {
  // whole tokens only: "taiwan-hot" is not the place "taiwan" (Q4)
  final tokens = lower.split(RegExp(r'[\s,]+')).where((w) => w.isNotEmpty).map((w) => w.replaceAll(RegExp(r'^[^a-z]+|[^a-z]+$'), '')).where((w) => w.isNotEmpty).toList();
  if (tokens.isEmpty) return false;
  final joined = tokens.join(' ');
  var hits = 0;
  for (final c in _countries) {
    for (final w in c.words) {
      if (w.contains(' ')) {
        if (' $joined '.contains(' $w ')) hits += w.split(' ').length;
      } else if (tokens.contains(w)) {
        hits += 1;
      }
    }
  }
  return hits * 2 >= tokens.length;
}

const _titleWords = [
  'manager', 'director', 'ceo', 'cfo', 'coo', 'cto', 'engineer', 'sales', 'executive', 'officer', 'head of', 'president',
  'vice', 'founder', 'owner', 'partner', 'consultant', 'supervisor', 'coordinator', 'accountant', 'secretary',
  'representative', 'chairman', 'specialist', 'assistant', 'marketing', 'purchase', 'purchasing', 'procurement', 'managing',
  'in-charge', 'incharge', 'technician', 'analyst', 'developer', 'designer', 'architect', 'proprietor', 'agent', 'advisor',
  'lead', 'chief', 'administrator', 'admin', 'clerk', 'controller', 'auditor', 'surveyor', 'foreman', 'mechanic',
  'operator', 'md', 'gm', 'business development', 'relationship', 'account', 'customer service', 'supply chain',
  // J
  'journalist', 'author', 'editor', 'photographer', 'professor', 'lecturer', 'surgeon', 'physician', 'dentist',
  'pharmacist', 'lawyer', 'advocate', 'attorney', 'scout', 'pilot', 'captain', 'trainer', 'artist', 'writer', 'freelance',
  'diretor', 'directeur', 'direktor', 'gerente', 'presidente', 'geschäftsführer', 'geschaftsfuhrer', 'leiter', 'ingeniero',
  'ingenieur', 'engenheiro', 'consultor', 'coordenador', 'responsable', 'proprietario', 'socio', 'vendedor', 'minister',
  'deputy', 'attache', 'attaché', 'product manager', 'support',
];
// Department lines: never a title, never a name (S1)
const _deptWords = ['department', 'dept', 'division', 'phong kinh doanh', 'kinh doanh', 'abteilung', 'departamento'];
const _addressWords = [
  'p.o.box', 'po box', 'p.o. box', 'p o box', 'pobox', 'postbus', 'apartado', 'street', 'st.', 'road', 'rd.', 'avenue',
  'ave.', 'building', 'bldg', 'tower', 'office', 'floor', 'suite', 'area', 'industrial', 'zone', 'plot', 'shop no',
  'warehouse', 'block', 'near', 'opposite', 'behind', 'rue', 'strasse', 'straße', 'str.', 'calle', 'paseo', 'plaza',
  'lane', 'drive', 'boulevard', 'blvd', 'highway', 'sector', 'district', 'city', 'estate', 'park', 'p.o', 'box',
  'unit',
];
const _labelWords = [
  'tel', 'tele', 'telephone', 'phone', 'ph', 'fax', 'mobile', 'mob', 'cell', 'gsm', 'whatsapp', 'e-mail', 'email', 'mail',
  'web', 'website', 'www', 'address', 'add', 'off', 'office', 'direct', 'toll free', 'voice', 'dir', 'skype', 'blog',
  'web blog', 'hp', 'handphone', 'móvil', 'movil', 'portable', 'handy', 'telefon', 'telefone', 'celular', 'cel', 'tél',
  'tel.', 'fon', 'tlf',
];
const _honorifics = ['mr', 'mrs', 'ms', 'miss', 'dr', 'eng', 'er', 'engr', 'prof', 'docteur', 'dott', 'ing', 'adv', 'capt',
  'sh', 'sheikh', 'h.e', 'hon'];
const _nameParticles = ['al', 'bin', 'bint', 'van', 'de', 'da', 'del', 'la', 'le', 'du', 'di', 'von', 'el', 'der', 'den',
  'dos', 'das', 'y', 'e', 'abu', 'ibn', 'ben', 'mac', 'mc', 'st', 'san', 'ter', 'op', 'ul', 'ur', 'bt'];

const _keepCaps = {
  'LLC', 'L.L.C', 'L.L.C.', 'FZE', 'FZCO', 'FZC', 'DMCC', 'PLC', 'GMBH', 'UAE', 'U.A.E', 'U.A.E.', 'USA', 'UK', 'KSA',
  'JLT', 'DIP', 'DAFZA', 'JAFZA', 'AG', 'SA', 'BV', 'NV', 'PVT', 'LLP', 'LP', 'P.O.', 'CEO', 'CFO', 'COO', 'CTO', 'MD', 'GM',
  'HR', 'IT', 'QA', 'QC', 'HSE', 'PRO', 'VP', 'SVP', 'EVP', 'II', 'III', '&', 'LTDA', 'S.A.', 'SRL', 'BMW', 'IBM', 'CPMN',
};

// --------------------------------------------------------------- countries

class _Country {
  final String name, dial, tld;
  final List<String> words;
  final RegExp? mobile; // national significant number of a mobile
  const _Country(this.name, this.dial, this.tld, this.words, [this.mobile]);
}

final _countries = [
  _Country('UAE', '971', 'ae', ['uae', 'u.a.e', 'united arab emirates', 'emirates', 'dubai', 'abu dhabi', 'abudhabi', 'sharjah',
      'ajman', 'fujairah', 'ras al khaimah', 'rak', 'umm al quwain', 'al ain', 'musaffah', 'mussafah', 'al quoz', 'deira',
      'jebel ali', 'jafza', 'dafza', 'jlt', 'dip', 'icad', 'kizad'], RegExp(r'^5\d{8}$')),
  _Country('Nepal', '977', 'np', ['nepal', 'kathmandu', 'pokhara', 'lalitpur', 'biratnagar', 'birgunj', 'butwal', 'bhairahawa'],
      RegExp(r'^9[78]\d{8}$')),
  _Country('Saudi Arabia', '966', 'sa', ['saudi', 'ksa', 'riyadh', 'jeddah', 'dammam', 'khobar', 'jubail', 'makkah', 'madinah'],
      RegExp(r'^5\d{8}$')),
  _Country('Qatar', '974', 'qa', ['qatar', 'doha'], RegExp(r'^[3567]\d{7}$')),
  _Country('Oman', '968', 'om', ['oman', 'muscat', 'sohar', 'salalah'], RegExp(r'^9\d{7}$')),
  _Country('Kuwait', '965', 'kw', ['kuwait'], RegExp(r'^[569]\d{7}$')),
  _Country('Bahrain', '973', 'bh', ['bahrain', 'manama'], RegExp(r'^3\d{7}$')),
  _Country('India', '91', 'in', ['india', 'mumbai', 'delhi', 'new delhi', 'chennai', 'bangalore', 'bengaluru', 'kolkata',
      'hyderabad', 'pune', 'ahmedabad', 'kochi', 'cochin', 'kerala', 'gujarat', 'tamil nadu', 'noida', 'gurgaon', 'gurugram'],
      RegExp(r'^[6-9]\d{9}$')),
  _Country('Pakistan', '92', 'pk', ['pakistan', 'karachi', 'lahore', 'islamabad', 'rawalpindi', 'peshawar'], RegExp(r'^3\d{9}$')),
  _Country('Bangladesh', '880', 'bd', ['bangladesh', 'dhaka', 'chittagong'], RegExp(r'^1\d{9}$')),
  _Country('Sri Lanka', '94', 'lk', ['sri lanka', 'colombo'], RegExp(r'^7\d{8}$')),
  _Country('Philippines', '63', 'ph', ['philippines', 'manila', 'cebu'], RegExp(r'^9\d{9}$')),
  _Country('Egypt', '20', 'eg', ['egypt', 'cairo', 'alexandria'], RegExp(r'^1\d{9}$')),
  _Country('Jordan', '962', 'jo', ['jordan', 'amman'], RegExp(r'^7\d{8}$')),
  _Country('Lebanon', '961', 'lb', ['lebanon', 'beirut']),
  _Country('Turkey', '90', 'tr', ['turkey', 'türkiye', 'istanbul', 'ankara'], RegExp(r'^5\d{9}$')),
  _Country('United Kingdom', '44', 'uk', ['united kingdom', 'england', 'scotland', 'wales', 'london', 'manchester',
      'birmingham', 'leeds', 'glasgow'], RegExp(r'^7\d{9}$')),
  _Country('Germany', '49', 'de', ['germany', 'deutschland', 'berlin', 'hamburg', 'munich', 'münchen', 'frankfurt', 'köln',
      'stuttgart', 'bonn', 'düsseldorf'], RegExp(r'^1[5-7]\d{8,9}$')),
  _Country('Italy', '39', 'it', ['italy', 'italia', 'milan', 'milano', 'rome', 'roma', 'torino', 'napoli'], RegExp(r'^3\d{8,9}$')),
  _Country('France', '33', 'fr', ['france', 'paris', 'lyon', 'marseille', 'toulouse', 'nice'], RegExp(r'^[67]\d{8}$')),
  _Country('Spain', '34', 'es', ['spain', 'españa', 'espana', 'madrid', 'barcelona', 'valencia', 'sevilla', 'burgos'],
      RegExp(r'^[67]\d{8}$')),
  _Country('Netherlands', '31', 'nl', ['netherlands', 'nederland', 'holland', 'amsterdam', 'rotterdam', 'utrecht',
      'eindhoven', 'den haag'], RegExp(r'^6\d{8}$')),
  _Country('Belgium', '32', 'be', ['belgium', 'belgique', 'belgië', 'brussels', 'bruxelles', 'brussel', 'antwerp',
      'antwerpen', 'liege', 'liège', 'gent', 'aywaille'], RegExp(r'^4\d{8}$')),
  _Country('Austria', '43', 'at', ['austria', 'österreich', 'osterreich', 'wien', 'vienna', 'graz', 'linz', 'salzburg',
      'innsbruck'], RegExp(r'^6\d{7,11}$')),
  _Country('Switzerland', '41', 'ch', ['switzerland', 'schweiz', 'suisse', 'zurich', 'zürich', 'geneva', 'genève', 'basel',
      'bern'], RegExp(r'^7[5-9]\d{7}$')),
  _Country('Portugal', '351', 'pt', ['portugal', 'lisbon', 'lisboa', 'porto'], RegExp(r'^9\d{8}$')),
  _Country('Sweden', '46', 'se', ['sweden', 'sverige', 'stockholm', 'göteborg', 'gothenburg', 'malmö'], RegExp(r'^7\d{8}$')),
  _Country('China', '86', 'cn', ['china', 'shanghai', 'beijing', 'guangzhou', 'shenzhen', 'ningbo', 'hangzhou', 'xiamen',
      'qingdao', 'tianjin', 'suzhou'], RegExp(r'^1[3-9]\d{9}$')),
  _Country('Hong Kong', '852', 'hk', ['hong kong', 'kowloon']),
  _Country('Taiwan', '886', 'tw', ['taiwan', 'taipei', 'kaohsiung', 'taichung', 'hsinchu', 'tainan', 'r.o.c'],
      RegExp(r'^9\d{8}$')),
  _Country('Japan', '81', 'jp', ['japan', 'tokyo', 'osaka', 'yokohama', 'nagoya'], RegExp(r'^[789]0\d{8}$')),
  _Country('South Korea', '82', 'kr', ['korea', 'seoul', 'busan', 'incheon', 'gangwon'], RegExp(r'^10\d{8}$')),
  _Country('Vietnam', '84', 'vn', ['vietnam', 'viet nam', 'hanoi', 'ha noi', 'ho chi minh', 'saigon', 'da nang'],
      RegExp(r'^[35789]\d{8}$')),
  _Country('Singapore', '65', 'sg', ['singapore'], RegExp(r'^[89]\d{7}$')),
  _Country('Malaysia', '60', 'my', ['malaysia', 'kuala lumpur', 'penang', 'johor'], RegExp(r'^1\d{8,9}$')),
  _Country('Indonesia', '62', 'id', ['indonesia', 'jakarta', 'surabaya', 'bandung'], RegExp(r'^8\d{8,10}$')),
  _Country('Thailand', '66', 'th', ['thailand', 'bangkok'], RegExp(r'^[689]\d{8}$')),
  _Country('Australia', '61', 'au', ['australia', 'sydney', 'melbourne', 'perth', 'brisbane', 'adelaide', 'nsw', 'qld',
      'victoria'], RegExp(r'^4\d{8}$')),
  _Country('Brazil', '55', 'br', ['brazil', 'brasil', 'sao paulo', 'são paulo', 'rio de janeiro', 'belo horizonte',
      'curitiba', 'porto alegre', 'brasília', 'brasilia'], RegExp(r'^\d\d9\d{8}$')),
  _Country('USA', '1', 'us', ['usa', 'u.s.a', 'united states', 'new york', 'houston', 'chicago', 'los angeles', 'texas',
      'florida', 'california', 'miami', 'michigan', 'ohio', 'illinois', 'arizona', 'georgia', 'washington', 'virginia',
      'utah', 'wisconsin', 'new jersey', 'massachusetts', 'pennsylvania', 'colorado', 'nevada', 'oregon', 'minnesota',
      'missouri', 'tennessee', 'indiana', 'maryland', 'louisiana', 'oklahoma', 'kentucky', 'carolina', 'alabama',
      'dallas', 'boston', 'seattle', 'denver', 'atlanta', 'phoenix']),
  _Country('Canada', '1', 'ca', ['canada', 'toronto', 'vancouver', 'montreal', 'ontario', 'quebec', 'alberta']),
  _Country('South Africa', '27', 'za', ['south africa', 'johannesburg', 'cape town', 'durban', 'pretoria'], RegExp(r'^[678]\d{8}$')),
  _Country('Kenya', '254', 'ke', ['kenya', 'nairobi', 'mombasa'], RegExp(r'^7\d{8}$')),
  _Country('Nigeria', '234', 'ng', ['nigeria', 'lagos', 'abuja'], RegExp(r'^[789]\d{9}$')),
  _Country('Russia', '7', 'ru', ['russia', 'moscow', 'st. petersburg'], RegExp(r'^9\d{9}$')),
];

final _dialCodes = {for (final c in _countries) c.dial}.toList()..sort((a, b) => b.length.compareTo(a.length));

_Country? _countryByDial(String digits) {
  _Country? best;
  for (final c in _countries) {
    if (digits.startsWith(c.dial) && (best == null || c.dial.length > best.dial.length)) best = c;
  }
  if (best != null && best.dial == '1' && digits.length != 11) return null; // B5
  return best;
}

_Country? _countryByWords(String lower) {
  for (final c in _countries) {
    if (_hasWord(lower, c.words)) return c;
  }
  // US state + ZIP: "TX 76247", "NY 10021-1234"
  if (RegExp(r'\b[A-Z]{2} \d{5}(?:-\d{4})?\b').hasMatch(lower.toUpperCase())) {
    return _countries.firstWhere((c) => c.name == 'USA');
  }
  return null;
}

_Country? _countryByTld(String site) {
  var d = site.toLowerCase();
  if (d.contains('@')) d = d.substring(d.indexOf('@') + 1);
  d = d.replaceFirst(RegExp(r'^https?://'), '').split('/').first;
  final tld = d.split('.').last;
  for (final c in _countries) {
    if (c.tld == tld) return c;
  }
  return null;
}

const _countryWordsOnly = {
  'uae', 'u.a.e', 'emirates', 'united arab emirates', 'saudi', 'ksa', 'usa', 'u.s.a', 'united states', 'korea', 'nepal',
  'india', 'china', 'japan', 'italy', 'italia', 'france', 'spain', 'españa', 'espana', 'germany', 'deutschland', 'england',
  'scotland', 'wales', 'united kingdom', 'egypt', 'oman', 'qatar', 'kuwait', 'bahrain', 'jordan', 'lebanon', 'turkey',
  'türkiye', 'netherlands', 'nederland', 'holland', 'belgium', 'belgique', 'belgië', 'austria', 'österreich', 'osterreich',
  'switzerland', 'schweiz', 'suisse', 'portugal', 'sweden', 'sverige', 'singapore', 'malaysia', 'indonesia', 'thailand',
  'vietnam', 'viet nam', 'australia', 'canada', 'south africa', 'kenya', 'nigeria', 'russia', 'pakistan', 'bangladesh',
  'sri lanka', 'philippines', 'hong kong', 'taiwan', 'r.o.c', 'brazil', 'brasil', 'texas', 'florida', 'california',
  'michigan', 'ohio', 'illinois', 'arizona', 'georgia', 'washington', 'virginia', 'utah', 'wisconsin', 'new jersey',
  'massachusetts', 'pennsylvania', 'colorado', 'nevada', 'oregon', 'minnesota', 'missouri', 'tennessee', 'indiana',
  'maryland', 'louisiana', 'oklahoma', 'kentucky', 'carolina', 'alabama', 'kerala', 'gujarat', 'tamil nadu', 'jafza',
  'dafza', 'jlt', 'dip', 'icad', 'kizad', 'nsw', 'qld', 'victoria', 'ontario', 'quebec', 'alberta', 'gangwon',
};

String _cityIn(String lower, _Country c) {
  for (final w in c.words) {
    if (_countryWordsOnly.contains(w)) continue;
    if (_hasWord(lower, [w])) {
      return w.split(' ').map((p) => p.isEmpty ? p : p[0].toUpperCase() + p.substring(1)).join(' ');
    }
  }
  return '';
}

// ----------------------------------------------------------------- helpers

bool _hasWord(String lower, List<String> words) {
  for (final w in words) {
    var from = 0;
    while (true) {
      final i = lower.indexOf(w, from);
      if (i < 0) break;
      final before = i == 0 ? ' ' : lower[i - 1];
      final afterIdx = i + w.length;
      final after = afterIdx >= lower.length ? ' ' : lower[afterIdx];
      final wordChar = RegExp(r'[a-z0-9]');
      if (!wordChar.hasMatch(before) && !wordChar.hasMatch(after)) return true;
      from = i + 1;
    }
  }
  return false;
}

/// "05O 123 4567" -> "050 123 4567": inside tokens that are mostly digits,
/// the letters O, I, l and | are OCR misreads of 0 and 1.
String _fixDigits(String line) {
  final toks = line.split(' ');
  for (var i = 0; i < toks.length; i++) {
    final tok = toks[i];
    final digits = RegExp(r'\d').allMatches(tok).length;
    final confusable = RegExp(r'[OoIl|]').allMatches(tok).length;
    final punct = RegExp(r'[+()\-./]').allMatches(tok).length;
    final other = tok.length - digits - confusable - punct;
    final prevHasDigits = i > 0 && RegExp(r'\d{2,}').hasMatch(toks[i - 1]);
    // X1: "86 OO" - a short token of only O/I/l right after a digit token is digits too
    final onlyConfusable = RegExp(r'^[OoIl]{1,3}$').hasMatch(tok) && prevHasDigits; // Q2: never a pipe
    if ((digits >= 2 && confusable > 0 && other == 0) || onlyConfusable) {
      toks[i] = tok.replaceAll(RegExp(r'[Oo]'), '0').replaceAll(RegExp(r'[Il|]'), '1');
    }
  }
  return toks.join(' ');
}

final _labelsSorted = [..._labelWords]..sort((a, b) => b.length.compareTo(a.length));
final _labelStartRx = RegExp(
    r'^(?:' + _labelsSorted.map(RegExp.escape).join('|') + r')(?=[\s.:\-/]|$)\.?\s*[:\-]?\s*',
    caseSensitive: false); // E6: a boundary after the label
/// A label followed by a colon anywhere in a line ("Tel: Fax:" left behind).
final _labelColonRx = RegExp(
    r'(?<![A-Za-z])(?:' + _labelsSorted.map(RegExp.escape).join('|') + r')\.?\s*:',
    caseSensitive: false);
final _labelOnlyRx = RegExp(
    r'^(?:' + _labelsSorted.map(RegExp.escape).join('|') + r')[.:\s\-/]*(?:/(?:fax|tel|phone))?[.:\s\-]*$',
    caseSensitive: false);

String _stripLabel(String line) {
  var s = line.trim();
  var prev = '';
  while (s != prev) {
    prev = s;
    s = s.replaceFirst(_labelStartRx, '').trim();
  }
  return s;
}

String _tidy(String s) => s
    .replaceFirst(RegExp(r'^[^A-Za-z0-9+(@]+'), '') // A4
    .replaceFirst(RegExp(r'[\s:;,|\-]+$'), '')
    .replaceAll(RegExp(r'\s{2,}'), ' ')
    .trim();

/// Lower-case alphabetic tokens of at least [min] letters.
List<String> _tokens(String s, [int min = 3]) =>
    RegExp(r'[A-Za-z]+').allMatches(s).map((m) => m.group(0)!.toLowerCase()).where((t) => t.length >= min).toList();

String _domainLabel(String site) {
  var d = site.trim().toLowerCase();
  if (d.isEmpty) return '';
  if (d.contains('@')) d = d.substring(d.indexOf('@') + 1);
  d = d.replaceFirst(RegExp(r'^https?://'), '').replaceFirst(RegExp(r'^www\.'), '').split('/').first;
  final parts = d.split('.').where((p) => p.isNotEmpty).toList();
  if (parts.length < 2) return '';
  var label = parts[parts.length - 2];
  if (parts.length >= 3 && ['co', 'com', 'net', 'org', 'ac', 'gov', 'edu', 'or', 'ne'].contains(label)) {
    label = parts[parts.length - 3];
  }
  return label;
}

const _freeMailHosts = {
  'gmail', 'yahoo', 'hotmail', 'outlook', 'live', 'icloud', 'me', 'proton', 'protonmail', 'aol', 'msn', 'ymail',
  'rediffmail', 'rediff', 'mail', 'email', 'example', 'sify', 'naver', 'daum', 'hanmail', 'qq', '163', '126', 'sina',
  'uol', 'bol', 'globo', 'gmx', 'web', 't-online', 'libero', 'tiscali', 'vnn', 'fpt', 'wlink', 'ntc', 'mos', 'eim',
  'emirates', 'etisalat', 'du', 'hinet', 'seed', 'terra', 'verizon', 'comcast', 'att', 'sbcglobal', 'bt', 'btinternet',
  'sky', 'orange', 'wanadoo', 'free', 'blogspot', 'wordpress',
};
// Mock-up cards: "yourcompany.com", "example.com", "xyz123.com"
final _placeholderDomainRx = RegExp(r'^(?:xyz|abc|example|test|company|yourcompany|domain|yourdomain|sample|mycompany|website|yourname|companyname|brand|logo)\d*$');

/// "www.gorkha.ae" or "info@al-yamama.com" -> "Gorkha" / "Al Yamama" (K).
String _companyFromDomain(String site, {String personName = ''}) {
  final label = _domainLabel(site);
  if (label.isEmpty || _freeMailHosts.contains(label) || _placeholderDomainRx.hasMatch(label)) return '';
  final compactName = personName.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  final compactLabel = label.replaceAll(RegExp(r'[^a-z0-9]'), '');
  if (compactName.isNotEmpty && (compactLabel == compactName || compactLabel.contains(compactName))) return '';
  final nameTokens = _tokens(personName);
  if (nameTokens.isNotEmpty && nameTokens.every((t) => compactLabel.contains(t))) return '';
  if (RegExp(r'^\d+$').hasMatch(compactLabel)) return '';
  return label
      .split(RegExp(r'[-_]+'))
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
}

String _titleCaseIfShouting(String s) {
  s = s.replaceAll(RegExp(r'\s*&\s*'), ' & ').replaceAll(RegExp(r'\s{2,}'), ' ').trim();
  if (s != s.toUpperCase() || s.length < 4) return s;
  String cap(String w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase();
  return s
      .split(' ')
      .map((w) {
        final core = w.replaceAll(RegExp(r'[.,;:]+$'), '');
        if (_keepCaps.contains(core)) return w;
        return w.split('-').map(cap).join('-');
      })
      .join(' ');
}

String _stripHonorific(String s) {
  var out = s.replaceFirst(RegExp(r'^(?:' + _honorifics.join('|') + r')\.?\s+', caseSensitive: false), '').trim();
  // N7: a misread honorific such as "pb." before at least two more words
  // (a single capital initial such as "A." stays)
  out = out.replaceFirst(RegExp(r'^(?:[a-z]{1,3}|[A-Za-z]{2,3})\.\s+(?=\S+\s+\S+)'), '').trim();
  return out;
}

/// A1: every word capitalised or a particle; no single ALL-CAPS word, no "..".
bool _looksLikeName(String s) {
  if (s.contains('..') || s.contains('&') || _digitsRx.hasMatch(s)) return false;
  if (!RegExp(r"^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ.\-' ]+$").hasMatch(s)) return false;
  final words = s.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  if (words.isEmpty || words.length > 4 || s.length > 40) return false;
  for (final w in words) {
    final core = w.replaceAll(RegExp(r'[.\-]'), '');
    if (core.isEmpty) return false;
    final lower = w.toLowerCase().replaceAll('.', '');
    if (_nameParticles.contains(lower) || _honorifics.contains(lower)) continue;
    if (w.endsWith('.') && core.length >= 2 && !_honorifics.contains(lower)) return false; // "Research.." style
    if (core[0] != core[0].toUpperCase()) return false;
  }
  // N3: "AagQIWwe" - a capital after a lower-case letter inside a word is OCR junk;
  // "Rrrkaxrmbrilyg" - no vowel, or five consonants in a row, is junk too
  for (final w in words) {
    final core = w.replaceAll(RegExp(r"[.\-']"), '');
    if (RegExp(r'[a-z][A-Z]').hasMatch(core) && !RegExp(r"^(Mc|Mac|O'|D')").hasMatch(w)) return false;
    final lower = core.toLowerCase();
    if (lower.length >= 4 && !RegExp(r'[aeiouy]').hasMatch(lower)) return false;
    if (RegExp(r'[bcdfghjklmnpqrstvwxz]{5}').hasMatch(lower)) return false;
  }
  if (words.length == 1) {
    if (words.first.replaceAll('.', '').length < 5) return false; // R1/N2: REVANTH passes, "Saat" does not
  }
  return true;
}

// ---------------------------------------------------------------- parsing

class _Phone {
  final String digits; // international form when possible
  final String kind; // mobile | work | fax | both
  final bool labelled;
  final bool international;
  const _Phone(this.digits, this.kind, this.labelled, this.international);
}

ContactCard parseCard(String text) {
  final card = ContactCard();

  // 1. Clean lines.
  var lines = <String>[];
  for (var raw in text.split('\n')) {
    var l = raw.trim();
    if (l.isEmpty || l.contains('�')) continue;
    final letters = RegExp(r'[A-Za-z0-9]').allMatches(l).length;
    final junk = RegExp(r'[^\w\s@.+\-:/(),&#]').allMatches(l).length;
    if (letters == 0 || junk > letters) continue;
    // F1: "alkurdi @ alphamedgroup.com", "almulla. st@pg.com", "www. x" (R6: only after a real token)
    l = l.replaceAll(RegExp(r'\s*@\s*'), '@').replaceAll(RegExp(r'(?<=[A-Za-z0-9]{3})\.\s+(?=[A-Za-z0-9_\-]+@)'), '.');
    l = l.replaceAll(RegExp(r'www\.\s+', caseSensitive: false), 'www.');
    lines.add(_fixDigits(l));
  }

  // F2: emails and web addresses split over lines ("fish.wu@" ... "cmi.mercedes-benz.com.tw").
  final joined = <String>[];
  final consumed = <int>{};
  for (var i = 0; i < lines.length; i++) {
    if (consumed.contains(i)) continue;
    var l = lines[i];
    final endsAt = RegExp(r'[A-Za-z0-9._\-]+@[A-Za-z0-9.\-]*$').hasMatch(l) && !_emailRx.hasMatch(l);
    if (l.endsWith('@') || endsAt) {
      // F2b: the domain may sit up to three lines further down
      for (var k = i + 1; k < lines.length && k <= i + 3; k++) {
        if (RegExp(r'^[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$').hasMatch(lines[k].trim())) {
          l = l + lines[k].trim();
          consumed.add(k);
          break;
        }
      }
    } else if (i + 1 < lines.length && lines[i + 1].startsWith('@') && !l.contains('@')) {
      l = l.trimRight() + lines[i + 1].trim();
      consumed.add(i + 1);
    }
    joined.add(l);
  }
  lines = joined;

  // E1: a label alone on a line applies to the next line.
  final merged = <String>[];
  for (var i = 0; i < lines.length; i++) {
    final l = lines[i];
    if (_labelOnlyRx.hasMatch(l) && i + 1 < lines.length) {
      merged.add('$l ${lines[i + 1]}');
      i++;
    } else {
      merged.add(l);
    }
  }
  lines = merged;

  final allLower = lines.join('\n').toLowerCase();

  // 2. Emails and websites.
  final emails = <String>[];
  final sites = <String>[];
  final bareSites = <String>[];
  final stripped = <String>[];
  for (var l in lines) {
    for (final m in _emailRx.allMatches(l)) {
      emails.add(m.group(0)!);
    }
    l = l.replaceAll(_emailRx, ' ');
    for (final m in _wwwRx.allMatches(l)) {
      sites.add(m.group(0)!);
    }
    l = l.replaceAll(_wwwRx, ' ');
    for (final m in _bareDomainRx.allMatches(l)) {
      final w = m.group(0)!;
      final label = w.split('.').first;
      if (label.length >= 3 && w == w.toLowerCase()) bareSites.add(w); // F3: "m.com", "M.Com" are junk
    }
    l = l.replaceAll(_bareDomainRx, ' ');
    stripped.add(l);
  }
  card.email = emails.isNotEmpty ? emails.first.replaceFirst(RegExp(r'^[._\-]+'), '') : '';
  card.website = sites.isNotEmpty ? sites.first : (bareSites.isNotEmpty ? bareSites.first : '');

  // 3. A first guess of the country from words and domains (used for numbers).
  _Country? country = _countryByWords(allLower);
  country ??= card.website.isNotEmpty ? _countryByTld(card.website) : null;
  country ??= card.email.isNotEmpty ? _countryByTld(card.email) : null;
  final countryFromText = country;

  // 4. Phone numbers.
  final phones = <_Phone>[];
  final rests = <String>[];
  final lineHadPhone = <bool>[]; // Q1: a number was really taken from this line
  final exclusionRx = RegExp(r'trn|tax|vat|box|order|invoice|\binv\b|lpo|account|\bacc\b|iban|licen|\breg|\bcr\b|date|ref|serial|\bs/?n\b|zip|postal|pin\b');
  final labelRx = RegExp(r'fax|tel|phone|\bph\b|\bt\b|\bf\b|mob|cell|gsm|whatsapp|\bm\b|\bhp\b|off|direct|voice|dir|handy|portable|celular|movil|móvil|tlf|fon');
  for (var l in stripped) {
    var rest = l;
    final lower = l.toLowerCase();
    final addressLine = _hasWord(lower, _addressWords);
    var took = false;
    for (final m in _phoneRx.allMatches(l)) {
      final raw = m.group(0)!;
      final before = l.substring(0, m.start).toLowerCase();
      final labelZone = before.length > 18 ? before.substring(before.length - 18) : before;
      // H4: an exclusion word only counts when it is the last label-like word before the number.
      final lastLabel = labelRx.allMatches(labelZone).map((x) => x.end).fold<int>(-1, (a, b) => b > a ? b : a);
      final lastExcl = exclusionRx.allMatches(labelZone).map((x) => x.end).fold<int>(-1, (a, b) => b > a ? b : a);
      if (lastExcl > lastLabel) continue; // a box / tax number stays in the address text
      final hasLabel = lastLabel >= 0;
      // G1: "(0)" trunk zero; B4: "(84-4)" / "(34)" country code in brackets.
      var s = raw.replaceAll(RegExp(r'\(\s*0\s*\)'), '');
      // H3b: "02 28/3320 55-57" - a trailing extension range
      final rangeRx = RegExp(r'\s*[-–]\s*\d{1,2}\s*$');
      if (rangeRx.hasMatch(s) && s.replaceFirst(rangeRx, '').replaceAll(RegExp(r'\D'), '').length >= 8) {
        s = s.replaceFirst(rangeRx, '');
      }
      final cc = RegExp(r'^\(?\s*(\d{1,3})\s*[-)]\s*').firstMatch(s);
      var international = raw.trim().startsWith('+') || raw.trim().startsWith('00');
      if (!international && cc != null && raw.trim().startsWith('(') && _dialCodes.contains(cc.group(1)!)) {
        final c = _countryByDial(cc.group(1)!);
        if (c != null && (countryFromText == null || countryFromText.name == c.name)) {
          s = '+${cc.group(1)!} ${s.substring(cc.end)}';
          international = true;
        }
      }
      var n = s.replaceAll(RegExp(r'[^\d+]'), '');
      if (n.startsWith('00')) n = '+${n.substring(2)}';
      final plus = n.startsWith('+');
      n = (plus ? '+' : '') + n.replaceAll('+', '');
      final digitCount = n.replaceAll('+', '').length;
      final minDigits = hasLabel ? 6 : 7;
      if (digitCount < minDigits || digitCount > 13) {
        rest = rest.replaceFirst(raw, ' ');
        continue;
      }
      // H2: on an address line a bare number needs a + or at least 9 digits.
      if (addressLine && !hasLabel && !plus && digitCount < 9) continue;
      if (plus) international = true;
      String kind;
      final faxLabel = RegExp(r'fax|\bf\b').hasMatch(labelZone);
      final telLabel = RegExp(r'tel|phone|\bph\b|\bt\b|off|direct|voice|dir\b|fon|tlf').hasMatch(labelZone);
      final mobLabel = RegExp(r'm[ao]b|cell|gsm|whatsapp|\bm\b|\bhp\b|handy|portable|celular|movil|móvil').hasMatch(labelZone); // L1: "Mabile"
      if (faxLabel && telLabel) {
        kind = 'both'; // E2: Tel/Fax
      } else if (faxLabel) {
        kind = 'fax';
      } else if (mobLabel) {
        kind = 'mobile';
      } else {
        kind = telLabel ? 'work' : 'unknown';
      }
      phones.add(_Phone(n, kind, hasLabel, international));
      rest = rest.replaceFirst(raw, ' ');
      took = true;
    }
    rests.add(rest);
    lineHadPhone.add(took);
  }

  // 5. Country vote (R4): international office/fax numbers, then an explicit country name,
  //    then international mobiles, then city words, then the TLD, then the UAE 05x guard.
  _Country? dialCountry(_Phone p, {required bool mobilesToo}) {
    if (!p.digits.startsWith('+')) return null;
    final c = _countryByDial(p.digits.substring(1));
    if (c == null) return null;
    final national = p.digits.substring(1 + c.dial.length);
    final isMob = p.kind == 'mobile' || (c.mobile != null && c.mobile!.hasMatch(national));
    if (isMob && !mobilesToo) return null;
    return c;
  }
  country = null;
  for (final p in phones) {
    country ??= dialCountry(p, mobilesToo: false);
  }
  if (country == null) {
    // company lines may name a foreign country ("Embassy of Sri Lanka" in Bonn) - leave them out,
    // together with a continuation line such as "OF SRI LANKA" (Q7, S4)
    final keep = <String>[];
    var afterCompany = false;
    for (final l in stripped) {
      if (_hasWord(l.toLowerCase(), _strongCompanyWords)) {
        afterCompany = true;
        continue;
      }
      if (afterCompany && RegExp(r'^(of|and|&|for)\b', caseSensitive: false).hasMatch(l.trim())) continue;
      afterCompany = false;
      keep.add(l);
    }
    final textNoCompany = keep.join('\n').toLowerCase();
    for (final c in _countries) {
      if (c.words.where(_countryWordsOnly.contains).any((w) => _hasWord(textNoCompany, [w]))) {
        country = c;
        break;
      }
    }
    country ??= _countryByWords(textNoCompany); // T3: city words, company lines excluded ("Bonn")
  }
  for (final p in phones) {
    country ??= dialCountry(p, mobilesToo: true);
  }
  country ??= (card.website.isNotEmpty ? _countryByTld(card.website) : null) ??
      (card.email.isNotEmpty ? _countryByTld(card.email) : null);
  if (country == null && phones.any((p) => RegExp(r'^05[024568]\d{7}$').hasMatch(p.digits))) {
    country = _countries.first; // UAE (I)
  }

  // Internationalise, drop trunk zeros (G2), type by numbering plan (C).
  String intl(String n) {
    if (n.startsWith('+')) return _dropTrunkZero(n);
    final c = country;
    if (c == null) return n;
    if (n.startsWith('0')) return _dropTrunkZero('+${c.dial}${n.substring(1)}');
    if (n.startsWith(c.dial) && n.length >= c.dial.length + 7) return _dropTrunkZero('+$n');
    if (c.mobile != null && c.mobile!.hasMatch(n)) return '+${c.dial}$n';
    if (n.length >= 8 && n.length <= 10) return '+${c.dial}$n';
    return n;
  }

  bool isMobile(String n) {
    if (!n.startsWith('+')) return false;
    final c = _countryByDial(n.substring(1));
    if (c?.mobile == null) return false;
    return c!.mobile!.hasMatch(n.substring(1 + c.dial.length));
  }

  final mobiles = <String>[], works = <String>[], faxes = <String>[];
  // H1: labelled and international numbers first, bare digit runs last.
  final ordered = [...phones]..sort((a, b) {
      int rank(_Phone p) => (p.labelled ? 0 : 2) + (p.international ? 0 : 1);
      return rank(a).compareTo(rank(b));
    });
  for (final p in ordered) {
    final n = intl(p.digits);
    switch (p.kind) {
      case 'fax':
        faxes.add(n);
      case 'both':
        works.add(n);
        faxes.add(n);
      case 'mobile':
        mobiles.add(n);
      default:
        if (isMobile(n)) {
          mobiles.add(n);
        } else {
          works.add(n);
        }
    }
  }
  card.mobile = mobiles.isNotEmpty ? mobiles.first : '';
  card.phone = works.isNotEmpty ? works.first : '';
  card.fax = faxes.isNotEmpty ? faxes.first : '';
  final extraPhones = {...mobiles.skip(1), ...works.skip(1), ...faxes.skip(1)}.toList();

  // 6. Classify the remaining text.
  final addressLines = <String>[];
  final companyLines = <String>[];
  final titleLines = <String>[];
  final nameCandidates = <String>[];
  final leftovers = <String>[];
  final order = <String, int>{}; // line text -> index, for adjacency scoring
  var idx = 0;

  final endedWithComma = <String>{};
  for (var li = 0; li < rests.length; li++) {
    final r0 = rests[li];
    // dangling "Tel: Fax:" labels left after the numbers were taken out
    final noLabels = r0.replaceAll(_labelColonRx, ' ');
    var rest = _tidy(_stripLabel(_tidy(noLabels)));
    if (rest.replaceAll(RegExp(r'[^A-Za-zÀ-ÿ]'), '').length < 2) continue;
    if (r0.trimRight().endsWith(',')) endedWithComma.add(rest); // N4
    final lowerRest = rest.toLowerCase();
    // D6/T1: a one-word leftover of a line that carried digits ("Studio", "FALUES 1312 5") is never a field.
    if (!rest.contains(' ') && (_hasWord(lowerRest, _labelWords) || lineHadPhone[li] || _digitsRx.hasMatch(stripped[li]))) continue;
    // S1: "Diagnostics Division", "Phong Kinh Doanh" are departments, not titles or names
    if (_hasWord(lowerRest, _deptWords) && _firstWordIndex(lowerRest, _titleWords) < 0) {
      leftovers.add(rest);
      continue;
    }
    idx++;
    order[rest] = idx;

    // E4: "Account Manager 1st Floor, Century Plaza" -> title + address;
    //     "Business Support Representative Shell Trading (M.E.) Pvt. Ltd" -> title + company
    final titleHit = _firstWordIndex(lowerRest, _titleWords);
    if (titleHit >= 0) {
      final addrHit = _firstWordIndex(lowerRest, _addressWords);
      final digitHit = rest.indexOf(_digitsRx);
      final cut = [addrHit, digitHit].where((i) => i > titleHit + 3).fold<int>(-1, (a, b) => a < 0 || b < a ? b : a);
      if (cut > 0) {
        final head = _tidy(rest.substring(0, cut));
        final tail = _tidy(rest.substring(cut));
        titleLines.add(head);
        if (tail.length > 3) addressLines.add(tail);
        continue;
      }
      final compHit = _lastWordIndex(lowerRest, ['pvt', 'ltd', 'llc', 'fze', 'inc', 'gmbh', 'ltda', 'limited', 'co.']);
      if (compHit > titleHit + 3) {
        // cut before the capitalised word that starts the company phrase
        final words = rest.split(' ');
        var acc = 0;
        var cutAt = -1;
        for (var i = 0; i < words.length; i++) {
          if (acc > titleHit + 3 && RegExp(r'^[A-Z]').hasMatch(words[i]) && !_titleWords.contains(words[i].toLowerCase())) {
            cutAt = acc;
            break;
          }
          acc += words[i].length + 1;
        }
        if (cutAt > 0) {
          titleLines.add(_tidy(rest.substring(0, cutAt)));
          companyLines.add(_tidy(rest.substring(cutAt)));
          continue;
        }
      }
    }

    final isTitle = titleHit >= 0;
    // R2: strong company words win over a title word; weak words and "Word & Word" lose to it.
    final strong = _hasWord(lowerRest, _strongCompanyWords);
    final amp = RegExp(r'\b[A-Z][a-zA-Z]+ & [A-Z][a-zA-Z]+').hasMatch(rest); // D3
    final isCompany = strong || _hasWord(lowerRest, _companyWords) || amp;
    final weakOnly = !strong;
    final cityOnly = _mostlyPlaceWords(lowerRest);
    if ((_hasWord(lowerRest, _addressWords) || cityOnly) && !isTitle && !strong) {
      addressLines.add(rest);
    } else if (isCompany && !(isTitle && weakOnly)) {
      companyLines.add(rest);
    } else if (isTitle) {
      titleLines.add(rest);
    } else if (_looksLikeName(_stripHonorific(rest))) {
      nameCandidates.add(rest);
    } else if (rest.contains(',') &&
        !RegExp(r'\d{3,}').hasMatch(rest) &&
        _countryByWords(lowerRest) == null &&
        _looksLikeName(_stripHonorific(rest.split(',').first.trim()))) { // Q6
      nameCandidates.add(rest.split(',').first.trim()); // A5: degrees after the comma
      order[rest.split(',').first.trim()] = idx;
    } else {
      leftovers.add(rest);
    }
  }

  // E5: consecutive title fragments ("Assistant Corporate" + "Marketing Manager")
  final titles = <String>[];
  for (var i = 0; i < titleLines.length; i++) {
    final t = titleLines[i];
    if (i + 1 < titleLines.length &&
        (order[titleLines[i + 1]] ?? -9) == (order[t] ?? -1) + 1 &&
        t.split(' ').length <= 3 &&
        _firstWordIndex(t.toLowerCase(), _titleWords) < 0 == false) {
      titles.add('$t ${titleLines[i + 1]}');
      i++;
    } else {
      titles.add(t);
    }
  }

  // D5: "EMBASSY OF THE ..." + "OF SRI LANKA"
  final companies = <String>[];
  for (var i = 0; i < companyLines.length; i++) {
    var c = companyLines[i];
    while (i + 1 < companyLines.length &&
        (order[companyLines[i + 1]] ?? -9) == (order[companyLines[i]] ?? -1) + 1 &&
        RegExp(r'^(of|and|&|for)\b', caseSensitive: false).hasMatch(companyLines[i + 1])) {
      c = '$c ${companyLines[i + 1]}';
      i++;
    }
    companies.add(c);
  }
  // A6: two consecutive one-word name candidates join ("Pablo" / "Saratxaga").
  final names = <String>[];
  for (var i = 0; i < nameCandidates.length; i++) {
    final n = nameCandidates[i];
    if (!n.contains(' ') &&
        i + 1 < nameCandidates.length &&
        !nameCandidates[i + 1].contains(' ') &&
        (order[nameCandidates[i + 1]] ?? -9) == (order[n] ?? -1) + 1) {
      names.add('$n ${nameCandidates[i + 1]}');
      i++;
    } else {
      names.add(n);
    }
  }

  // 7. Domain anchors.
  final emailLocal = card.email.contains('@') ? card.email.substring(0, card.email.indexOf('@')).toLowerCase() : '';
  final domainLabels = <String>{
    if (card.email.isNotEmpty) _domainLabel(card.email),
    if (card.website.isNotEmpty) _domainLabel(card.website),
  }..removeWhere((l) => l.isEmpty || _freeMailHosts.contains(l));
  // R3: a token matches a domain label only at its start, whole, or when long; never on address-like lines.
  bool tokenInLabel(String t, String d) => d == t || d.startsWith(t) || (t.length >= 6 && d.contains(t));
  double coverage(String s) {
    if (_digitsRx.hasMatch(s) || _hasWord(s.toLowerCase(), _addressWords) || _mostlyPlaceWords(s.toLowerCase())) return 0;
    var best = 0.0;
    for (final d0 in domainLabels) {
      final d = d0.replaceAll(RegExp(r'[-_]'), '');
      final matched = _tokens(s, 4).where((t) => tokenInLabel(t, d)).fold<int>(0, (a, t) => a + t.length);
      if (matched > 0) best = best > matched / d.length ? best : matched / d.length;
    }
    return best;
  }
  bool inDomain(String s) => coverage(s) > 0;
  final localLetters = emailLocal.replaceAll(RegExp(r'[^a-z]'), '');
  bool inLocal(String s) => localLetters.length >= 3 && _tokens(s).any((t) => localLetters.contains(t));

  // 8. Name (A): score the candidates.
  final firstTitleIdx = titles.isEmpty ? -1 : (order[titles.first.split(' ').take(3).join(' ')] ?? order[titles.first] ?? -1);
  String bestName = '';
  var bestScore = -999;
  for (final n0 in names) {
    final n = _stripHonorific(n0);
    var score = 0;
    if (inLocal(n)) score += 10; // A2
    if (inDomain(n) && !inLocal(n)) score -= 10; // company, not a person
    final i = order[n0] ?? -1;
    if (firstTitleIdx > 0 && i == firstTitleIdx - 1) score += 5; // A3
    final single = n.split(' ').length == 1;
    if (single) score -= 3;
    // T2: "Igrand" is a fragment of the company "TMG Pro Grand Co., Ltd"
    if (single && companies.any((c) => _tokens(c, 5).any((t) => n.toLowerCase().contains(t) || t.contains(n.toLowerCase())))) continue;
    if (n == n.toUpperCase()) score -= 2;
    if (endedWithComma.contains(n0)) score -= 4; // N4: "Mirihana Nugegoda," is an address
    // N1: with an email on the card, shouting or oddly capitalised candidates must be anchored
    // (a single word of 5+ letters is exempt: REVANTH)
    final oddCaps = n.split(' ').any((w) => w.length >= 2 && w == w.toUpperCase() && !_nameParticles.contains(w.toLowerCase()) && !w.contains('.'));
    if (emailLocal.isNotEmpty && oddCaps && !inLocal(n) && !(single && n.length >= 5)) score -= 8;
    score -= (order[n0] ?? 0) ~/ 10; // earlier lines slightly preferred
    if (score > bestScore) {
      bestScore = score;
      bestName = n;
    }
  }
  if (bestScore <= -6) bestName = ''; // Q3: too junk-like to trust
  // S3: a single-word name on a junk-heavy card (many short leftover lines) is probably junk too
  if (bestName.isNotEmpty && !bestName.contains(' ') && !inLocal(bestName) && leftovers.where((l) => l.length <= 8).length >= 5) {
    bestName = '';
  }
  // N5: a merged column line ("ae Sawsan Ataya Team Young & Rubicam" with s.ataya@...)
  if (bestScore <= 0 && localLetters.length >= 3) {
    for (final r in rests) {
      final words = _tidy(r).split(' ');
      for (var i = 0; i < words.length; i++) {
        if (words[i].contains('@')) continue; // Q4: never a Twitter handle
        final w = words[i].replaceAll(RegExp(r'[^A-Za-z]'), '');
        if (w.length >= 3 && localLetters.contains(w.toLowerCase()) && RegExp(r'^[A-Z]').hasMatch(w)) {
          final prev = i > 0 ? words[i - 1].replaceAll(RegExp(r'[^A-Za-z]'), '') : '';
          final cand = RegExp(r'^[A-Z][a-z]+$').hasMatch(prev) ? '$prev $w' : w;
          if (_looksLikeName(cand) && (bestName.isEmpty || bestScore <= 0)) {
            bestName = cand;
            bestScore = 1;
          }
          break;
        }
      }
      if (bestScore > 0) break;
    }
  }
  if (bestName.isEmpty && names.isEmpty) {
    // A8 (N6): "JON 248-343-5976" leaves a short capitalised word next to a number.
    for (var i = 0; i < rests.length; i++) {
      final t = _tidy(rests[i]);
      if (RegExp(r'^[A-Z][A-Za-z]{2,}$').hasMatch(t) && lineHadPhone[i] && !_hasWord(t.toLowerCase(), _labelWords)) {
        bestName = t[0] + t.substring(1).toLowerCase();
        break;
      }
    }
  }
  card.name = _titleCaseIfShouting(bestName);

  // 9. Company (D): a line anchored to the domain wins; else company lines; else the domain itself.
  String bestCompany = '';
  final anchored = [
    ...companies.where(inDomain),
    ...names.where((n) => inDomain(n) && _titleCaseIfShouting(_stripHonorific(n)) != card.name),
    ...leftovers.where((l) => inDomain(l) && l.length <= 60),
  ]..sort((a, b) => coverage(b).compareTo(coverage(a))); // highest coverage of the label wins
  // D7: with a free-mail address, the local part can still name the company (taiwanhot2021 -> TAIWAN-HOT)
  if (anchored.isEmpty && domainLabels.isEmpty && localLetters.length >= 5) {
    for (final l in [...companies, ...leftovers, ...names]) {
      if (_tokens(l, 5).any((t) => localLetters.startsWith(t)) && !_digitsRx.hasMatch(l)) {
        anchored.add(l);
        break;
      }
    }
  }
  if (anchored.isNotEmpty) {
    bestCompany = anchored.first;
  } else if (companies.isNotEmpty) {
    final good = companies.where((c) => c != c.toUpperCase() || c.split(' ').length >= 2).toList();
    if (good.isNotEmpty) {
      good.sort((a, b) => (b == b.toUpperCase() ? 1 : 0) - (a == a.toUpperCase() ? 1 : 0));
      bestCompany = good.first;
    }
  }
  if (bestCompany.isEmpty) {
    // a second name-like line in capitals is usually the company
    final shout = names.where((n) => n == n.toUpperCase() && _titleCaseIfShouting(n) != card.name && n.split(' ').length >= 2).toList();
    if (shout.isNotEmpty) bestCompany = shout.first;
  }
  if (bestCompany.isEmpty) {
    final src = card.website.isNotEmpty ? card.website : card.email;
    bestCompany = _companyFromDomain(src, personName: card.name);
    if (bestCompany.isEmpty && card.email.isNotEmpty && card.website.isNotEmpty) {
      bestCompany = _companyFromDomain(card.email, personName: card.name);
    }
  }
  card.company = _titleCaseIfShouting(bestCompany);
  if (card.name.isNotEmpty && card.name.toLowerCase() == card.company.toLowerCase()) card.name = ''; // Q4
  if (titles.isNotEmpty) card.jobTitle = _titleCaseIfShouting(titles.first);

  // 10. Address, city, country.
  if (addressLines.isNotEmpty) card.address = addressLines.join(', ');
  if (country != null) {
    card.country = country.name;
    card.city = _cityIn(addressLines.join(' ').toLowerCase(), country);
    if (card.city.isEmpty) card.city = _cityIn(allLower, country);
  }

  // 11. Notes: everything that was read but not used.
  final used = {card.name, card.company, card.jobTitle};
  final notes = <String>[
    ...leftovers.where((l) => !used.contains(_titleCaseIfShouting(l))),
    ...names.map(_stripHonorific).where((n) => !used.contains(_titleCaseIfShouting(n))),
    ...companies.where((c) => !used.contains(_titleCaseIfShouting(c))),
    ...titles.skip(1),
    ...emails.skip(1),
    ...sites.skip(1),
    ...extraPhones,
  ];
  card.notes = notes.join('\n').trim();
  if (card.notes.length > 600) card.notes = card.notes.substring(0, 600);
  return card;
}

/// G2: "+9710506556869" -> "+971506556869" (a national trunk 0 after the code).
String _dropTrunkZero(String n) {
  if (!n.startsWith('+')) return n;
  final digits = n.substring(1);
  for (final dial in _dialCodes) {
    if (digits.startsWith(dial)) {
      if (dial == '39') return n; // Italy keeps the 0
      final rest = digits.substring(dial.length);
      if (rest.startsWith('0') && rest.length >= 8) return '+$dial${rest.substring(1)}';
      return n;
    }
  }
  return n;
}

int _firstWordIndex(String lower, List<String> words) {
  var best = -1;
  for (final w in words) {
    final i = lower.indexOf(w);
    if (i < 0) continue;
    final before = i == 0 ? ' ' : lower[i - 1];
    final afterIdx = i + w.length;
    final after = afterIdx >= lower.length ? ' ' : lower[afterIdx];
    if (RegExp(r'[a-z0-9]').hasMatch(before) || RegExp(r'[a-z0-9]').hasMatch(after)) continue;
    if (best < 0 || i < best) best = i;
  }
  return best;
}

int _lastWordIndex(String lower, List<String> words) {
  var best = -1;
  for (final w in words) {
    final i = lower.lastIndexOf(w);
    if (i < 0) continue;
    final before = i == 0 ? ' ' : lower[i - 1];
    if (RegExp(r'[a-z0-9]').hasMatch(before)) continue;
    if (i > best) best = i;
  }
  return best;
}
