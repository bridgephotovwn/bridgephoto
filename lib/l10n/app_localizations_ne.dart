// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'स्क्यान';

  @override
  String get cancel => 'रद्द गर्नुहोस्';

  @override
  String get ok => 'ठिक छ';

  @override
  String get close => 'बन्द गर्नुहोस्';

  @override
  String get delete => 'मेटाउनुहोस्';

  @override
  String get share => 'सेयर गर्नुहोस्';

  @override
  String get copy => 'कपी गर्नुहोस्';

  @override
  String get copied => 'कपी भयो।';

  @override
  String get saved => 'सेभ भयो।';

  @override
  String get name => 'नाम';

  @override
  String get rename => 'नाम बदल्नुहोस्';

  @override
  String get settings => 'सेटिङ';

  @override
  String get dismiss => 'खारेज गर्नुहोस्';

  @override
  String get tryAgain => 'फेरि प्रयास गर्नुहोस्';

  @override
  String get cannotBeUndone => 'यसलाई पूर्ववत् गर्न सकिँदैन।';

  @override
  String get savingPages => 'पृष्ठहरू सेभ हुँदैछन्…';

  @override
  String get preparingScanner =>
      'स्क्यानर तयार हुँदैछ…\nपहिलो पटक: Google Play सेवाहरूले यसलाई एक पटक डाउनलोड गर्छन्।';

  @override
  String get scannerUnavailable => 'स्क्यानर उपलब्ध छैन।';

  @override
  String scannerUnavailableWith(String error) {
    return 'स्क्यानर उपलब्ध छैन: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'पृष्ठहरू सेभ गर्न सकिएन: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'फाइल छनोटकर्ता खोल्न सकिएन: $error';
  }

  @override
  String get importingPdf => 'PDF आयात हुँदैछ…';

  @override
  String get importedPdf => 'आयात गरिएको PDF';

  @override
  String couldNotImport(String error) {
    return 'आयात गर्न सकिएन: $error';
  }

  @override
  String get pickTwoPdfs => 'कम्तीमा दुई PDF फाइल छान्नुहोस्।';

  @override
  String mergingPdfs(int count) {
    return '$count PDF फाइलहरू मर्ज हुँदैछन्…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'मर्ज $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'मर्ज गर्न सकिएन: $error';
  }

  @override
  String get saveToFolder => 'फोल्डरमा सेभ गर्नुहोस्';

  @override
  String couldNotSave(String error) {
    return 'सेभ गर्न सकिएन: $error';
  }

  @override
  String get mergedDocument => 'मर्ज गरिएको कागजात';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count थप';
  }

  @override
  String get merging => 'मर्ज हुँदैछ…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कागजात मेटाउने?',
      one: '1 कागजात मेटाउने?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF बन्दैछ…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF बन्दैछ $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF बन्दैछ, पृष्ठ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF बनाउन सकिएन: $error';
  }

  @override
  String get searchDocuments => 'कागजात खोज्नुहोस्';

  @override
  String get closeSearch => 'खोज बन्द गर्नुहोस्';

  @override
  String get search => 'खोज्नुहोस्';

  @override
  String get importPdfAsPages => 'PDF लाई पृष्ठका रूपमा आयात गर्नुहोस्';

  @override
  String get mergePdfFiles => 'PDF फाइलहरू मर्ज गर्नुहोस्';

  @override
  String get clearSelection => 'छनोट हटाउनुहोस्';

  @override
  String nSelected(int count) {
    return '$count छानिएको';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count छानिएको · यही क्रममा मर्ज हुन्छ';
  }

  @override
  String get mergeIntoOne => 'एउटै कागजातमा मर्ज गर्नुहोस्';

  @override
  String get shareAsPdf => 'PDF का रूपमा सेयर गर्नुहोस्';

  @override
  String get selectAll => 'सबै छान्नुहोस्';

  @override
  String get noScansYet => 'अहिलेसम्म कुनै स्क्यान छैन';

  @override
  String get nothingMatches => 'केही भेटिएन';

  @override
  String get emptyHint =>
      'कागजातको फोटो खिच्न स्क्यान थिच्नुहोस्। सबै कुरा यही फोनमा रहन्छ।';

  @override
  String get tryAnotherWord => 'अर्को शब्द प्रयास गर्नुहोस्।';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पृष्ठ',
      one: '1 पृष्ठ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'स्क्यान $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO अचानक बन्द भयो';

  @override
  String get crashBody =>
      'के गडबड भयो भन्ने रिपोर्ट यही फोनमा मात्र सेभ गरिएको छ। यसलाई डेभलपरसँग सेयर गर्दा समस्या समाधान गर्न मद्दत पुग्छ। यसमा प्राविधिक विवरण मात्र छ, तपाईंका कागजात छैनन्।';

  @override
  String get reportCopied => 'रिपोर्ट कपी भयो।';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO क्र्यास रिपोर्ट';

  @override
  String get pdfSaved => 'PDF सेभ भयो।';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF सेभ गर्न सकिएन: $error';
  }

  @override
  String get exportPagesAsImages => 'पृष्ठहरू तस्बिरका रूपमा निर्यात गर्नुहोस्';

  @override
  String get saveToPhotos => 'फोटोमा सेभ गर्नुहोस्';

  @override
  String get savingToPhotos => 'फोटोमा सेभ हुँदैछ…';

  @override
  String get photosNeedsAndroid10 =>
      'फोटोमा सेभ गर्न Android 10 वा नयाँ चाहिन्छ। यसको सट्टा सेयर प्रयोग गर्नुहोस्।';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO लाई फोटोमा थप्ने अनुमति छैन। सेटिङमा अनुमति दिनुहोस्, वा सेयर प्रयोग गर्नुहोस्।';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count तस्बिर फोटोमा सेभ भए।',
      one: '1 तस्बिर फोटोमा सेभ भयो।',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'निर्यात गर्न सकिएन: $error';
  }

  @override
  String get deleteDocumentQuestion => 'यो कागजात मेटाउने?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पृष्ठ मेटिनेछन्। यसलाई पूर्ववत् गर्न सकिँदैन।',
      one: '1 पृष्ठ मेटिनेछ। यसलाई पूर्ववत् गर्न सकिँदैन।',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'टेक्स्ट (OCR)';

  @override
  String get sharePdf => 'PDF सेयर गर्नुहोस्';

  @override
  String get savePdfToFolder => 'PDF फोल्डरमा सेभ गर्नुहोस्';

  @override
  String get exportAsImages => 'JPEG / PNG का रूपमा निर्यात गर्नुहोस्';

  @override
  String get deleteDocument => 'कागजात मेटाउनुहोस्';

  @override
  String get noPages => 'कुनै पृष्ठ छैन। पृष्ठ थप्नुहोस् थिच्नुहोस्।';

  @override
  String get addPages => 'पृष्ठ थप्नुहोस्';

  @override
  String get holdToReorder => 'क्रम बदल्न पृष्ठ थिचिराख्नुहोस्';

  @override
  String get savePdfDialogTitle => 'PDF सेभ गर्नुहोस्';

  @override
  String get saveDialogTitle => 'सेभ गर्नुहोस्';

  @override
  String couldNotRotate(String error) {
    return 'घुमाउन सकिएन: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'सेयर गर्न सकिएन: $error';
  }

  @override
  String get noTextOnPage => 'यो पृष्ठमा कुनै टेक्स्ट भेटिएन।';

  @override
  String pageNText(int n) {
    return 'पृष्ठ $n को टेक्स्ट';
  }

  @override
  String deletePageQuestion(int n) {
    return 'पृष्ठ $n मेटाउने?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total मध्ये पृष्ठ $n';
  }

  @override
  String get rotateLeft => 'बायाँ घुमाउनुहोस्';

  @override
  String get rotateRight => 'दायाँ घुमाउनुहोस्';

  @override
  String get sign => 'हस्ताक्षर';

  @override
  String get copyText => 'टेक्स्ट कपी गर्नुहोस्';

  @override
  String get shareImage => 'तस्बिर सेयर गर्नुहोस्';

  @override
  String get deletePage => 'पृष्ठ मेटाउनुहोस्';

  @override
  String get signed => 'हस्ताक्षर भयो।';

  @override
  String signPageN(int n) {
    return 'पृष्ठ $n मा हस्ताक्षर गर्नुहोस्';
  }

  @override
  String get deleteThisSignature => 'यो हस्ताक्षर मेटाउनुहोस्';

  @override
  String get newSignature => 'नयाँ हस्ताक्षर';

  @override
  String readingPage(int n, int total) {
    return 'पृष्ठ $n / $total पढ्दैछ';
  }

  @override
  String get ocrFailed => 'टेक्स्ट पहिचान असफल भयो।';

  @override
  String ocrFailedWith(String error) {
    return 'टेक्स्ट पहिचान असफल भयो: $error';
  }

  @override
  String get textSaved => 'टेक्स्ट सेभ भयो।';

  @override
  String get text => 'टेक्स्ट';

  @override
  String get copyAll => 'सबै कपी गर्नुहोस्';

  @override
  String get shareText => 'टेक्स्ट सेयर गर्नुहोस्';

  @override
  String get saveAsTxt => '.txt का रूपमा सेभ गर्नुहोस्';

  @override
  String get readAgain => 'फेरि पढ्नुहोस्';

  @override
  String get readAsLatin => 'अंग्रेजी / ल्याटिनका रूपमा पढ्नुहोस्';

  @override
  String get readAsDevanagari => 'हिन्दी / नेपालीका रूपमा पढ्नुहोस्';

  @override
  String get ocrModelHint =>
      'Android मा टेक्स्ट मोडेल Google Play सेवाहरूले एक पटक डाउनलोड गर्छन्। यो पहिलो प्रयोग हो भने, एक मिनेट पर्खेर फेरि प्रयास गर्नुहोस्।';

  @override
  String get noTextFound => 'कुनै टेक्स्ट भेटिएन।';

  @override
  String pageSeparator(int n) {
    return '--- पृष्ठ $n ---';
  }

  @override
  String get scanner => 'स्क्यानर';

  @override
  String get scanMode => 'स्क्यान मोड';

  @override
  String get modeFull => 'पूरा: फिल्टर + दाग र औँला सफा गर्ने';

  @override
  String get modeFilter => 'फिल्टर मात्र';

  @override
  String get modeBase => 'आधारभूत: क्रप र घुमाउने मात्र';

  @override
  String get allowGallery => 'ग्यालरीबाट आयात गर्न दिनुहोस्';

  @override
  String get allowGalleryHint => 'स्क्यानरभित्र ग्यालरी बटन देखाउँछ';

  @override
  String get pagesPerScan => 'प्रति स्क्यान पृष्ठ';

  @override
  String get iosScannerNote =>
      'iPhone मा स्क्यानर Apple को आफ्नै कागजात क्यामेरा हो।';

  @override
  String get iosScannerNote2 =>
      'स्वचालित क्याप्चर, किनारा पहिचान र रङ मोडहरू यसमै छन्।';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'पृष्ठको आकार';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'स्क्यान जस्तै आकार';

  @override
  String get searchablePdf => 'खोज्न मिल्ने PDF';

  @override
  String get searchablePdfHint =>
      'अदृश्य टेक्स्ट तह थप्छ, जसले PDF मा खोज्न र टेक्स्ट कपी गर्न मिल्छ';

  @override
  String get textRecognition => 'टेक्स्ट पहिचान';

  @override
  String get quality => 'गुणस्तर';

  @override
  String get qualityBest => 'उत्कृष्ट: पूरा रिजोलुसन, साना अक्षर पनि पढ्छ';

  @override
  String get qualityFast => 'छिटो: पृष्ठको सानो प्रति';

  @override
  String get language => 'भाषा';

  @override
  String get scriptLatin => 'अंग्रेजी र ल्याटिन लिपिका अन्य भाषाहरू';

  @override
  String get scriptDevanagari => 'हिन्दी, नेपाली, मराठी (+ ल्याटिन)';

  @override
  String get scriptChinese => 'चिनियाँ (+ ल्याटिन)';

  @override
  String get scriptJapanese => 'जापानी (+ ल्याटिन)';

  @override
  String get scriptKorean => 'कोरियाली (+ ल्याटिन)';

  @override
  String get readAsChinese => 'चिनियाँका रूपमा पढ्नुहोस्';

  @override
  String get readAsJapanese => 'जापानीका रूपमा पढ्नुहोस्';

  @override
  String get readAsKorean => 'कोरियालीका रूपमा पढ्नुहोस्';

  @override
  String get languageAuto => 'भाषा स्वतः पहिचान हुन्छ।';

  @override
  String get appearance => 'रूप';

  @override
  String get theme => 'थिम';

  @override
  String get themeSystem => 'फोन अनुसार';

  @override
  String get themeLight => 'उज्यालो';

  @override
  String get themeDark => 'अँध्यारो';

  @override
  String get about => 'बारेमा';

  @override
  String get aboutPromise => 'विज्ञापन छैन। खाता छैन। ट्र्याकिङ छैन।';

  @override
  String get aboutPromiseBody =>
      'स्क्यानहरू सेयर वा निर्यात नगरेसम्म यही फोनमा रहन्छन्। एप अनइन्स्टल गर्दा तिनीहरू मेटिन्छन्, त्यसैले राख्न चाहेको निर्यात गर्नुहोस्।';

  @override
  String get openSource => 'ओपन सोर्स (Apache-2.0)';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get opensInBrowser => 'तपाईंको ब्राउजरमा खुल्छ';

  @override
  String get aboutTechAndroid =>
      'स्क्यानिङ र टेक्स्ट पहिचान Google ML Kit बाट (डिभाइसमै)। PDF मर्ज PDFBox-Android बाट। देवनागरी फन्ट: Noto (OFL)।';

  @override
  String get aboutTechIos =>
      'स्क्यानिङ Apple VisionKit बाट, टेक्स्ट पहिचान Apple Vision बाट (डिभाइसमै)। देवनागरी फन्ट: Noto (OFL)।';

  @override
  String couldNotOpenUrl(String url) {
    return '$url खोल्न सकिएन';
  }

  @override
  String get scanBusinessCard => 'बिजनेस कार्ड स्क्यान गर्नुहोस्';

  @override
  String get saveAsContact => 'सम्पर्कको रूपमा सेभ गर्नुहोस्';

  @override
  String get saveToContacts => 'सम्पर्कमा सेभ गर्नुहोस्';

  @override
  String get photoToContact => 'Put the card photo on the contact';

  @override
  String get contactReviewTitle => 'बिजनेस कार्ड';

  @override
  String get contactHint =>
      'फिल्डहरू जाँच्नुहोस्, त्यसपछि सेभ गर्नुहोस्। तपाईंको फोनको सम्पर्क एप सबै कुरा भरिएको अवस्थामा खुल्छ।';

  @override
  String get readingCard => 'कार्ड पढ्दैछ…';

  @override
  String get nothingRecognised =>
      'यो कार्डमा कुनै टेक्स्ट पहिचान भएन। तपाईं अझै पनि विवरण टाइप गर्न सक्नुहुन्छ।';

  @override
  String get contactOpened =>
      'सम्पर्क खुल्यो। राख्न त्यहाँ सेभ गर्नुहोस् थिच्नुहोस्।';

  @override
  String couldNotOpenContacts(String error) {
    return 'सम्पर्क खोल्न सकिएन: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'कार्ड $stamp';
  }

  @override
  String get fieldCompany => 'कम्पनी';

  @override
  String get fieldJobTitle => 'पद';

  @override
  String get fieldMobile => 'मोबाइल';

  @override
  String get fieldPhone => 'फोन';

  @override
  String get fieldFax => 'फ्याक्स';

  @override
  String get fieldEmail => 'इमेल';

  @override
  String get fieldWebsite => 'वेबसाइट';

  @override
  String get fieldAddress => 'ठेगाना';

  @override
  String get fieldCity => 'सहर';

  @override
  String get fieldCountry => 'देश';

  @override
  String get fieldNotes => 'नोटहरू';

  @override
  String get drawFirst => 'पहिले आफ्नो हस्ताक्षर कोर्नुहोस्।';

  @override
  String get clear => 'सफा गर्नुहोस्';

  @override
  String get undo => 'पूर्ववत्';

  @override
  String get save => 'सेभ गर्नुहोस्';

  @override
  String get signHint =>
      'बाकसभित्र औँलाले हस्ताक्षर गर्नुहोस्। थप ठाउँका लागि फोन तेर्सो पार्नुहोस्।';

  @override
  String get thin => 'पातलो';

  @override
  String get medium => 'मध्यम';

  @override
  String get thick => 'बाक्लो';

  @override
  String couldNotReadPage(String error) {
    return 'पृष्ठ पढ्न सकिएन: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'हस्ताक्षर गर्न सकिएन: $error';
  }

  @override
  String get placeSignature => 'हस्ताक्षर राख्नुहोस्';

  @override
  String get apply => 'लागू गर्नुहोस्';

  @override
  String get dragPinchHint => 'सार्न तान्नुहोस्। आकार बदल्न पिन्च गर्नुहोस्।';

  @override
  String get smaller => 'सानो';

  @override
  String get larger => 'ठूलो';
}
