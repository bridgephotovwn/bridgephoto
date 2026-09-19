// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'I-scan';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Isara';

  @override
  String get delete => 'I-delete';

  @override
  String get share => 'Ibahagi';

  @override
  String get copy => 'Kopyahin';

  @override
  String get copied => 'Nakopya.';

  @override
  String get saved => 'Na-save.';

  @override
  String get name => 'Pangalan';

  @override
  String get rename => 'Palitan ang pangalan';

  @override
  String get settings => 'Mga Setting';

  @override
  String get dismiss => 'I-dismiss';

  @override
  String get tryAgain => 'Subukan ulit';

  @override
  String get cannotBeUndone => 'Hindi ito maibabalik.';

  @override
  String get savingPages => 'Sine-save ang mga pahina…';

  @override
  String get preparingScanner =>
      'Inihahanda ang scanner…\nSa unang paggamit, ida-download ito nang isang beses ng Google Play services.';

  @override
  String get scannerUnavailable => 'Hindi available ang scanner.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Hindi available ang scanner: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Hindi ma-save ang mga pahina: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Hindi mabuksan ang file picker: $error';
  }

  @override
  String get importingPdf => 'Ini-import ang PDF…';

  @override
  String get importedPdf => 'Na-import na PDF';

  @override
  String couldNotImport(String error) {
    return 'Hindi ma-import: $error';
  }

  @override
  String get pickTwoPdfs => 'Pumili ng hindi bababa sa dalawang PDF file.';

  @override
  String mergingPdfs(int count) {
    return 'Pinagsasama ang $count PDF file…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Pinagsama $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Hindi mapagsama: $error';
  }

  @override
  String get saveToFolder => 'I-save sa folder';

  @override
  String couldNotSave(String error) {
    return 'Hindi ma-save: $error';
  }

  @override
  String get mergedDocument => 'Pinagsamang dokumento';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count pa';
  }

  @override
  String get merging => 'Pinagsasama…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'I-delete ang $count dokumento?',
      one: 'I-delete ang 1 dokumento?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Binubuo ang PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Binubuo ang PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Binubuo ang PDF, pahina $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Hindi mabuo ang PDF: $error';
  }

  @override
  String get searchDocuments => 'Maghanap ng dokumento';

  @override
  String get closeSearch => 'Isara ang paghahanap';

  @override
  String get search => 'Maghanap';

  @override
  String get importPdfAsPages => 'I-import ang PDF bilang mga pahina';

  @override
  String get mergePdfFiles => 'Pagsamahin ang mga PDF file';

  @override
  String get clearSelection => 'I-clear ang pinili';

  @override
  String nSelected(int count) {
    return '$count ang napili';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ang napili · pagsasamahin sa ganitong pagkakasunod';
  }

  @override
  String get mergeIntoOne => 'Pagsamahin sa isang dokumento';

  @override
  String get moveToFolder => 'Move to a folder';

  @override
  String get folderName => 'Folder';

  @override
  String get moveToTop => 'Move out to the top level';

  @override
  String movedToFolder(int count, String folder) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moved to $folder',
      one: 'Moved to $folder',
    );
    return '$_temp0';
  }

  @override
  String movedToTop(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moved to the top level',
      one: 'Moved to the top level',
    );
    return '$_temp0';
  }

  @override
  String get shareAsPdf => 'Ibahagi bilang PDF';

  @override
  String get selectAll => 'Piliin lahat';

  @override
  String get noScansYet => 'Wala pang scan';

  @override
  String get nothingMatches => 'Walang tumugma';

  @override
  String get emptyHint =>
      'I-tap ang I-scan para kunan ng larawan ang isang dokumento. Nananatili ang lahat sa teleponong ito.';

  @override
  String get tryAnotherWord => 'Sumubok ng ibang salita.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pahina',
      one: '1 pahina',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Scan $stamp';
  }

  @override
  String get crashTitle => 'Hindi inaasahang nagsara ang BRIDGE PHOTO';

  @override
  String get crashBody =>
      'Na-save sa teleponong ito lang ang ulat tungkol sa nangyaring problema. Makakatulong sa pag-aayos ng problema kung ibabahagi mo ito sa developer. Naglalaman ito ng mga teknikal na detalye, hindi ang iyong mga dokumento.';

  @override
  String get reportCopied => 'Nakopya ang ulat.';

  @override
  String get crashReportSubject => 'Ulat ng pag-crash ng BRIDGE PHOTO';

  @override
  String get pdfSaved => 'Na-save ang PDF.';

  @override
  String couldNotSavePdf(String error) {
    return 'Hindi ma-save ang PDF: $error';
  }

  @override
  String get exportPagesAsImages =>
      'I-export ang mga pahina bilang mga larawan';

  @override
  String get saveToPhotos => 'I-save sa Photos';

  @override
  String get savingToPhotos => 'Sine-save sa Photos…';

  @override
  String get photosNeedsAndroid10 =>
      'Kailangan ng Android 10 o mas bago para makapag-save sa Photos. Gamitin na lang ang Ibahagi.';

  @override
  String get photosNotAllowed =>
      'Hindi pinapayagan ang BRIDGE PHOTO na magdagdag sa Photos. Payagan ito sa Mga Setting, o gamitin ang Ibahagi.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count larawan ang na-save sa Photos.',
      one: '1 larawan ang na-save sa Photos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Hindi ma-export: $error';
  }

  @override
  String get deleteDocumentQuestion => 'I-delete ang dokumentong ito?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Made-delete ang $count pahina. Hindi ito maibabalik.',
      one: 'Made-delete ang 1 pahina. Hindi ito maibabalik.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Teksto (OCR)';

  @override
  String get sharePdf => 'Ibahagi ang PDF';

  @override
  String get savePdfToFolder => 'I-save ang PDF sa folder';

  @override
  String get fitSizeTitle => 'Save PDF under a size limit';

  @override
  String get fitSizeHint =>
      'For a portal that refuses anything bigger. Your scans are not changed — only the copy being saved.';

  @override
  String fittingSize(int n, int of) {
    return 'Shrinking… attempt $n of $of';
  }

  @override
  String pdfSavedAtSize(String size) {
    return 'Saved, $size';
  }

  @override
  String pdfCouldNotFit(String size) {
    return 'Could not get under the limit. Saved at $size — the smallest it goes.';
  }

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
  String get exportAsImages => 'I-export bilang JPEG / PNG';

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
  String get deleteDocument => 'I-delete ang dokumento';

  @override
  String get noPages => 'Walang pahina. I-tap ang Magdagdag ng pahina.';

  @override
  String get addPages => 'Magdagdag ng pahina';

  @override
  String get holdToReorder =>
      'pindutin nang matagal ang pahina para ayusin ang pagkakasunod';

  @override
  String get savePdfDialogTitle => 'I-save ang PDF';

  @override
  String get saveDialogTitle => 'I-save';

  @override
  String couldNotRotate(String error) {
    return 'Hindi ma-rotate: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Hindi maibahagi: $error';
  }

  @override
  String get noTextOnPage => 'Walang nakitang teksto sa pahinang ito.';

  @override
  String pageNText(int n) {
    return 'Teksto ng pahina $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'I-delete ang pahina $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Pahina $n ng $total';
  }

  @override
  String get rotateLeft => 'I-rotate pakaliwa';

  @override
  String get rotateRight => 'I-rotate pakanan';

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
  String get undo => 'I-undo';

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
  String get sign => 'Pirmahan';

  @override
  String get copyText => 'Kopyahin ang teksto';

  @override
  String get shareImage => 'Ibahagi ang larawan';

  @override
  String get deletePage => 'I-delete ang pahina';

  @override
  String get signed => 'Napirmahan.';

  @override
  String signPageN(int n) {
    return 'Pirmahan ang pahina $n';
  }

  @override
  String get deleteThisSignature => 'I-delete ang pirmang ito';

  @override
  String get newSignature => 'Bagong pirma';

  @override
  String readingPage(int n, int total) {
    return 'Binabasa ang pahina $n / $total';
  }

  @override
  String get ocrFailed => 'Hindi nagtagumpay ang pagkilala sa teksto.';

  @override
  String ocrFailedWith(String error) {
    return 'Hindi nagtagumpay ang pagkilala sa teksto: $error';
  }

  @override
  String get textSaved => 'Na-save ang teksto.';

  @override
  String get text => 'Teksto';

  @override
  String get copyAll => 'Kopyahin lahat';

  @override
  String get shareText => 'Ibahagi ang teksto';

  @override
  String get saveAsTxt => 'I-save bilang .txt';

  @override
  String get readAgain => 'Basahin ulit';

  @override
  String get readAsLatin => 'Basahin bilang English / Latin';

  @override
  String get readAsDevanagari => 'Basahin bilang Hindi / Nepali';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Sa Android, isang beses dina-download ng Google Play services ang text model. Kung ito ang unang paggamit, maghintay ng isang minuto at subukan ulit.';

  @override
  String get noTextFound => 'Walang nakitang teksto.';

  @override
  String pageSeparator(int n) {
    return '--- Pahina $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Mode ng pag-scan';

  @override
  String get modeFull => 'Buo: mga filter + linisin ang mantsa at daliri';

  @override
  String get modeFilter => 'Mga filter lang';

  @override
  String get modeBase => 'Basic: crop at rotate lang';

  @override
  String get allowGallery => 'Payagan ang pag-import mula sa gallery';

  @override
  String get allowGalleryHint =>
      'Nagpapakita ng gallery button sa loob ng scanner';

  @override
  String get pagesPerScan => 'Pahina bawat scan';

  @override
  String get iosScannerNote =>
      'Sa iPhone, ang scanner ay ang sariling document camera ng Apple.';

  @override
  String get iosScannerNote2 =>
      'Built-in na ang awtomatikong pagkuha, edge detection, at mga color mode.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Laki ng pahina';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Kapareho ng hugis ng scan';

  @override
  String get searchablePdf => 'Searchable na PDF';

  @override
  String get autoName => 'Name scans from the page';

  @override
  String get autoNameHint =>
      'Reads the date, the kind of document and its number off the page — 2026-09-19 Invoice 4471. Only names a scan still called \"Scan …\"; a name you chose is never changed.';

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
      'Nagdaragdag ng hindi nakikitang text layer para mahanap at makopya ang teksto sa PDF';

  @override
  String get textRecognition => 'Pagkilala sa teksto';

  @override
  String get quality => 'Kalidad';

  @override
  String get qualityBest =>
      'Pinakamahusay: buong resolution, nababasa ang maliliit na letra';

  @override
  String get qualityFast => 'Mabilis: mas maliit na kopya ng pahina';

  @override
  String get language => 'Wika';

  @override
  String get scriptLatin =>
      'English at iba pang wikang gumagamit ng Latin script';

  @override
  String get scriptDevanagari => 'Hindi, Nepali, Marathi (+ Latin)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Chinese (+ Latin)';

  @override
  String get scriptJapanese => 'Japanese (+ Latin)';

  @override
  String get scriptKorean => 'Korean (+ Latin)';

  @override
  String get readAsChinese => 'Basahin bilang Chinese';

  @override
  String get readAsJapanese => 'Basahin bilang Japanese';

  @override
  String get readAsKorean => 'Basahin bilang Korean';

  @override
  String get languageAuto => 'Awtomatikong natutukoy ang wika.';

  @override
  String get appearance => 'Hitsura';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sundin ang telepono';

  @override
  String get themeLight => 'Maliwanag';

  @override
  String get themeDark => 'Madilim';

  @override
  String get about => 'Tungkol dito';

  @override
  String get aboutPromise => 'Walang ads. Walang account. Walang pag-track.';

  @override
  String get aboutPromiseBody =>
      'Nananatili ang mga scan sa teleponong ito maliban kung ibabahagi o ie-export mo ang mga ito. Made-delete ang mga ito kapag in-uninstall ang app, kaya i-export ang gusto mong itago.';

  @override
  String get openSource => 'Open source (Apache-2.0)';

  @override
  String get privacyPolicy => 'Patakaran sa privacy';

  @override
  String get opensInBrowser => 'Bubukas sa iyong browser';

  @override
  String get aboutTechAndroid =>
      'Pag-scan at pagkilala sa teksto ng Google ML Kit (sa device). Pagsasama ng PDF ng PDFBox-Android. Devanagari font: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Pag-scan ng Apple VisionKit, pagkilala sa teksto ng Apple Vision (sa device). Devanagari font: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Hindi mabuksan ang $url';
  }

  @override
  String get scanBusinessCard => 'Mag-scan ng business card';

  @override
  String get saveAsContact => 'I-save bilang contact';

  @override
  String get saveToContacts => 'I-save sa Mga Contact';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Business card';

  @override
  String get contactHint =>
      'Suriin ang mga field, pagkatapos ay i-save. Bubukas ang Mga Contact app ng iyong telepono na naka-fill in na ang lahat.';

  @override
  String get readingCard => 'Binabasa ang card…';

  @override
  String get nothingRecognised =>
      'Walang nakilalang teksto sa card na ito. Maaari mo pa ring i-type ang mga detalye.';

  @override
  String get contactOpened =>
      'Nabuksan ang Mga Contact. I-tap ang I-save doon para itago ito.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Hindi mabuksan ang Mga Contact: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Card $stamp';
  }

  @override
  String get fieldCompany => 'Kumpanya';

  @override
  String get fieldJobTitle => 'Posisyon sa trabaho';

  @override
  String get fieldMobile => 'Mobile';

  @override
  String get fieldPhone => 'Telepono';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Address';

  @override
  String get fieldCity => 'Lungsod';

  @override
  String get fieldCountry => 'Bansa';

  @override
  String get fieldNotes => 'Mga Tala';

  @override
  String get drawFirst => 'Iguhit muna ang iyong pirma.';

  @override
  String get clear => 'I-clear';

  @override
  String get save => 'I-save';

  @override
  String get signHint =>
      'Pumirma sa loob ng kahon gamit ang iyong daliri. Ihiga ang telepono para mas malawak ang espasyo.';

  @override
  String get thin => 'Manipis';

  @override
  String get medium => 'Katamtaman';

  @override
  String get thick => 'Makapal';

  @override
  String couldNotReadPage(String error) {
    return 'Hindi mabasa ang pahina: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Hindi mapirmahan: $error';
  }

  @override
  String get placeSignature => 'Ilagay ang pirma';

  @override
  String get apply => 'Ilapat';

  @override
  String get dragPinchHint =>
      'I-drag para ilipat. I-pinch para baguhin ang laki.';

  @override
  String get smaller => 'Paliitin';

  @override
  String get larger => 'Palakihin';
}
