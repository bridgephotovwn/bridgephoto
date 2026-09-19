// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'સ્કેન';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get ok => 'બરાબર';

  @override
  String get close => 'બંધ કરો';

  @override
  String get delete => 'કાઢી નાખો';

  @override
  String get share => 'શેર કરો';

  @override
  String get copy => 'કૉપિ કરો';

  @override
  String get copied => 'કૉપિ થયું.';

  @override
  String get saved => 'સેવ થયું.';

  @override
  String get name => 'નામ';

  @override
  String get rename => 'નામ બદલો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get dismiss => 'અવગણો';

  @override
  String get tryAgain => 'ફરી પ્રયાસ કરો';

  @override
  String get cannotBeUndone => 'આ પાછું વાળી શકાશે નહીં.';

  @override
  String get savingPages => 'પાનાં સેવ થઈ રહ્યાં છે…';

  @override
  String get preparingScanner =>
      'સ્કેનર તૈયાર થઈ રહ્યું છે…\nપહેલી વાર: Google Play સેવાઓ તેને એક વાર ડાઉનલોડ કરે છે.';

  @override
  String get scannerUnavailable => 'સ્કેનર ઉપલબ્ધ નથી.';

  @override
  String scannerUnavailableWith(String error) {
    return 'સ્કેનર ઉપલબ્ધ નથી: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'પાનાં સેવ થઈ શક્યાં નહીં: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ફાઇલ પસંદગીકાર ખૂલી શક્યું નહીં: $error';
  }

  @override
  String get importingPdf => 'PDF ઇમ્પોર્ટ થઈ રહી છે…';

  @override
  String get importedPdf => 'ઇમ્પોર્ટ કરેલી PDF';

  @override
  String couldNotImport(String error) {
    return 'ઇમ્પોર્ટ થઈ શક્યું નહીં: $error';
  }

  @override
  String get pickTwoPdfs => 'ઓછામાં ઓછી બે PDF ફાઇલો પસંદ કરો.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF ફાઇલો મર્જ થઈ રહી છે…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'મર્જ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'મર્જ થઈ શક્યું નહીં: $error';
  }

  @override
  String get saveToFolder => 'ફોલ્ડરમાં સેવ કરો';

  @override
  String couldNotSave(String error) {
    return 'સેવ થઈ શક્યું નહીં: $error';
  }

  @override
  String get mergedDocument => 'મર્જ કરેલો દસ્તાવેજ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + વધુ $count';
  }

  @override
  String get merging => 'મર્જ થઈ રહ્યું છે…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count દસ્તાવેજ કાઢી નાખવા?',
      one: '1 દસ્તાવેજ કાઢી નાખવો?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF બની રહી છે…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF બની રહી છે $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF બની રહી છે, પાનું $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF બની શકી નહીં: $error';
  }

  @override
  String get searchDocuments => 'દસ્તાવેજ શોધો';

  @override
  String get closeSearch => 'શોધ બંધ કરો';

  @override
  String get search => 'શોધો';

  @override
  String get importPdfAsPages => 'PDF ને પાનાં તરીકે ઇમ્પોર્ટ કરો';

  @override
  String get mergePdfFiles => 'PDF ફાઇલો મર્જ કરો';

  @override
  String get clearSelection => 'પસંદગી દૂર કરો';

  @override
  String nSelected(int count) {
    return '$count પસંદ કર્યાં';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count પસંદ કર્યાં · આ જ ક્રમમાં મર્જ થશે';
  }

  @override
  String get mergeIntoOne => 'એક દસ્તાવેજમાં મર્જ કરો';

  @override
  String get shareAsPdf => 'PDF તરીકે શેર કરો';

  @override
  String get selectAll => 'બધા પસંદ કરો';

  @override
  String get noScansYet => 'હજી કોઈ સ્કેન નથી';

  @override
  String get nothingMatches => 'કંઈ મળ્યું નહીં';

  @override
  String get emptyHint =>
      'દસ્તાવેજનો ફોટો લેવા સ્કેન પર ટૅપ કરો. બધું આ જ ફોન પર રહે છે.';

  @override
  String get tryAnotherWord => 'બીજો શબ્દ અજમાવો.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count પાનાં',
      one: '1 પાનું',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'સ્કેન $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO અનપેક્ષિત રીતે બંધ થયું';

  @override
  String get crashBody =>
      'શું ખોટું થયું તેનો રિપોર્ટ ફક્ત આ ફોન પર સેવ કરાયો છે. તેને ડેવલપર સાથે શેર કરવાથી સમસ્યા ઉકેલવામાં મદદ મળે છે. તેમાં ટેકનિકલ વિગતો છે, તમારા દસ્તાવેજ નહીં.';

  @override
  String get reportCopied => 'રિપોર્ટ કૉપિ થયો.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO ક્રૅશ રિપોર્ટ';

  @override
  String get pdfSaved => 'PDF સેવ થઈ.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF સેવ થઈ શકી નહીં: $error';
  }

  @override
  String get exportPagesAsImages => 'પાનાં ઇમેજ તરીકે એક્સપોર્ટ કરો';

  @override
  String get saveToPhotos => 'ફોટામાં સેવ કરો';

  @override
  String get savingToPhotos => 'ફોટામાં સેવ થઈ રહ્યું છે…';

  @override
  String get photosNeedsAndroid10 =>
      'ફોટામાં સેવ કરવા માટે Android 10 કે નવું જોઈએ. તેના બદલે શેર વાપરો.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ને ફોટામાં ઉમેરવાની પરવાનગી નથી. સેટિંગ્સમાં પરવાનગી આપો, અથવા શેર વાપરો.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ઇમેજ ફોટામાં સેવ થઈ.',
      one: '1 ઇમેજ ફોટામાં સેવ થઈ.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'એક્સપોર્ટ થઈ શક્યું નહીં: $error';
  }

  @override
  String get deleteDocumentQuestion => 'આ દસ્તાવેજ કાઢી નાખવો?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count પાનાં કાઢી નાખવામાં આવશે. આ પાછું વાળી શકાશે નહીં.',
      one: '1 પાનું કાઢી નાખવામાં આવશે. આ પાછું વાળી શકાશે નહીં.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ટેક્સ્ટ (OCR)';

  @override
  String get sharePdf => 'PDF શેર કરો';

  @override
  String get savePdfToFolder => 'PDF ફોલ્ડરમાં સેવ કરો';

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
  String get exportAsImages => 'JPEG / PNG તરીકે એક્સપોર્ટ કરો';

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
  String get deleteDocument => 'દસ્તાવેજ કાઢી નાખો';

  @override
  String get noPages => 'કોઈ પાનું નથી. પાનાં ઉમેરો પર ટૅપ કરો.';

  @override
  String get addPages => 'પાનાં ઉમેરો';

  @override
  String get holdToReorder => 'ક્રમ બદલવા પાનું દબાવી રાખો';

  @override
  String get savePdfDialogTitle => 'PDF સેવ કરો';

  @override
  String get saveDialogTitle => 'સેવ કરો';

  @override
  String couldNotRotate(String error) {
    return 'ફેરવી શકાયું નહીં: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'શેર થઈ શક્યું નહીં: $error';
  }

  @override
  String get noTextOnPage => 'આ પાના પર કોઈ ટેક્સ્ટ મળ્યો નહીં.';

  @override
  String pageNText(int n) {
    return 'પાનું $n નો ટેક્સ્ટ';
  }

  @override
  String deletePageQuestion(int n) {
    return 'પાનું $n કાઢી નાખવું?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total માંથી પાનું $n';
  }

  @override
  String get rotateLeft => 'ડાબે ફેરવો';

  @override
  String get rotateRight => 'જમણે ફેરવો';

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
  String get undo => 'પાછું વાળો';

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
  String get sign => 'સહી';

  @override
  String get copyText => 'ટેક્સ્ટ કૉપિ કરો';

  @override
  String get shareImage => 'ઇમેજ શેર કરો';

  @override
  String get deletePage => 'પાનું કાઢી નાખો';

  @override
  String get signed => 'સહી થઈ.';

  @override
  String signPageN(int n) {
    return 'પાનું $n પર સહી કરો';
  }

  @override
  String get deleteThisSignature => 'આ સહી કાઢી નાખો';

  @override
  String get newSignature => 'નવી સહી';

  @override
  String readingPage(int n, int total) {
    return 'પાનું $n / $total વાંચી રહ્યું છે';
  }

  @override
  String get ocrFailed => 'ટેક્સ્ટ ઓળખ નિષ્ફળ ગઈ.';

  @override
  String ocrFailedWith(String error) {
    return 'ટેક્સ્ટ ઓળખ નિષ્ફળ ગઈ: $error';
  }

  @override
  String get textSaved => 'ટેક્સ્ટ સેવ થયો.';

  @override
  String get text => 'ટેક્સ્ટ';

  @override
  String get copyAll => 'બધું કૉપિ કરો';

  @override
  String get shareText => 'ટેક્સ્ટ શેર કરો';

  @override
  String get saveAsTxt => '.txt તરીકે સેવ કરો';

  @override
  String get readAgain => 'ફરી વાંચો';

  @override
  String get readAsLatin => 'અંગ્રેજી / લેટિન તરીકે વાંચો';

  @override
  String get readAsDevanagari => 'હિન્દી / નેપાળી તરીકે વાંચો';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android પર ટેક્સ્ટ મૉડલ Google Play સેવાઓ એક વાર ડાઉનલોડ કરે છે. જો આ પહેલો ઉપયોગ હોય, તો એક મિનિટ રાહ જુઓ અને ફરી પ્રયાસ કરો.';

  @override
  String get noTextFound => 'કોઈ ટેક્સ્ટ મળ્યો નહીં.';

  @override
  String pageSeparator(int n) {
    return '--- પાનું $n ---';
  }

  @override
  String get scanner => 'સ્કેનર';

  @override
  String get scanMode => 'સ્કેન મોડ';

  @override
  String get modeFull => 'પૂર્ણ: ફિલ્ટર + ડાઘ અને આંગળીઓ સાફ કરો';

  @override
  String get modeFilter => 'ફક્ત ફિલ્ટર';

  @override
  String get modeBase => 'મૂળભૂત: ફક્ત ક્રૉપ અને ફેરવવું';

  @override
  String get allowGallery => 'ગૅલેરીમાંથી ઇમ્પોર્ટની પરવાનગી આપો';

  @override
  String get allowGalleryHint => 'સ્કેનરની અંદર ગૅલેરી બટન બતાવે છે';

  @override
  String get pagesPerScan => 'દરેક સ્કેન દીઠ પાનાં';

  @override
  String get iosScannerNote =>
      'iPhone પર સ્કેનર એ Apple નો પોતાનો દસ્તાવેજ કૅમેરા છે.';

  @override
  String get iosScannerNote2 =>
      'ઑટો કૅપ્ચર, કિનારી ઓળખ અને રંગ મોડ તેમાં જ સમાયેલા છે.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'પાનાનું કદ';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'સ્કેન જેવો જ આકાર';

  @override
  String get searchablePdf => 'શોધી શકાય તેવી PDF';

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
      'અદૃશ્ય ટેક્સ્ટ સ્તર ઉમેરે છે જેથી PDF માં શોધી શકાય અને ટેક્સ્ટ કૉપિ કરી શકાય';

  @override
  String get textRecognition => 'ટેક્સ્ટ ઓળખ';

  @override
  String get quality => 'ગુણવત્તા';

  @override
  String get qualityBest =>
      'શ્રેષ્ઠ: પૂર્ણ રિઝોલ્યુશન, ઝીણા અક્ષરો પણ વાંચે છે';

  @override
  String get qualityFast => 'ઝડપી: પાનાની નાની નકલ';

  @override
  String get language => 'ભાષા';

  @override
  String get scriptLatin => 'અંગ્રેજી અને લેટિન લિપિની અન્ય ભાષાઓ';

  @override
  String get scriptDevanagari => 'હિન્દી, નેપાળી, મરાઠી (+ લેટિન)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'ચીની (+ લેટિન)';

  @override
  String get scriptJapanese => 'જાપાની (+ લેટિન)';

  @override
  String get scriptKorean => 'કોરિયન (+ લેટિન)';

  @override
  String get readAsChinese => 'ચીની તરીકે વાંચો';

  @override
  String get readAsJapanese => 'જાપાની તરીકે વાંચો';

  @override
  String get readAsKorean => 'કોરિયન તરીકે વાંચો';

  @override
  String get languageAuto => 'ભાષા આપમેળે ઓળખાય છે.';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get theme => 'થીમ';

  @override
  String get themeSystem => 'ફોન મુજબ';

  @override
  String get themeLight => 'લાઇટ';

  @override
  String get themeDark => 'ડાર્ક';

  @override
  String get about => 'વિશે';

  @override
  String get aboutPromise => 'જાહેરાત નહીં. ખાતું નહીં. ટ્રૅકિંગ નહીં.';

  @override
  String get aboutPromiseBody =>
      'તમે શેર કે એક્સપોર્ટ ન કરો ત્યાં સુધી સ્કેન આ જ ફોન પર રહે છે. ઍપ અનઇન્સ્ટૉલ કરવાથી તે કાઢી નંખાય છે, તેથી જે રાખવું હોય તે એક્સપોર્ટ કરી લો.';

  @override
  String get openSource => 'ઓપન સોર્સ (Apache-2.0)';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get opensInBrowser => 'તમારા બ્રાઉઝરમાં ખૂલે છે';

  @override
  String get aboutTechAndroid =>
      'સ્કેનિંગ અને ટેક્સ્ટ ઓળખ Google ML Kit દ્વારા (ડિવાઇસ પર). PDF મર્જ PDFBox-Android દ્વારા. દેવનાગરી ફૉન્ટ: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'સ્કેનિંગ Apple VisionKit દ્વારા, ટેક્સ્ટ ઓળખ Apple Vision દ્વારા (ડિવાઇસ પર). દેવનાગરી ફૉન્ટ: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url ખોલી શકાયું નહીં';
  }

  @override
  String get scanBusinessCard => 'બિઝનેસ કાર્ડ સ્કેન કરો';

  @override
  String get saveAsContact => 'સંપર્ક તરીકે સેવ કરો';

  @override
  String get saveToContacts => 'સંપર્કોમાં સેવ કરો';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'બિઝનેસ કાર્ડ';

  @override
  String get contactHint =>
      'ફીલ્ડ તપાસો, પછી સેવ કરો. તમારા ફોનની સંપર્કો ઍપ બધું ભરેલી ખૂલશે.';

  @override
  String get readingCard => 'કાર્ડ વાંચી રહ્યું છે…';

  @override
  String get nothingRecognised =>
      'આ કાર્ડ પર કોઈ ટેક્સ્ટ ઓળખાયો નહીં. તમે હજી પણ વિગતો ટાઇપ કરી શકો છો.';

  @override
  String get contactOpened =>
      'સંપર્કો ખૂલ્યું. રાખવા માટે ત્યાં સેવ કરો પર ટૅપ કરો.';

  @override
  String couldNotOpenContacts(String error) {
    return 'સંપર્કો ખોલી શકાયું નહીં: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'કાર્ડ $stamp';
  }

  @override
  String get fieldCompany => 'કંપની';

  @override
  String get fieldJobTitle => 'હોદ્દો';

  @override
  String get fieldMobile => 'મોબાઇલ';

  @override
  String get fieldPhone => 'ફોન';

  @override
  String get fieldFax => 'ફૅક્સ';

  @override
  String get fieldEmail => 'ઇમેઇલ';

  @override
  String get fieldWebsite => 'વેબસાઇટ';

  @override
  String get fieldAddress => 'સરનામું';

  @override
  String get fieldCity => 'શહેર';

  @override
  String get fieldCountry => 'દેશ';

  @override
  String get fieldNotes => 'નોંધો';

  @override
  String get drawFirst => 'પહેલાં તમારી સહી દોરો.';

  @override
  String get clear => 'સાફ કરો';

  @override
  String get save => 'સેવ કરો';

  @override
  String get signHint =>
      'બૉક્સમાં આંગળીથી સહી કરો. વધુ જગ્યા માટે ફોન આડો રાખો.';

  @override
  String get thin => 'પાતળી';

  @override
  String get medium => 'મધ્યમ';

  @override
  String get thick => 'જાડી';

  @override
  String couldNotReadPage(String error) {
    return 'પાનું વાંચી શકાયું નહીં: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'સહી થઈ શકી નહીં: $error';
  }

  @override
  String get placeSignature => 'સહી મૂકો';

  @override
  String get apply => 'લાગુ કરો';

  @override
  String get dragPinchHint => 'ખસેડવા ડ્રૅગ કરો. કદ બદલવા પિંચ કરો.';

  @override
  String get smaller => 'નાનું';

  @override
  String get larger => 'મોટું';
}
