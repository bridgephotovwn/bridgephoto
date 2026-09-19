// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Changanua';

  @override
  String get cancel => 'Ghairi';

  @override
  String get ok => 'Sawa';

  @override
  String get close => 'Funga';

  @override
  String get delete => 'Futa';

  @override
  String get share => 'Shiriki';

  @override
  String get copy => 'Nakili';

  @override
  String get copied => 'Imenakiliwa.';

  @override
  String get saved => 'Imehifadhiwa.';

  @override
  String get name => 'Jina';

  @override
  String get rename => 'Badilisha jina';

  @override
  String get settings => 'Mipangilio';

  @override
  String get dismiss => 'Ondoa';

  @override
  String get tryAgain => 'Jaribu tena';

  @override
  String get cannotBeUndone => 'Hatua hii haiwezi kutenduliwa.';

  @override
  String get savingPages => 'Inahifadhi kurasa…';

  @override
  String get preparingScanner =>
      'Inaandaa kichanganuzi…\nMatumizi ya kwanza: huduma za Google Play zitakipakua mara moja.';

  @override
  String get scannerUnavailable => 'Kichanganuzi hakipatikani.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Kichanganuzi hakipatikani: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Imeshindwa kuhifadhi kurasa: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Imeshindwa kufungua kiteua faili: $error';
  }

  @override
  String get importingPdf => 'Inaleta PDF…';

  @override
  String get importedPdf => 'PDF iliyoletwa';

  @override
  String couldNotImport(String error) {
    return 'Imeshindwa kuleta: $error';
  }

  @override
  String get pickTwoPdfs => 'Chagua angalau faili mbili za PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Inaunganisha faili $count za PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Zilizounganishwa $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Imeshindwa kuunganisha: $error';
  }

  @override
  String get saveToFolder => 'Hifadhi kwenye folda';

  @override
  String couldNotSave(String error) {
    return 'Imeshindwa kuhifadhi: $error';
  }

  @override
  String get mergedDocument => 'Hati iliyounganishwa';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count zaidi';
  }

  @override
  String get merging => 'Inaunganisha…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ungependa kufuta hati $count?',
      one: 'Ungependa kufuta hati 1?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Inaunda PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Inaunda PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Inaunda PDF, ukurasa wa $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Imeshindwa kuunda PDF: $error';
  }

  @override
  String get searchDocuments => 'Tafuta hati';

  @override
  String get closeSearch => 'Funga utafutaji';

  @override
  String get search => 'Tafuta';

  @override
  String get importPdfAsPages => 'Leta PDF kama kurasa';

  @override
  String get mergePdfFiles => 'Unganisha faili za PDF';

  @override
  String get clearSelection => 'Ondoa uteuzi';

  @override
  String nSelected(int count) {
    return 'Umechagua $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Umechagua $count · zitaunganishwa kwa mpangilio huu';
  }

  @override
  String get mergeIntoOne => 'Unganisha kuwa hati moja';

  @override
  String get shareAsPdf => 'Shiriki kama PDF';

  @override
  String get selectAll => 'Chagua zote';

  @override
  String get noScansYet => 'Bado hakuna zilizochanganuliwa';

  @override
  String get nothingMatches => 'Hakuna kinacholingana';

  @override
  String get emptyHint =>
      'Gusa Changanua ili upige picha ya hati. Kila kitu hubaki kwenye simu hii.';

  @override
  String get tryAnotherWord => 'Jaribu neno lingine.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kurasa $count',
      one: 'Ukurasa 1',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Changanuo $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO imefungwa bila kutarajiwa';

  @override
  String get crashBody =>
      'Ripoti ya tatizo imehifadhiwa kwenye simu hii pekee. Kuishiriki na msanidi programu husaidia kutatua tatizo. Ina maelezo ya kiufundi, si hati zako.';

  @override
  String get reportCopied => 'Ripoti imenakiliwa.';

  @override
  String get crashReportSubject => 'Ripoti ya hitilafu ya BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF imehifadhiwa.';

  @override
  String couldNotSavePdf(String error) {
    return 'Imeshindwa kuhifadhi PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Hamisha kurasa kama picha';

  @override
  String get saveToPhotos => 'Hifadhi kwenye Picha';

  @override
  String get savingToPhotos => 'Inahifadhi kwenye Picha…';

  @override
  String get photosNeedsAndroid10 =>
      'Kuhifadhi kwenye Picha kunahitaji Android 10 au mpya zaidi. Badala yake, tumia Shiriki.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO hairuhusiwi kuongeza kwenye Picha. Iruhusu kwenye Mipangilio, au tumia Shiriki.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Picha $count zimehifadhiwa kwenye Picha.',
      one: 'Picha 1 imehifadhiwa kwenye Picha.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Imeshindwa kuhamisha: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Ungependa kufuta hati hii?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kurasa $count zitafutwa. Hatua hii haiwezi kutenduliwa.',
      one: 'Ukurasa 1 utafutwa. Hatua hii haiwezi kutenduliwa.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Maandishi (OCR)';

  @override
  String get sharePdf => 'Shiriki PDF';

  @override
  String get savePdfToFolder => 'Hifadhi PDF kwenye folda';

  @override
  String get lockPdfTitle => 'Save PDF with a password';

  @override
  String get lockPdfHint =>
      'The PDF will need this password to open. Keep it safe — it cannot be recovered from the file.';

  @override
  String get password => 'Password';

  @override
  String get pdfSavedLocked => 'Saved. The PDF now needs the password to open.';

  @override
  String get exportAsImages => 'Hamisha kama JPEG / PNG';

  @override
  String get oneSheetTitle => 'Pages on one sheet';

  @override
  String get oneSheetHint =>
      'An ID card, a licence, a passport and its visa — tap the front, then the back. They go on one printable sheet, and the pages you picked are kept.';

  @override
  String get makeTheSheet => 'Make the sheet';

  @override
  String get makingSheet => 'Making the sheet…';

  @override
  String get sheetAdded => 'Sheet added as the last page';

  @override
  String couldNotMakeSheet(String error) {
    return 'Could not make the sheet: $error';
  }

  @override
  String get deleteDocument => 'Futa hati';

  @override
  String get noPages => 'Hakuna kurasa. Gusa Ongeza kurasa.';

  @override
  String get addPages => 'Ongeza kurasa';

  @override
  String get holdToReorder => 'shikilia ukurasa ili kubadilisha mpangilio';

  @override
  String get savePdfDialogTitle => 'Hifadhi PDF';

  @override
  String get saveDialogTitle => 'Hifadhi';

  @override
  String couldNotRotate(String error) {
    return 'Imeshindwa kuzungusha: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Imeshindwa kushiriki: $error';
  }

  @override
  String get noTextOnPage =>
      'Hakuna maandishi yaliyopatikana kwenye ukurasa huu.';

  @override
  String pageNText(int n) {
    return 'Maandishi ya ukurasa wa $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Ungependa kufuta ukurasa wa $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Ukurasa wa $n kati ya $total';
  }

  @override
  String get rotateLeft => 'Zungusha kushoto';

  @override
  String get rotateRight => 'Zungusha kulia';

  @override
  String get splitBookTitle => 'Split this book page';

  @override
  String get splitBookHint =>
      'One photograph of an open book becomes two pages, cut at the fold. Which side should come first?';

  @override
  String get leftPageFirst => 'Left first';

  @override
  String get rightPageFirst => 'Right first';

  @override
  String get splitAtTheFold => 'Split at the fold';

  @override
  String get splitInTheMiddle => 'No fold found — split down the middle';

  @override
  String couldNotSplit(String error) {
    return 'Could not split the page: $error';
  }

  @override
  String get redactTitle => 'Cover for good';

  @override
  String get redactHint => 'Drag across anything that must not be readable.';

  @override
  String redactCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count areas covered',
      one: '1 area covered',
    );
    return '$_temp0';
  }

  @override
  String get redactApply => 'Cover for good';

  @override
  String get redactConfirmTitle => 'This cannot be undone';

  @override
  String get redactConfirmBody =>
      'The covered parts are removed from the picture itself, the recognised text is thrown away, and the original scan of this page is deleted. That is what makes it safe to share — and it means there is no way back.';

  @override
  String get redacted => 'Covered. What was underneath is gone.';

  @override
  String couldNotRedact(String error) {
    return 'Could not cover the page: $error';
  }

  @override
  String get undo => 'Tendua';

  @override
  String get clearAll => 'Clear all';

  @override
  String get enhanceTitle => 'Clean up the page';

  @override
  String get enhanceAuto => 'Auto — even out the light';

  @override
  String get enhanceGrey => 'Greyscale';

  @override
  String get enhanceBw => 'Black and white — text only';

  @override
  String get enhanceOriginal => 'Original scan';

  @override
  String straightenedBy(String degrees) {
    return 'Straightened by $degrees°';
  }

  @override
  String couldNotEnhance(String error) {
    return 'Could not clean up the page: $error';
  }

  @override
  String get sign => 'Tia sahihi';

  @override
  String get copyText => 'Nakili maandishi';

  @override
  String get shareImage => 'Shiriki picha';

  @override
  String get deletePage => 'Futa ukurasa';

  @override
  String get signed => 'Imetiwa sahihi.';

  @override
  String signPageN(int n) {
    return 'Tia sahihi ukurasa wa $n';
  }

  @override
  String get deleteThisSignature => 'Futa sahihi hii';

  @override
  String get newSignature => 'Sahihi mpya';

  @override
  String readingPage(int n, int total) {
    return 'Inasoma ukurasa wa $n / $total';
  }

  @override
  String get ocrFailed => 'Utambuzi wa maandishi umeshindwa.';

  @override
  String ocrFailedWith(String error) {
    return 'Utambuzi wa maandishi umeshindwa: $error';
  }

  @override
  String get textSaved => 'Maandishi yamehifadhiwa.';

  @override
  String get text => 'Maandishi';

  @override
  String get copyAll => 'Nakili yote';

  @override
  String get shareText => 'Shiriki maandishi';

  @override
  String get saveAsTxt => 'Hifadhi kama .txt';

  @override
  String get readAgain => 'Soma tena';

  @override
  String get readAsLatin => 'Soma kama Kiingereza / Kilatini';

  @override
  String get readAsDevanagari => 'Soma kama Kihindi / Kinepali';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Kwenye Android, muundo wa maandishi hupakuliwa mara moja na huduma za Google Play. Ikiwa haya ni matumizi ya kwanza, subiri dakika moja kisha ujaribu tena.';

  @override
  String get noTextFound => 'Hakuna maandishi yaliyopatikana.';

  @override
  String pageSeparator(int n) {
    return '--- Ukurasa wa $n ---';
  }

  @override
  String get scanner => 'Kichanganuzi';

  @override
  String get scanMode => 'Hali ya kuchanganua';

  @override
  String get modeFull => 'Kamili: vichujio + kusafisha madoa na vidole';

  @override
  String get modeFilter => 'Vichujio pekee';

  @override
  String get modeBase => 'Msingi: kupunguza na kuzungusha pekee';

  @override
  String get allowGallery => 'Ruhusu kuleta kutoka kwenye ghala';

  @override
  String get allowGalleryHint =>
      'Huonyesha kitufe cha ghala ndani ya kichanganuzi';

  @override
  String get pagesPerScan => 'Kurasa kwa kila changanuo';

  @override
  String get iosScannerNote =>
      'Kwenye iPhone, kichanganuzi ni kamera ya hati ya Apple yenyewe.';

  @override
  String get iosScannerNote2 =>
      'Upigaji picha wa kiotomatiki, utambuzi wa kingo na hali za rangi zimejumuishwa.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Ukubwa wa ukurasa';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Umbo sawa na changanuo';

  @override
  String get searchablePdf => 'PDF inayoweza kutafutwa';

  @override
  String get numberPages => 'Number the pages';

  @override
  String get numberPagesHint =>
      'Puts 1 / 3 at the foot of every exported page.';

  @override
  String get stampText => 'Stamp on every page';

  @override
  String get stampHint =>
      'Words printed faintly across each exported page — COPY, your company name, FOR BANK USE ONLY. Leave it empty for no stamp.';

  @override
  String get stampNone => 'None';

  @override
  String get searchablePdfHint =>
      'Huongeza safu ya maandishi isiyoonekana ili PDF iweze kutafutwa na maandishi kunakiliwa';

  @override
  String get textRecognition => 'Utambuzi wa maandishi';

  @override
  String get quality => 'Ubora';

  @override
  String get qualityBest =>
      'Bora zaidi: mwonekano kamili, husoma maandishi madogo';

  @override
  String get qualityFast => 'Haraka: nakala ndogo ya ukurasa';

  @override
  String get language => 'Lugha';

  @override
  String get scriptLatin => 'Kiingereza na lugha nyingine za hati ya Kilatini';

  @override
  String get scriptDevanagari => 'Kihindi, Kinepali, Kimarathi (+ Kilatini)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Kichina (+ Kilatini)';

  @override
  String get scriptJapanese => 'Kijapani (+ Kilatini)';

  @override
  String get scriptKorean => 'Kikorea (+ Kilatini)';

  @override
  String get readAsChinese => 'Soma kama Kichina';

  @override
  String get readAsJapanese => 'Soma kama Kijapani';

  @override
  String get readAsKorean => 'Soma kama Kikorea';

  @override
  String get languageAuto => 'Lugha hutambuliwa kiotomatiki.';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get theme => 'Mandhari';

  @override
  String get themeSystem => 'Fuata simu';

  @override
  String get themeLight => 'Meupe';

  @override
  String get themeDark => 'Meusi';

  @override
  String get about => 'Kuhusu';

  @override
  String get aboutPromise =>
      'Hakuna matangazo. Hakuna akaunti. Hakuna ufuatiliaji.';

  @override
  String get aboutPromiseBody =>
      'Zilizochanganuliwa hubaki kwenye simu hii isipokuwa uzishiriki au uzihamishe. Kuondoa programu huzifuta, kwa hivyo hamisha unachotaka kuhifadhi.';

  @override
  String get openSource => 'Chanzo huria (Apache-2.0)';

  @override
  String get privacyPolicy => 'Sera ya faragha';

  @override
  String get opensInBrowser => 'Hufunguka kwenye kivinjari chako';

  @override
  String get aboutTechAndroid =>
      'Uchanganuzi na utambuzi wa maandishi na Google ML Kit (kwenye kifaa). Uunganishaji wa PDF na PDFBox-Android. Fonti ya Devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Uchanganuzi na Apple VisionKit, utambuzi wa maandishi na Apple Vision (kwenye kifaa). Fonti ya Devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Imeshindwa kufungua $url';
  }

  @override
  String get scanBusinessCard => 'Changanua kadi ya biashara';

  @override
  String get saveAsContact => 'Hifadhi kama anwani';

  @override
  String get saveToContacts => 'Hifadhi kwenye Anwani';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Kadi ya biashara';

  @override
  String get contactHint =>
      'Kagua sehemu, kisha uhifadhi. Programu ya Anwani ya simu yako itafunguka ikiwa na kila kitu kimejazwa.';

  @override
  String get readingCard => 'Inasoma kadi…';

  @override
  String get nothingRecognised =>
      'Hakuna maandishi yaliyotambuliwa kwenye kadi hii. Bado unaweza kuandika maelezo.';

  @override
  String get contactOpened =>
      'Anwani imefunguliwa. Gusa Hifadhi hapo ili kuihifadhi.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Imeshindwa kufungua Anwani: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kadi $stamp';
  }

  @override
  String get fieldCompany => 'Kampuni';

  @override
  String get fieldJobTitle => 'Cheo';

  @override
  String get fieldMobile => 'Simu ya mkononi';

  @override
  String get fieldPhone => 'Simu';

  @override
  String get fieldFax => 'Faksi';

  @override
  String get fieldEmail => 'Barua pepe';

  @override
  String get fieldWebsite => 'Tovuti';

  @override
  String get fieldAddress => 'Anwani';

  @override
  String get fieldCity => 'Jiji';

  @override
  String get fieldCountry => 'Nchi';

  @override
  String get fieldNotes => 'Madokezo';

  @override
  String get drawFirst => 'Chora sahihi yako kwanza.';

  @override
  String get clear => 'Futa yote';

  @override
  String get save => 'Hifadhi';

  @override
  String get signHint =>
      'Tia sahihi ndani ya kisanduku kwa kidole chako. Geuza simu ubavu ili upate nafasi zaidi.';

  @override
  String get thin => 'Nyembamba';

  @override
  String get medium => 'Wastani';

  @override
  String get thick => 'Nene';

  @override
  String couldNotReadPage(String error) {
    return 'Imeshindwa kusoma ukurasa: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Imeshindwa kutia sahihi: $error';
  }

  @override
  String get placeSignature => 'Weka sahihi';

  @override
  String get apply => 'Tumia';

  @override
  String get dragPinchHint =>
      'Buruta ili kusogeza. Bana ili kubadilisha ukubwa.';

  @override
  String get smaller => 'Ndogo zaidi';

  @override
  String get larger => 'Kubwa zaidi';
}
