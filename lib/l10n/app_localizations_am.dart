// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'ቃኝ';

  @override
  String get cancel => 'ይቅር';

  @override
  String get ok => 'እሺ';

  @override
  String get close => 'ዝጋ';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get share => 'አጋራ';

  @override
  String get copy => 'ቅዳ';

  @override
  String get copied => 'ተቀድቷል።';

  @override
  String get saved => 'ተቀምጧል።';

  @override
  String get name => 'ስም';

  @override
  String get rename => 'ዳግም ሰይም';

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get dismiss => 'አሰናብት';

  @override
  String get tryAgain => 'እንደገና ይሞክሩ';

  @override
  String get cannotBeUndone => 'ይህ ሊቀለበስ አይችልም።';

  @override
  String get savingPages => 'ገጾችን በማስቀመጥ ላይ…';

  @override
  String get preparingScanner =>
      'ቃኚውን በማዘጋጀት ላይ…\nለመጀመሪያ ጊዜ ሲጠቀሙ፦ የGoogle Play አገልግሎቶች አንድ ጊዜ ያወርዱታል።';

  @override
  String get scannerUnavailable => 'ቃኚው አይገኝም።';

  @override
  String scannerUnavailableWith(String error) {
    return 'ቃኚው አይገኝም፦ $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'ገጾቹን ማስቀመጥ አልተቻለም፦ $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'የፋይል መራጩን መክፈት አልተቻለም፦ $error';
  }

  @override
  String get importingPdf => 'PDF በማስመጣት ላይ…';

  @override
  String get importedPdf => 'የመጣ PDF';

  @override
  String couldNotImport(String error) {
    return 'ማስመጣት አልተቻለም፦ $error';
  }

  @override
  String get pickTwoPdfs => 'ቢያንስ ሁለት የPDF ፋይሎችን ይምረጡ።';

  @override
  String mergingPdfs(int count) {
    return '$count የPDF ፋይሎችን በማዋሃድ ላይ…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'የተዋሃደ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ማዋሃድ አልተቻለም፦ $error';
  }

  @override
  String get saveToFolder => 'ወደ አቃፊ አስቀምጥ';

  @override
  String couldNotSave(String error) {
    return 'ማስቀመጥ አልተቻለም፦ $error';
  }

  @override
  String get mergedDocument => 'የተዋሃደ ሰነድ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + ተጨማሪ $count';
  }

  @override
  String get merging => 'በማዋሃድ ላይ…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ሰነዶች ይሰረዙ?',
      one: '$count ሰነድ ይሰረዝ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF በመገንባት ላይ…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF በመገንባት ላይ $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF በመገንባት ላይ፣ ገጽ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF መገንባት አልተቻለም፦ $error';
  }

  @override
  String get searchDocuments => 'ሰነዶችን ይፈልጉ';

  @override
  String get closeSearch => 'ፍለጋን ዝጋ';

  @override
  String get search => 'ፈልግ';

  @override
  String get importPdfAsPages => 'PDF እንደ ገጾች አስመጣ';

  @override
  String get mergePdfFiles => 'የPDF ፋይሎችን አዋህድ';

  @override
  String get clearSelection => 'ምርጫን አጽዳ';

  @override
  String nSelected(int count) {
    return '$count ተመርጧል';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ተመርጧል · በዚህ ቅደም ተከተል ይዋሃዳል';
  }

  @override
  String get mergeIntoOne => 'ወደ አንድ ሰነድ አዋህድ';

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
  String get shareAsPdf => 'እንደ PDF አጋራ';

  @override
  String get selectAll => 'ሁሉንም ምረጥ';

  @override
  String get noScansYet => 'እስካሁን ምንም ቅኝት የለም';

  @override
  String get nothingMatches => 'ምንም አይዛመድም';

  @override
  String get emptyHint => 'ሰነድ ፎቶ ለማንሳት ቃኝን መታ ያድርጉ። ሁሉም ነገር በዚህ ስልክ ላይ ይቆያል።';

  @override
  String get tryAnotherWord => 'ሌላ ቃል ይሞክሩ።';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ገጾች',
      one: '$count ገጽ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'ቅኝት $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ባልተጠበቀ ሁኔታ ተዘግቷል';

  @override
  String get crashBody =>
      'ስለተፈጠረው ችግር ሪፖርት በዚህ ስልክ ላይ ብቻ ተቀምጧል። ለገንቢው ማጋራት ችግሩን ለማስተካከል ይረዳል። ቴክኒካዊ ዝርዝሮችን እንጂ ሰነዶችዎን አልያዘም።';

  @override
  String get reportCopied => 'ሪፖርቱ ተቀድቷል።';

  @override
  String get crashReportSubject => 'የBRIDGE PHOTO ብልሽት ሪፖርት';

  @override
  String get pdfSaved => 'PDF ተቀምጧል።';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ማስቀመጥ አልተቻለም፦ $error';
  }

  @override
  String get exportPagesAsImages => 'ገጾችን እንደ ምስሎች ላክ';

  @override
  String get saveToPhotos => 'ወደ ፎቶዎች አስቀምጥ';

  @override
  String get savingToPhotos => 'ወደ ፎቶዎች በማስቀመጥ ላይ…';

  @override
  String get photosNeedsAndroid10 =>
      'ወደ ፎቶዎች ማስቀመጥ Android 10 ወይም ከዚያ በላይ ያስፈልገዋል። በምትኩ አጋራን ይጠቀሙ።';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ወደ ፎቶዎች እንዲያክል አልተፈቀደለትም። በቅንብሮች ውስጥ ይፍቀዱለት፣ ወይም አጋራን ይጠቀሙ።';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ምስሎች ወደ ፎቶዎች ተቀምጠዋል።',
      one: '$count ምስል ወደ ፎቶዎች ተቀምጧል።',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'መላክ አልተቻለም፦ $error';
  }

  @override
  String get deleteDocumentQuestion => 'ይህ ሰነድ ይሰረዝ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ገጾች ይሰረዛሉ። ይህ ሊቀለበስ አይችልም።',
      one: '$count ገጽ ይሰረዛል። ይህ ሊቀለበስ አይችልም።',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ጽሑፍ (OCR)';

  @override
  String get sharePdf => 'PDF አጋራ';

  @override
  String get savePdfToFolder => 'PDF ወደ አቃፊ አስቀምጥ';

  @override
  String get tidyPagesTitle => 'Find blank and repeated pages';

  @override
  String get checkingPages => 'Looking through the pages...';

  @override
  String get nothingToTidy => 'Nothing to remove - no blank or repeated pages';

  @override
  String tidyFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages you may not want',
      one: '1 page you may not want',
    );
    return '$_temp0';
  }

  @override
  String pageN(int n) {
    return 'Page $n';
  }

  @override
  String get pageIsBlank => 'Looks blank';

  @override
  String pageRepeats(int n) {
    return 'Same as page $n';
  }

  @override
  String get removeChosen => 'Remove the ticked pages';

  @override
  String pagesRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages removed',
      one: '1 page removed',
    );
    return '$_temp0';
  }

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
  String get exportAsImages => 'እንደ JPEG / PNG ላክ';

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
  String get deleteDocument => 'ሰነድ ሰርዝ';

  @override
  String get noPages => 'ምንም ገጾች የሉም። ገጾችን አክልን መታ ያድርጉ።';

  @override
  String get addPages => 'ገጾችን አክል';

  @override
  String get holdToReorder => 'ቅደም ተከተል ለመቀየር ገጽን ተጭነው ይያዙ';

  @override
  String get savePdfDialogTitle => 'PDF አስቀምጥ';

  @override
  String get saveDialogTitle => 'አስቀምጥ';

  @override
  String couldNotRotate(String error) {
    return 'ማሽከርከር አልተቻለም፦ $error';
  }

  @override
  String couldNotShare(String error) {
    return 'ማጋራት አልተቻለም፦ $error';
  }

  @override
  String get noTextOnPage => 'በዚህ ገጽ ላይ ምንም ጽሑፍ አልተገኘም።';

  @override
  String pageNText(int n) {
    return 'የገጽ $n ጽሑፍ';
  }

  @override
  String deletePageQuestion(int n) {
    return 'ገጽ $n ይሰረዝ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'ገጽ $n ከ$total';
  }

  @override
  String get rotateLeft => 'ወደ ግራ አሽከርክር';

  @override
  String get rotateRight => 'ወደ ቀኝ አሽከርክር';

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
  String get undo => 'ቀልብስ';

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
  String get sign => 'ፈርም';

  @override
  String get copyText => 'ጽሑፍ ቅዳ';

  @override
  String get shareImage => 'ምስል አጋራ';

  @override
  String get deletePage => 'ገጽ ሰርዝ';

  @override
  String get signed => 'ተፈርሟል።';

  @override
  String signPageN(int n) {
    return 'ገጽ $n ፈርም';
  }

  @override
  String get deleteThisSignature => 'ይህን ፊርማ ሰርዝ';

  @override
  String get newSignature => 'አዲስ ፊርማ';

  @override
  String readingPage(int n, int total) {
    return 'ገጽ $n / $total በማንበብ ላይ';
  }

  @override
  String get ocrFailed => 'ጽሑፍ ማወቅ አልተሳካም።';

  @override
  String ocrFailedWith(String error) {
    return 'ጽሑፍ ማወቅ አልተሳካም፦ $error';
  }

  @override
  String get textSaved => 'ጽሑፍ ተቀምጧል።';

  @override
  String get text => 'ጽሑፍ';

  @override
  String get copyAll => 'ሁሉንም ቅዳ';

  @override
  String get shareText => 'ጽሑፍ አጋራ';

  @override
  String get saveAsTxt => 'እንደ .txt አስቀምጥ';

  @override
  String get readAgain => 'እንደገና አንብብ';

  @override
  String get readAsLatin => 'እንደ እንግሊዝኛ / ላቲን አንብብ';

  @override
  String get readAsDevanagari => 'እንደ ሂንዲ / ኔፓሊ አንብብ';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'በAndroid ላይ የጽሑፍ ሞዴሉ በGoogle Play አገልግሎቶች አንድ ጊዜ ይወርዳል። ይህ የመጀመሪያ አጠቃቀም ከሆነ፣ አንድ ደቂቃ ጠብቀው እንደገና ይሞክሩ።';

  @override
  String get noTextFound => 'ምንም ጽሑፍ አልተገኘም።';

  @override
  String pageSeparator(int n) {
    return '--- ገጽ $n ---';
  }

  @override
  String get scanner => 'ቃኚ';

  @override
  String get scanMode => 'የቅኝት ሁነታ';

  @override
  String get modeFull => 'ሙሉ፦ ማጣሪያዎች + እድፍና ጣቶችን ማጽዳት';

  @override
  String get modeFilter => 'ማጣሪያዎች ብቻ';

  @override
  String get modeBase => 'መሠረታዊ፦ መከርከምና ማሽከርከር ብቻ';

  @override
  String get allowGallery => 'ከጋለሪ ማስመጣትን ፍቀድ';

  @override
  String get allowGalleryHint => 'በቃኚው ውስጥ የጋለሪ አዝራር ያሳያል';

  @override
  String get pagesPerScan => 'በአንድ ቅኝት የገጾች ብዛት';

  @override
  String get iosScannerNote => 'በiPhone ላይ ቃኚው የApple የራሱ የሰነድ ካሜራ ነው።';

  @override
  String get iosScannerNote2 =>
      'ራስ-ሰር ቀረጻ፣ ጠርዝ ማወቅ እና የቀለም ሁነታዎች አብሮ የተሠሩ ናቸው።';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'የገጽ መጠን';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'ከቅኝቱ ጋር ተመሳሳይ ቅርጽ';

  @override
  String get searchablePdf => 'ሊፈለግ የሚችል PDF';

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
  String get searchablePdfHint => 'PDF እንዲፈለግና ጽሑፍ እንዲቀዳ የማይታይ የጽሑፍ ንብርብር ያክላል';

  @override
  String get textRecognition => 'ጽሑፍ ማወቅ';

  @override
  String get quality => 'ጥራት';

  @override
  String get qualityBest => 'ምርጥ፦ ሙሉ ጥራት፣ ትንንሽ ጽሑፍን ያነባል';

  @override
  String get qualityFast => 'ፈጣን፦ የገጹ አነስተኛ ቅጂ';

  @override
  String get language => 'ቋንቋ';

  @override
  String get scriptLatin => 'እንግሊዝኛ እና ሌሎች የላቲን ፊደል ቋንቋዎች';

  @override
  String get scriptDevanagari => 'ሂንዲ፣ ኔፓሊ፣ ማራቲ (+ ላቲን)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'ቻይንኛ (+ ላቲን)';

  @override
  String get scriptJapanese => 'ጃፓንኛ (+ ላቲን)';

  @override
  String get scriptKorean => 'ኮሪያኛ (+ ላቲን)';

  @override
  String get readAsChinese => 'እንደ ቻይንኛ አንብብ';

  @override
  String get readAsJapanese => 'እንደ ጃፓንኛ አንብብ';

  @override
  String get readAsKorean => 'እንደ ኮሪያኛ አንብብ';

  @override
  String get languageAuto => 'ቋንቋው በራስ-ሰር ይታወቃል።';

  @override
  String get appearance => 'መልክ';

  @override
  String get theme => 'ገጽታ';

  @override
  String get themeSystem => 'ስልኩን ተከተል';

  @override
  String get themeLight => 'ብሩህ';

  @override
  String get themeDark => 'ጨለማ';

  @override
  String get about => 'ስለ';

  @override
  String get aboutPromise => 'ማስታወቂያ የለም። መለያ አያስፈልግም። ክትትል የለም።';

  @override
  String get aboutPromiseBody =>
      'ቅኝቶች እስካላጋሩ ወይም እስካልላኩ ድረስ በዚህ ስልክ ላይ ይቆያሉ። መተግበሪያውን ማራገፍ ይሰርዛቸዋል፣ ስለዚህ ማቆየት የሚፈልጉትን ይላኩ።';

  @override
  String get openSource => 'ክፍት ምንጭ (Apache-2.0)';

  @override
  String get privacyPolicy => 'የግላዊነት መመሪያ';

  @override
  String get opensInBrowser => 'በአሳሽዎ ውስጥ ይከፈታል';

  @override
  String get aboutTechAndroid =>
      'ቅኝትና ጽሑፍ ማወቅ በGoogle ML Kit (በመሣሪያው ላይ)። የPDF ውህደት በPDFBox-Android። የደቫናጋሪ ቅርጸ-ቁምፊ፦ Noto (OFL)።';

  @override
  String get aboutTechIos =>
      'ቅኝት በApple VisionKit፣ ጽሑፍ ማወቅ በApple Vision (በመሣሪያው ላይ)። የደቫናጋሪ ቅርጸ-ቁምፊ፦ Noto (OFL)።';

  @override
  String couldNotOpenUrl(String url) {
    return '$urlን መክፈት አልተቻለም';
  }

  @override
  String get scanBusinessCard => 'የንግድ ካርድ ቃኝ';

  @override
  String get saveAsContact => 'እንደ እውቂያ አስቀምጥ';

  @override
  String get saveToContacts => 'ወደ እውቂያዎች አስቀምጥ';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'የንግድ ካርድ';

  @override
  String get contactHint =>
      'መስኮቹን ያረጋግጡ፣ ከዚያ ያስቀምጡ። የስልክዎ የእውቂያዎች መተግበሪያ ሁሉም ነገር ተሞልቶ ይከፈታል።';

  @override
  String get readingCard => 'ካርዱን በማንበብ ላይ…';

  @override
  String get nothingRecognised =>
      'በዚህ ካርድ ላይ ምንም ጽሑፍ አልታወቀም። አሁንም ዝርዝሮቹን መተየብ ይችላሉ።';

  @override
  String get contactOpened => 'እውቂያዎች ተከፍቷል። ለማስቀመጥ እዚያ አስቀምጥን መታ ያድርጉ።';

  @override
  String couldNotOpenContacts(String error) {
    return 'እውቂያዎችን መክፈት አልተቻለም፦ $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'ካርድ $stamp';
  }

  @override
  String get fieldCompany => 'ኩባንያ';

  @override
  String get fieldJobTitle => 'የሥራ መደብ';

  @override
  String get fieldMobile => 'ሞባይል';

  @override
  String get fieldPhone => 'ስልክ';

  @override
  String get fieldFax => 'ፋክስ';

  @override
  String get fieldEmail => 'ኢሜይል';

  @override
  String get fieldWebsite => 'ድር ጣቢያ';

  @override
  String get fieldAddress => 'አድራሻ';

  @override
  String get fieldCity => 'ከተማ';

  @override
  String get fieldCountry => 'አገር';

  @override
  String get fieldNotes => 'ማስታወሻዎች';

  @override
  String get drawFirst => 'መጀመሪያ ፊርማዎን ይሳሉ።';

  @override
  String get clear => 'አጽዳ';

  @override
  String get save => 'አስቀምጥ';

  @override
  String get signHint => 'በሳጥኑ ውስጥ በጣትዎ ይፈርሙ። ተጨማሪ ቦታ ለማግኘት ስልኩን ወደ ጎን ያዙሩት።';

  @override
  String get thin => 'ቀጭን';

  @override
  String get medium => 'መካከለኛ';

  @override
  String get thick => 'ወፍራም';

  @override
  String couldNotReadPage(String error) {
    return 'ገጹን ማንበብ አልተቻለም፦ $error';
  }

  @override
  String couldNotSign(String error) {
    return 'መፈረም አልተቻለም፦ $error';
  }

  @override
  String get placeSignature => 'ፊርማ አስቀምጥ';

  @override
  String get apply => 'ተግብር';

  @override
  String get dragPinchHint => 'ለማንቀሳቀስ ይጎትቱ። መጠኑን ለመቀየር በሁለት ጣቶች ይቆንጥጡ።';

  @override
  String get smaller => 'አሳንስ';

  @override
  String get larger => 'አሳድግ';
}
