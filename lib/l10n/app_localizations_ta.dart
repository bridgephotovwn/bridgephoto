// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'ஸ்கேன்';

  @override
  String get cancel => 'ரத்து';

  @override
  String get ok => 'சரி';

  @override
  String get close => 'மூடு';

  @override
  String get delete => 'நீக்கு';

  @override
  String get share => 'பகிர்';

  @override
  String get copy => 'நகலெடு';

  @override
  String get copied => 'நகலெடுக்கப்பட்டது.';

  @override
  String get saved => 'சேமிக்கப்பட்டது.';

  @override
  String get name => 'பெயர்';

  @override
  String get rename => 'பெயர் மாற்று';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get dismiss => 'புறக்கணி';

  @override
  String get tryAgain => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get cannotBeUndone => 'இதைச் செயல்தவிர்க்க முடியாது.';

  @override
  String get savingPages => 'பக்கங்கள் சேமிக்கப்படுகின்றன…';

  @override
  String get preparingScanner =>
      'ஸ்கேனர் தயாராகிறது…\nமுதல் பயன்பாடு: Google Play சேவைகள் இதை ஒருமுறை பதிவிறக்கும்.';

  @override
  String get scannerUnavailable => 'ஸ்கேனர் கிடைக்கவில்லை.';

  @override
  String scannerUnavailableWith(String error) {
    return 'ஸ்கேனர் கிடைக்கவில்லை: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'பக்கங்களைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'கோப்புத் தேர்வியைத் திறக்க முடியவில்லை: $error';
  }

  @override
  String get importingPdf => 'PDF இறக்குமதி செய்யப்படுகிறது…';

  @override
  String get importedPdf => 'இறக்குமதி செய்த PDF';

  @override
  String couldNotImport(String error) {
    return 'இறக்குமதி செய்ய முடியவில்லை: $error';
  }

  @override
  String get pickTwoPdfs =>
      'குறைந்தது இரண்டு PDF கோப்புகளைத் தேர்ந்தெடுக்கவும்.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF கோப்புகள் இணைக்கப்படுகின்றன…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'இணைப்பு $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'இணைக்க முடியவில்லை: $error';
  }

  @override
  String get saveToFolder => 'கோப்புறையில் சேமி';

  @override
  String couldNotSave(String error) {
    return 'சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get mergedDocument => 'இணைக்கப்பட்ட ஆவணம்';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + மேலும் $count';
  }

  @override
  String get merging => 'இணைக்கப்படுகிறது…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ஆவணங்களை நீக்கவா?',
      one: '1 ஆவணத்தை நீக்கவா?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF உருவாக்கப்படுகிறது…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF உருவாக்கப்படுகிறது $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF உருவாக்கப்படுகிறது, பக்கம் $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF ஐ உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get searchDocuments => 'ஆவணங்களைத் தேடு';

  @override
  String get closeSearch => 'தேடலை மூடு';

  @override
  String get search => 'தேடு';

  @override
  String get importPdfAsPages => 'PDF ஐப் பக்கங்களாக இறக்குமதி செய்';

  @override
  String get mergePdfFiles => 'PDF கோப்புகளை இணை';

  @override
  String get clearSelection => 'தேர்வை நீக்கு';

  @override
  String nSelected(int count) {
    return '$count தேர்ந்தெடுக்கப்பட்டது';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count தேர்ந்தெடுக்கப்பட்டது · இதே வரிசையில் இணைக்கப்படும்';
  }

  @override
  String get mergeIntoOne => 'ஒரே ஆவணமாக இணை';

  @override
  String get shareAsPdf => 'PDF ஆகப் பகிர்';

  @override
  String get selectAll => 'அனைத்தையும் தேர்ந்தெடு';

  @override
  String get noScansYet => 'இன்னும் ஸ்கேன்கள் இல்லை';

  @override
  String get nothingMatches => 'எதுவும் பொருந்தவில்லை';

  @override
  String get emptyHint =>
      'ஆவணத்தைப் படம் எடுக்க ஸ்கேன் ஐத் தட்டவும். அனைத்தும் இந்தத் தொலைபேசியிலேயே இருக்கும்.';

  @override
  String get tryAnotherWord => 'வேறு சொல்லை முயற்சிக்கவும்.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பக்கங்கள்',
      one: '1 பக்கம்',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'ஸ்கேன் $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO எதிர்பாராமல் மூடப்பட்டது';

  @override
  String get crashBody =>
      'என்ன தவறு நடந்தது என்ற அறிக்கை இந்தத் தொலைபேசியில் மட்டும் சேமிக்கப்பட்டுள்ளது. அதை உருவாக்குநருடன் பகிர்வது சிக்கலைச் சரிசெய்ய உதவும். அதில் தொழில்நுட்ப விவரங்கள் மட்டுமே உள்ளன, உங்கள் ஆவணங்கள் இல்லை.';

  @override
  String get reportCopied => 'அறிக்கை நகலெடுக்கப்பட்டது.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO செயலிழப்பு அறிக்கை';

  @override
  String get pdfSaved => 'PDF சேமிக்கப்பட்டது.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ஐச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get exportPagesAsImages => 'பக்கங்களைப் படங்களாக ஏற்றுமதி செய்';

  @override
  String get saveToPhotos => 'புகைப்படங்களில் சேமி';

  @override
  String get savingToPhotos => 'புகைப்படங்களில் சேமிக்கப்படுகிறது…';

  @override
  String get photosNeedsAndroid10 =>
      'புகைப்படங்களில் சேமிக்க Android 10 அல்லது புதியது தேவை. அதற்குப் பதிலாக பகிர் ஐப் பயன்படுத்தவும்.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO க்குப் புகைப்படங்களில் சேர்க்க அனுமதி இல்லை. அமைப்புகளில் அனுமதிக்கவும், அல்லது பகிர் ஐப் பயன்படுத்தவும்.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count படங்கள் புகைப்படங்களில் சேமிக்கப்பட்டன.',
      one: '1 படம் புகைப்படங்களில் சேமிக்கப்பட்டது.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'ஏற்றுமதி செய்ய முடியவில்லை: $error';
  }

  @override
  String get deleteDocumentQuestion => 'இந்த ஆவணத்தை நீக்கவா?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பக்கங்கள் நீக்கப்படும். இதைச் செயல்தவிர்க்க முடியாது.',
      one: '1 பக்கம் நீக்கப்படும். இதைச் செயல்தவிர்க்க முடியாது.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'உரை (OCR)';

  @override
  String get sharePdf => 'PDF ஐப் பகிர்';

  @override
  String get savePdfToFolder => 'PDF ஐக் கோப்புறையில் சேமி';

  @override
  String get exportAsImages => 'JPEG / PNG ஆக ஏற்றுமதி செய்';

  @override
  String get deleteDocument => 'ஆவணத்தை நீக்கு';

  @override
  String get noPages => 'பக்கங்கள் இல்லை. பக்கங்களைச் சேர் ஐத் தட்டவும்.';

  @override
  String get addPages => 'பக்கங்களைச் சேர்';

  @override
  String get holdToReorder =>
      'வரிசையை மாற்ற ஒரு பக்கத்தை அழுத்திப் பிடிக்கவும்';

  @override
  String get savePdfDialogTitle => 'PDF ஐச் சேமி';

  @override
  String get saveDialogTitle => 'சேமி';

  @override
  String couldNotRotate(String error) {
    return 'சுழற்ற முடியவில்லை: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'பகிர முடியவில்லை: $error';
  }

  @override
  String get noTextOnPage => 'இந்தப் பக்கத்தில் உரை எதுவும் இல்லை.';

  @override
  String pageNText(int n) {
    return 'பக்கம் $n உரை';
  }

  @override
  String deletePageQuestion(int n) {
    return 'பக்கம் $n ஐ நீக்கவா?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total இல் பக்கம் $n';
  }

  @override
  String get rotateLeft => 'இடதுபுறம் சுழற்று';

  @override
  String get rotateRight => 'வலதுபுறம் சுழற்று';

  @override
  String get sign => 'கையொப்பம்';

  @override
  String get copyText => 'உரையை நகலெடு';

  @override
  String get shareImage => 'படத்தைப் பகிர்';

  @override
  String get deletePage => 'பக்கத்தை நீக்கு';

  @override
  String get signed => 'கையொப்பமிடப்பட்டது.';

  @override
  String signPageN(int n) {
    return 'பக்கம் $n இல் கையொப்பமிடு';
  }

  @override
  String get deleteThisSignature => 'இந்தக் கையொப்பத்தை நீக்கு';

  @override
  String get newSignature => 'புதிய கையொப்பம்';

  @override
  String readingPage(int n, int total) {
    return 'பக்கம் $n / $total படிக்கப்படுகிறது';
  }

  @override
  String get ocrFailed => 'உரை அறிதல் தோல்வியடைந்தது.';

  @override
  String ocrFailedWith(String error) {
    return 'உரை அறிதல் தோல்வியடைந்தது: $error';
  }

  @override
  String get textSaved => 'உரை சேமிக்கப்பட்டது.';

  @override
  String get text => 'உரை';

  @override
  String get copyAll => 'அனைத்தையும் நகலெடு';

  @override
  String get shareText => 'உரையைப் பகிர்';

  @override
  String get saveAsTxt => '.txt ஆகச் சேமி';

  @override
  String get readAgain => 'மீண்டும் படி';

  @override
  String get readAsLatin => 'ஆங்கிலம் / லத்தீன் ஆகப் படி';

  @override
  String get readAsDevanagari => 'இந்தி / நேபாளி ஆகப் படி';

  @override
  String get ocrModelHint =>
      'Android இல் உரை மாதிரியை Google Play சேவைகள் ஒருமுறை பதிவிறக்கும். இது முதல் பயன்பாடு எனில், ஒரு நிமிடம் காத்திருந்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get noTextFound => 'உரை எதுவும் கிடைக்கவில்லை.';

  @override
  String pageSeparator(int n) {
    return '--- பக்கம் $n ---';
  }

  @override
  String get scanner => 'ஸ்கேனர்';

  @override
  String get scanMode => 'ஸ்கேன் முறை';

  @override
  String get modeFull => 'முழுமை: வடிகட்டிகள் + கறைகளும் விரல்களும் நீக்கம்';

  @override
  String get modeFilter => 'வடிகட்டிகள் மட்டும்';

  @override
  String get modeBase => 'அடிப்படை: வெட்டுதலும் சுழற்றுதலும் மட்டும்';

  @override
  String get allowGallery => 'கேலரியிலிருந்து இறக்குமதியை அனுமதி';

  @override
  String get allowGalleryHint => 'ஸ்கேனருக்குள் கேலரி பொத்தானைக் காட்டும்';

  @override
  String get pagesPerScan => 'ஒரு ஸ்கேனுக்கான பக்கங்கள்';

  @override
  String get iosScannerNote =>
      'iPhone இல் ஸ்கேனர் என்பது Apple இன் சொந்த ஆவணக் கேமரா.';

  @override
  String get iosScannerNote2 =>
      'தானியங்கிப் படப்பிடிப்பு, விளிம்பு அறிதல், வண்ண முறைகள் ஆகியவை உள்ளமைந்தவை.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'பக்க அளவு';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'ஸ்கேனின் அதே வடிவம்';

  @override
  String get searchablePdf => 'தேடக்கூடிய PDF';

  @override
  String get searchablePdfHint =>
      'PDF இல் தேடவும் உரையை நகலெடுக்கவும் கண்ணுக்குத் தெரியாத உரை அடுக்கைச் சேர்க்கும்';

  @override
  String get textRecognition => 'உரை அறிதல்';

  @override
  String get quality => 'தரம்';

  @override
  String get qualityBest =>
      'சிறந்தது: முழுத் தெளிவுத்திறன், சிறிய எழுத்துகளையும் படிக்கும்';

  @override
  String get qualityFast => 'விரைவு: பக்கத்தின் சிறிய நகல்';

  @override
  String get language => 'மொழி';

  @override
  String get scriptLatin => 'ஆங்கிலம் மற்றும் பிற லத்தீன் எழுத்து மொழிகள்';

  @override
  String get scriptDevanagari => 'இந்தி, நேபாளி, மராத்தி (+ லத்தீன்)';

  @override
  String get scriptChinese => 'சீனம் (+ லத்தீன்)';

  @override
  String get scriptJapanese => 'ஜப்பானியம் (+ லத்தீன்)';

  @override
  String get scriptKorean => 'கொரியம் (+ லத்தீன்)';

  @override
  String get readAsChinese => 'சீனமாகப் படி';

  @override
  String get readAsJapanese => 'ஜப்பானியமாகப் படி';

  @override
  String get readAsKorean => 'கொரியமாகப் படி';

  @override
  String get languageAuto => 'மொழி தானாகக் கண்டறியப்படும்.';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get theme => 'தீம்';

  @override
  String get themeSystem => 'தொலைபேசியைப் பின்பற்று';

  @override
  String get themeLight => 'வெளிர்';

  @override
  String get themeDark => 'இருள்';

  @override
  String get about => 'பற்றி';

  @override
  String get aboutPromise =>
      'விளம்பரம் இல்லை. கணக்கு இல்லை. கண்காணிப்பு இல்லை.';

  @override
  String get aboutPromiseBody =>
      'நீங்கள் பகிரும் அல்லது ஏற்றுமதி செய்யும் வரை ஸ்கேன்கள் இந்தத் தொலைபேசியிலேயே இருக்கும். செயலியை நிறுவல் நீக்கினால் அவை நீக்கப்படும், எனவே வைத்திருக்க விரும்புவதை ஏற்றுமதி செய்யவும்.';

  @override
  String get openSource => 'திறந்த மூலம் (Apache-2.0)';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get opensInBrowser => 'உங்கள் உலாவியில் திறக்கும்';

  @override
  String get aboutTechAndroid =>
      'ஸ்கேனிங் மற்றும் உரை அறிதல் Google ML Kit மூலம் (சாதனத்திலேயே). PDF இணைப்பு PDFBox-Android மூலம். தேவநாகரி எழுத்துரு: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'ஸ்கேனிங் Apple VisionKit மூலம், உரை அறிதல் Apple Vision மூலம் (சாதனத்திலேயே). தேவநாகரி எழுத்துரு: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url ஐத் திறக்க முடியவில்லை';
  }

  @override
  String get scanBusinessCard => 'வணிக அட்டையை ஸ்கேன் செய்';

  @override
  String get saveAsContact => 'தொடர்பாகச் சேமி';

  @override
  String get saveToContacts => 'தொடர்புகளில் சேமி';

  @override
  String get photoToContact => 'Put the card photo on the contact';

  @override
  String get contactReviewTitle => 'வணிக அட்டை';

  @override
  String get contactHint =>
      'புலங்களைச் சரிபார்த்து, பின்னர் சேமிக்கவும். உங்கள் தொலைபேசியின் தொடர்புகள் ஆப்ஸ் அனைத்தும் நிரப்பப்பட்ட நிலையில் திறக்கும்.';

  @override
  String get readingCard => 'அட்டை படிக்கப்படுகிறது…';

  @override
  String get nothingRecognised =>
      'இந்த அட்டையில் உரை எதுவும் அடையாளம் காணப்படவில்லை. நீங்கள் விவரங்களைத் தட்டச்சு செய்யலாம்.';

  @override
  String get contactOpened =>
      'தொடர்புகள் திறக்கப்பட்டது. வைத்திருக்க அங்கே சேமி ஐத் தட்டவும்.';

  @override
  String couldNotOpenContacts(String error) {
    return 'தொடர்புகளைத் திறக்க முடியவில்லை: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'அட்டை $stamp';
  }

  @override
  String get fieldCompany => 'நிறுவனம்';

  @override
  String get fieldJobTitle => 'பதவி';

  @override
  String get fieldMobile => 'மொபைல்';

  @override
  String get fieldPhone => 'தொலைபேசி';

  @override
  String get fieldFax => 'தொலைநகல்';

  @override
  String get fieldEmail => 'மின்னஞ்சல்';

  @override
  String get fieldWebsite => 'இணையதளம்';

  @override
  String get fieldAddress => 'முகவரி';

  @override
  String get fieldCity => 'நகரம்';

  @override
  String get fieldCountry => 'நாடு';

  @override
  String get fieldNotes => 'குறிப்புகள்';

  @override
  String get drawFirst => 'முதலில் உங்கள் கையொப்பத்தை வரையவும்.';

  @override
  String get clear => 'அழி';

  @override
  String get undo => 'செயல்தவிர்';

  @override
  String get save => 'சேமி';

  @override
  String get signHint =>
      'பெட்டிக்குள் விரலால் கையொப்பமிடவும். அதிக இடத்திற்குத் தொலைபேசியைப் பக்கவாட்டில் திருப்பவும்.';

  @override
  String get thin => 'மெல்லிய';

  @override
  String get medium => 'நடுத்தர';

  @override
  String get thick => 'தடித்த';

  @override
  String couldNotReadPage(String error) {
    return 'பக்கத்தைப் படிக்க முடியவில்லை: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'கையொப்பமிட முடியவில்லை: $error';
  }

  @override
  String get placeSignature => 'கையொப்பத்தை வை';

  @override
  String get apply => 'பயன்படுத்து';

  @override
  String get dragPinchHint =>
      'நகர்த்த இழுக்கவும். அளவை மாற்றப் பிஞ்ச் செய்யவும்.';

  @override
  String get smaller => 'சிறியது';

  @override
  String get larger => 'பெரியது';
}
