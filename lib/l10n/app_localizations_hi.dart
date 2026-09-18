// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'स्कैन';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get ok => 'ठीक है';

  @override
  String get close => 'बंद करें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get share => 'शेयर करें';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get copied => 'कॉपी हो गया।';

  @override
  String get saved => 'सेव हो गया।';

  @override
  String get name => 'नाम';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get settings => 'सेटिंग';

  @override
  String get dismiss => 'ख़ारिज करें';

  @override
  String get tryAgain => 'फिर से कोशिश करें';

  @override
  String get cannotBeUndone => 'इसे पूर्ववत नहीं किया जा सकता।';

  @override
  String get savingPages => 'पेज सेव हो रहे हैं…';

  @override
  String get preparingScanner =>
      'स्कैनर तैयार हो रहा है…\nपहली बार: Google Play सेवाएँ इसे एक बार डाउनलोड करती हैं।';

  @override
  String get scannerUnavailable => 'स्कैनर उपलब्ध नहीं है।';

  @override
  String scannerUnavailableWith(String error) {
    return 'स्कैनर उपलब्ध नहीं है: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'पेज सेव नहीं हो सके: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'फ़ाइल चुनने वाला नहीं खुल सका: $error';
  }

  @override
  String get importingPdf => 'PDF इंपोर्ट हो रही है…';

  @override
  String get importedPdf => 'इंपोर्ट की गई PDF';

  @override
  String couldNotImport(String error) {
    return 'इंपोर्ट नहीं हो सका: $error';
  }

  @override
  String get pickTwoPdfs => 'कम से कम दो PDF फ़ाइलें चुनें।';

  @override
  String mergingPdfs(int count) {
    return '$count PDF फ़ाइलें मर्ज हो रही हैं…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'मर्ज $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'मर्ज नहीं हो सका: $error';
  }

  @override
  String get saveToFolder => 'फ़ोल्डर में सेव करें';

  @override
  String couldNotSave(String error) {
    return 'सेव नहीं हो सका: $error';
  }

  @override
  String get mergedDocument => 'मर्ज किया गया दस्तावेज़';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count और';
  }

  @override
  String get merging => 'मर्ज हो रहा है…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दस्तावेज़ हटाएँ?',
      one: '1 दस्तावेज़ हटाएँ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF बन रही है…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF बन रही है $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF बन रही है, पेज $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF नहीं बन सकी: $error';
  }

  @override
  String get searchDocuments => 'दस्तावेज़ खोजें';

  @override
  String get closeSearch => 'खोज बंद करें';

  @override
  String get search => 'खोजें';

  @override
  String get importPdfAsPages => 'PDF को पेज के रूप में इंपोर्ट करें';

  @override
  String get mergePdfFiles => 'PDF फ़ाइलें मर्ज करें';

  @override
  String get clearSelection => 'चयन हटाएँ';

  @override
  String nSelected(int count) {
    return '$count चुने गए';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count चुने गए · इसी क्रम में मर्ज होंगे';
  }

  @override
  String get mergeIntoOne => 'एक दस्तावेज़ में मर्ज करें';

  @override
  String get shareAsPdf => 'PDF के रूप में शेयर करें';

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String get noScansYet => 'अभी कोई स्कैन नहीं';

  @override
  String get nothingMatches => 'कुछ नहीं मिला';

  @override
  String get emptyHint =>
      'दस्तावेज़ की फ़ोटो लेने के लिए स्कैन पर टैप करें। सब कुछ इसी फ़ोन पर रहता है।';

  @override
  String get tryAnotherWord => 'कोई और शब्द आज़माएँ।';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज',
      one: '1 पेज',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'स्कैन $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO अचानक बंद हो गया';

  @override
  String get crashBody =>
      'क्या गड़बड़ हुई, इसकी रिपोर्ट सिर्फ़ इसी फ़ोन पर सेव की गई है। इसे डेवलपर के साथ शेयर करने से समस्या ठीक करने में मदद मिलती है। इसमें तकनीकी विवरण हैं, आपके दस्तावेज़ नहीं।';

  @override
  String get reportCopied => 'रिपोर्ट कॉपी हो गई।';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO क्रैश रिपोर्ट';

  @override
  String get pdfSaved => 'PDF सेव हो गई।';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF सेव नहीं हो सकी: $error';
  }

  @override
  String get exportPagesAsImages => 'पेज को इमेज के रूप में एक्सपोर्ट करें';

  @override
  String get saveToPhotos => 'फ़ोटो में सेव करें';

  @override
  String get savingToPhotos => 'फ़ोटो में सेव हो रहा है…';

  @override
  String get photosNeedsAndroid10 =>
      'फ़ोटो में सेव करने के लिए Android 10 या नया चाहिए। इसके बजाय शेयर का उपयोग करें।';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO को फ़ोटो में जोड़ने की अनुमति नहीं है। सेटिंग में अनुमति दें, या शेयर का उपयोग करें।';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count इमेज फ़ोटो में सेव हुईं।',
      one: '1 इमेज फ़ोटो में सेव हुई।',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'एक्सपोर्ट नहीं हो सका: $error';
  }

  @override
  String get deleteDocumentQuestion => 'यह दस्तावेज़ हटाएँ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज हटा दिए जाएँगे। इसे पूर्ववत नहीं किया जा सकता।',
      one: '1 पेज हटा दिया जाएगा। इसे पूर्ववत नहीं किया जा सकता।',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'टेक्स्ट (OCR)';

  @override
  String get sharePdf => 'PDF शेयर करें';

  @override
  String get savePdfToFolder => 'PDF फ़ोल्डर में सेव करें';

  @override
  String get exportAsImages => 'JPEG / PNG के रूप में एक्सपोर्ट करें';

  @override
  String get deleteDocument => 'दस्तावेज़ हटाएँ';

  @override
  String get noPages => 'कोई पेज नहीं। पेज जोड़ें पर टैप करें।';

  @override
  String get addPages => 'पेज जोड़ें';

  @override
  String get holdToReorder => 'क्रम बदलने के लिए पेज को दबाए रखें';

  @override
  String get savePdfDialogTitle => 'PDF सेव करें';

  @override
  String get saveDialogTitle => 'सेव करें';

  @override
  String couldNotRotate(String error) {
    return 'घुमाया नहीं जा सका: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'शेयर नहीं हो सका: $error';
  }

  @override
  String get noTextOnPage => 'इस पेज पर कोई टेक्स्ट नहीं मिला।';

  @override
  String pageNText(int n) {
    return 'पेज $n का टेक्स्ट';
  }

  @override
  String deletePageQuestion(int n) {
    return 'पेज $n हटाएँ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total में से पेज $n';
  }

  @override
  String get rotateLeft => 'बाएँ घुमाएँ';

  @override
  String get rotateRight => 'दाएँ घुमाएँ';

  @override
  String get sign => 'हस्ताक्षर';

  @override
  String get copyText => 'टेक्स्ट कॉपी करें';

  @override
  String get shareImage => 'इमेज शेयर करें';

  @override
  String get deletePage => 'पेज हटाएँ';

  @override
  String get signed => 'हस्ताक्षर हो गया।';

  @override
  String signPageN(int n) {
    return 'पेज $n पर हस्ताक्षर करें';
  }

  @override
  String get deleteThisSignature => 'यह हस्ताक्षर हटाएँ';

  @override
  String get newSignature => 'नया हस्ताक्षर';

  @override
  String readingPage(int n, int total) {
    return 'पेज $n / $total पढ़ा जा रहा है';
  }

  @override
  String get ocrFailed => 'टेक्स्ट पहचान विफल रही।';

  @override
  String ocrFailedWith(String error) {
    return 'टेक्स्ट पहचान विफल रही: $error';
  }

  @override
  String get textSaved => 'टेक्स्ट सेव हो गया।';

  @override
  String get text => 'टेक्स्ट';

  @override
  String get copyAll => 'सब कॉपी करें';

  @override
  String get shareText => 'टेक्स्ट शेयर करें';

  @override
  String get saveAsTxt => '.txt के रूप में सेव करें';

  @override
  String get readAgain => 'फिर से पढ़ें';

  @override
  String get readAsLatin => 'अंग्रेज़ी / लैटिन के रूप में पढ़ें';

  @override
  String get readAsDevanagari => 'हिंदी / नेपाली के रूप में पढ़ें';

  @override
  String get ocrModelHint =>
      'Android पर टेक्स्ट मॉडल Google Play सेवाएँ एक बार डाउनलोड करती हैं। अगर यह पहला उपयोग है, तो एक मिनट रुकें और फिर से कोशिश करें।';

  @override
  String get noTextFound => 'कोई टेक्स्ट नहीं मिला।';

  @override
  String pageSeparator(int n) {
    return '--- पेज $n ---';
  }

  @override
  String get scanner => 'स्कैनर';

  @override
  String get scanMode => 'स्कैन मोड';

  @override
  String get modeFull => 'पूरा: फ़िल्टर + दाग़ और उँगलियाँ साफ़ करें';

  @override
  String get modeFilter => 'सिर्फ़ फ़िल्टर';

  @override
  String get modeBase => 'बेसिक: सिर्फ़ क्रॉप और घुमाना';

  @override
  String get allowGallery => 'गैलरी से इंपोर्ट की अनुमति दें';

  @override
  String get allowGalleryHint => 'स्कैनर के अंदर गैलरी बटन दिखाता है';

  @override
  String get pagesPerScan => 'प्रति स्कैन पेज';

  @override
  String get iosScannerNote =>
      'iPhone पर स्कैनर Apple का अपना दस्तावेज़ कैमरा है।';

  @override
  String get iosScannerNote2 =>
      'ऑटो कैप्चर, किनारे की पहचान और रंग मोड इसमें पहले से हैं।';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'पेज का आकार';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'स्कैन जैसा ही आकार';

  @override
  String get searchablePdf => 'खोजने योग्य PDF';

  @override
  String get searchablePdfHint =>
      'एक अदृश्य टेक्स्ट परत जोड़ता है ताकि PDF में खोज और टेक्स्ट कॉपी किया जा सके';

  @override
  String get textRecognition => 'टेक्स्ट पहचान';

  @override
  String get quality => 'क्वालिटी';

  @override
  String get qualityBest =>
      'सर्वोत्तम: पूरा रिज़ॉल्यूशन, छोटे अक्षर भी पढ़ता है';

  @override
  String get qualityFast => 'तेज़: पेज की छोटी कॉपी';

  @override
  String get language => 'भाषा';

  @override
  String get scriptLatin => 'अंग्रेज़ी और लैटिन लिपि की अन्य भाषाएँ';

  @override
  String get scriptDevanagari => 'हिंदी, नेपाली, मराठी (+ लैटिन)';

  @override
  String get scriptChinese => 'चीनी (+ लैटिन)';

  @override
  String get scriptJapanese => 'जापानी (+ लैटिन)';

  @override
  String get scriptKorean => 'कोरियाई (+ लैटिन)';

  @override
  String get readAsChinese => 'चीनी के रूप में पढ़ें';

  @override
  String get readAsJapanese => 'जापानी के रूप में पढ़ें';

  @override
  String get readAsKorean => 'कोरियाई के रूप में पढ़ें';

  @override
  String get languageAuto => 'भाषा अपने आप पहचानी जाती है।';

  @override
  String get appearance => 'दिखावट';

  @override
  String get theme => 'थीम';

  @override
  String get themeSystem => 'फ़ोन के अनुसार';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get about => 'जानकारी';

  @override
  String get aboutPromise => 'न विज्ञापन। न खाता। न ट्रैकिंग।';

  @override
  String get aboutPromiseBody =>
      'स्कैन इसी फ़ोन पर रहते हैं, जब तक आप उन्हें शेयर या एक्सपोर्ट न करें। ऐप अनइंस्टॉल करने पर वे हट जाते हैं, इसलिए जो रखना हो उसे एक्सपोर्ट कर लें।';

  @override
  String get openSource => 'ओपन सोर्स (Apache-2.0)';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get opensInBrowser => 'आपके ब्राउज़र में खुलता है';

  @override
  String get aboutTechAndroid =>
      'स्कैनिंग और टेक्स्ट पहचान Google ML Kit से (डिवाइस पर)। PDF मर्ज PDFBox-Android से। देवनागरी फ़ॉन्ट: Noto (OFL)।';

  @override
  String get aboutTechIos =>
      'स्कैनिंग Apple VisionKit से, टेक्स्ट पहचान Apple Vision से (डिवाइस पर)। देवनागरी फ़ॉन्ट: Noto (OFL)।';

  @override
  String couldNotOpenUrl(String url) {
    return '$url नहीं खुल सका';
  }

  @override
  String get scanBusinessCard => 'बिज़नेस कार्ड स्कैन करें';

  @override
  String get saveAsContact => 'संपर्क के रूप में सेव करें';

  @override
  String get saveToContacts => 'संपर्क में सेव करें';

  @override
  String get contactReviewTitle => 'बिज़नेस कार्ड';

  @override
  String get contactHint =>
      'फ़ील्ड जाँचें, फिर सेव करें। आपके फ़ोन का संपर्क ऐप सब कुछ भरा हुआ खुलेगा।';

  @override
  String get readingCard => 'कार्ड पढ़ा जा रहा है…';

  @override
  String get nothingRecognised =>
      'इस कार्ड पर कोई टेक्स्ट पहचाना नहीं गया। आप फिर भी विवरण टाइप कर सकते हैं।';

  @override
  String get contactOpened =>
      'संपर्क खुल गया। रखने के लिए वहाँ सेव करें पर टैप करें।';

  @override
  String couldNotOpenContacts(String error) {
    return 'संपर्क नहीं खुल सका: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'कार्ड $stamp';
  }

  @override
  String get fieldCompany => 'कंपनी';

  @override
  String get fieldJobTitle => 'पद';

  @override
  String get fieldMobile => 'मोबाइल';

  @override
  String get fieldPhone => 'फ़ोन';

  @override
  String get fieldFax => 'फ़ैक्स';

  @override
  String get fieldEmail => 'ईमेल';

  @override
  String get fieldWebsite => 'वेबसाइट';

  @override
  String get fieldAddress => 'पता';

  @override
  String get fieldCity => 'शहर';

  @override
  String get fieldCountry => 'देश';

  @override
  String get fieldNotes => 'नोट';

  @override
  String get drawFirst => 'पहले अपना हस्ताक्षर बनाएँ।';

  @override
  String get clear => 'साफ़ करें';

  @override
  String get undo => 'पूर्ववत करें';

  @override
  String get save => 'सेव करें';

  @override
  String get signHint =>
      'बॉक्स में उँगली से हस्ताक्षर करें। ज़्यादा जगह के लिए फ़ोन को आड़ा करें।';

  @override
  String get thin => 'पतला';

  @override
  String get medium => 'मध्यम';

  @override
  String get thick => 'मोटा';

  @override
  String couldNotReadPage(String error) {
    return 'पेज पढ़ा नहीं जा सका: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'हस्ताक्षर नहीं हो सका: $error';
  }

  @override
  String get placeSignature => 'हस्ताक्षर रखें';

  @override
  String get apply => 'लागू करें';

  @override
  String get dragPinchHint =>
      'हिलाने के लिए खींचें। आकार बदलने के लिए पिंच करें।';

  @override
  String get smaller => 'छोटा';

  @override
  String get larger => 'बड़ा';
}
