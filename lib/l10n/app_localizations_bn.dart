// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'স্ক্যান';

  @override
  String get cancel => 'বাতিল';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get delete => 'মুছুন';

  @override
  String get share => 'শেয়ার করুন';

  @override
  String get copy => 'কপি করুন';

  @override
  String get copied => 'কপি হয়েছে।';

  @override
  String get saved => 'সেভ হয়েছে।';

  @override
  String get name => 'নাম';

  @override
  String get rename => 'নাম বদলান';

  @override
  String get settings => 'সেটিংস';

  @override
  String get dismiss => 'খারিজ করুন';

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String get cannotBeUndone => 'এটি আর ফেরানো যাবে না।';

  @override
  String get savingPages => 'পৃষ্ঠা সেভ হচ্ছে…';

  @override
  String get preparingScanner =>
      'স্ক্যানার প্রস্তুত হচ্ছে…\nপ্রথমবার: Google Play পরিষেবা এটি একবার ডাউনলোড করে।';

  @override
  String get scannerUnavailable => 'স্ক্যানার পাওয়া যাচ্ছে না।';

  @override
  String scannerUnavailableWith(String error) {
    return 'স্ক্যানার পাওয়া যাচ্ছে না: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'পৃষ্ঠাগুলি সেভ করা যায়নি: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ফাইল বাছাইকারী খোলা যায়নি: $error';
  }

  @override
  String get importingPdf => 'PDF ইম্পোর্ট হচ্ছে…';

  @override
  String get importedPdf => 'ইম্পোর্ট করা PDF';

  @override
  String couldNotImport(String error) {
    return 'ইম্পোর্ট করা যায়নি: $error';
  }

  @override
  String get pickTwoPdfs => 'কমপক্ষে দুটি PDF ফাইল বেছে নিন।';

  @override
  String mergingPdfs(int count) {
    return '$countটি PDF ফাইল মার্জ হচ্ছে…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'মার্জ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'মার্জ করা যায়নি: $error';
  }

  @override
  String get saveToFolder => 'ফোল্ডারে সেভ করুন';

  @override
  String couldNotSave(String error) {
    return 'সেভ করা যায়নি: $error';
  }

  @override
  String get mergedDocument => 'মার্জ করা নথি';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + আরও $countটি';
  }

  @override
  String get merging => 'মার্জ হচ্ছে…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নথি মুছবেন?',
      one: '1টি নথি মুছবেন?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF তৈরি হচ্ছে…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF তৈরি হচ্ছে $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF তৈরি হচ্ছে, পৃষ্ঠা $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF তৈরি করা যায়নি: $error';
  }

  @override
  String get searchDocuments => 'নথি খুঁজুন';

  @override
  String get closeSearch => 'খোঁজা বন্ধ করুন';

  @override
  String get search => 'খুঁজুন';

  @override
  String get importPdfAsPages => 'PDF পৃষ্ঠা হিসেবে ইম্পোর্ট করুন';

  @override
  String get mergePdfFiles => 'PDF ফাইল মার্জ করুন';

  @override
  String get clearSelection => 'নির্বাচন বাতিল করুন';

  @override
  String nSelected(int count) {
    return '$countটি নির্বাচিত';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$countটি নির্বাচিত · এই ক্রমেই মার্জ হবে';
  }

  @override
  String get mergeIntoOne => 'একটি নথিতে মার্জ করুন';

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
  String get shareAsPdf => 'PDF হিসেবে শেয়ার করুন';

  @override
  String get selectAll => 'সব নির্বাচন করুন';

  @override
  String get noScansYet => 'এখনও কোনও স্ক্যান নেই';

  @override
  String get nothingMatches => 'কিছু মেলেনি';

  @override
  String get emptyHint =>
      'নথির ছবি তুলতে স্ক্যান-এ ট্যাপ করুন। সবকিছু এই ফোনেই থাকে।';

  @override
  String get tryAnotherWord => 'অন্য শব্দ দিয়ে চেষ্টা করুন।';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা',
      one: '1টি পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'স্ক্যান $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO অপ্রত্যাশিতভাবে বন্ধ হয়ে গেছে';

  @override
  String get crashBody =>
      'কী ভুল হয়েছে তার একটি রিপোর্ট শুধু এই ফোনেই সেভ করা হয়েছে। ডেভেলপারের সঙ্গে এটি শেয়ার করলে সমস্যা ঠিক করতে সুবিধা হয়। এতে প্রযুক্তিগত বিবরণ আছে, আপনার নথি নয়।';

  @override
  String get reportCopied => 'রিপোর্ট কপি হয়েছে।';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO ক্র্যাশ রিপোর্ট';

  @override
  String get pdfSaved => 'PDF সেভ হয়েছে।';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF সেভ করা যায়নি: $error';
  }

  @override
  String get exportPagesAsImages => 'পৃষ্ঠাগুলি ছবি হিসেবে এক্সপোর্ট করুন';

  @override
  String get saveToPhotos => 'ফটোতে সেভ করুন';

  @override
  String get savingToPhotos => 'ফটোতে সেভ হচ্ছে…';

  @override
  String get photosNeedsAndroid10 =>
      'ফটোতে সেভ করতে Android 10 বা নতুন সংস্করণ লাগবে। এর বদলে শেয়ার ব্যবহার করুন।';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO-কে ফটোতে যোগ করার অনুমতি নেই। সেটিংসে অনুমতি দিন, বা শেয়ার ব্যবহার করুন।';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি ফটোতে সেভ হয়েছে।',
      one: '1টি ছবি ফটোতে সেভ হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'এক্সপোর্ট করা যায়নি: $error';
  }

  @override
  String get deleteDocumentQuestion => 'এই নথিটি মুছবেন?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা মুছে যাবে। এটি আর ফেরানো যাবে না।',
      one: '1টি পৃষ্ঠা মুছে যাবে। এটি আর ফেরানো যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'টেক্সট (OCR)';

  @override
  String get sharePdf => 'PDF শেয়ার করুন';

  @override
  String get savePdfToFolder => 'PDF ফোল্ডারে সেভ করুন';

  @override
  String get tidyPagesTitle => 'Find blank and repeated pages';

  @override
  String get splitDocumentTitle => 'Split at blank pages';

  @override
  String get noDividersFound => 'No blank dividers found - nothing to split';

  @override
  String splitDocumentBody(int count) {
    return 'This will become $count separate documents. The blank pages used as dividers are removed.';
  }

  @override
  String get splittingDocument => 'Splitting...';

  @override
  String splitDone(int count) {
    return 'Split into $count documents';
  }

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
  String get exportAsImages => 'JPEG / PNG হিসেবে এক্সপোর্ট করুন';

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
  String get deleteDocument => 'নথি মুছুন';

  @override
  String get noPages => 'কোনও পৃষ্ঠা নেই। পৃষ্ঠা যোগ করুন-এ ট্যাপ করুন।';

  @override
  String get addPages => 'পৃষ্ঠা যোগ করুন';

  @override
  String get holdToReorder => 'ক্রম বদলাতে পৃষ্ঠা চেপে ধরুন';

  @override
  String get savePdfDialogTitle => 'PDF সেভ করুন';

  @override
  String get saveDialogTitle => 'সেভ করুন';

  @override
  String couldNotRotate(String error) {
    return 'ঘোরানো যায়নি: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'শেয়ার করা যায়নি: $error';
  }

  @override
  String get noTextOnPage => 'এই পৃষ্ঠায় কোনও টেক্সট পাওয়া যায়নি।';

  @override
  String pageNText(int n) {
    return 'পৃষ্ঠা $n-এর টেক্সট';
  }

  @override
  String deletePageQuestion(int n) {
    return 'পৃষ্ঠা $n মুছবেন?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$totalটির মধ্যে পৃষ্ঠা $n';
  }

  @override
  String get rotateLeft => 'বাঁয়ে ঘোরান';

  @override
  String get rotateRight => 'ডানে ঘোরান';

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
  String get hideIdTitle => 'Hide an ID number';

  @override
  String get noIdNumbersFound => 'No ID number found on this page';

  @override
  String idNumbersFound(int count, String masked) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Found $count — the first would read $masked',
      one: 'Found one — it would read $masked',
    );
    return '$_temp0';
  }

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
  String get undo => 'পূর্বাবস্থায় ফেরান';

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
  String get sign => 'স্বাক্ষর';

  @override
  String get copyText => 'টেক্সট কপি করুন';

  @override
  String get shareImage => 'ছবি শেয়ার করুন';

  @override
  String get deletePage => 'পৃষ্ঠা মুছুন';

  @override
  String get signed => 'স্বাক্ষর হয়েছে।';

  @override
  String signPageN(int n) {
    return 'পৃষ্ঠা $n-এ স্বাক্ষর করুন';
  }

  @override
  String get deleteThisSignature => 'এই স্বাক্ষর মুছুন';

  @override
  String get newSignature => 'নতুন স্বাক্ষর';

  @override
  String readingPage(int n, int total) {
    return 'পৃষ্ঠা $n / $total পড়া হচ্ছে';
  }

  @override
  String get ocrFailed => 'টেক্সট শনাক্তকরণ ব্যর্থ হয়েছে।';

  @override
  String ocrFailedWith(String error) {
    return 'টেক্সট শনাক্তকরণ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get textSaved => 'টেক্সট সেভ হয়েছে।';

  @override
  String get text => 'টেক্সট';

  @override
  String get copyAll => 'সব কপি করুন';

  @override
  String get shareText => 'টেক্সট শেয়ার করুন';

  @override
  String get saveAsTxt => '.txt হিসেবে সেভ করুন';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'আবার পড়ুন';

  @override
  String get readAsLatin => 'ইংরেজি / ল্যাটিন হিসেবে পড়ুন';

  @override
  String get readAsDevanagari => 'হিন্দি / নেপালি হিসেবে পড়ুন';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android-এ টেক্সট মডেলটি Google Play পরিষেবা একবার ডাউনলোড করে। এটি প্রথম ব্যবহার হলে এক মিনিট অপেক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get noTextFound => 'কোনও টেক্সট পাওয়া যায়নি।';

  @override
  String pageSeparator(int n) {
    return '--- পৃষ্ঠা $n ---';
  }

  @override
  String get scanner => 'স্ক্যানার';

  @override
  String get scanMode => 'স্ক্যান মোড';

  @override
  String get modeFull => 'সম্পূর্ণ: ফিল্টার + দাগ ও আঙুল মুছে ফেলা';

  @override
  String get modeFilter => 'শুধু ফিল্টার';

  @override
  String get modeBase => 'সাধারণ: শুধু ক্রপ ও ঘোরানো';

  @override
  String get allowGallery => 'গ্যালারি থেকে ইম্পোর্টের অনুমতি দিন';

  @override
  String get allowGalleryHint => 'স্ক্যানারের ভিতরে গ্যালারি বোতাম দেখায়';

  @override
  String get pagesPerScan => 'প্রতি স্ক্যানে পৃষ্ঠা';

  @override
  String get iosScannerNote =>
      'iPhone-এ স্ক্যানারটি Apple-এর নিজস্ব নথি ক্যামেরা।';

  @override
  String get iosScannerNote2 =>
      'স্বয়ংক্রিয় ক্যাপচার, প্রান্ত শনাক্তকরণ ও রঙের মোড এতে অন্তর্ভুক্ত।';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'পৃষ্ঠার আকার';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'স্ক্যানের মতোই আকার';

  @override
  String get searchablePdf => 'অনুসন্ধানযোগ্য PDF';

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
      'একটি অদৃশ্য টেক্সট স্তর যোগ করে, যাতে PDF-এ খোঁজা ও টেক্সট কপি করা যায়';

  @override
  String get textRecognition => 'টেক্সট শনাক্তকরণ';

  @override
  String get quality => 'মান';

  @override
  String get qualityBest => 'সেরা: পূর্ণ রেজোলিউশন, ছোট লেখাও পড়ে';

  @override
  String get qualityFast => 'দ্রুত: পৃষ্ঠার ছোট কপি';

  @override
  String get language => 'ভাষা';

  @override
  String get scriptLatin => 'ইংরেজি ও ল্যাটিন লিপির অন্যান্য ভাষা';

  @override
  String get scriptDevanagari => 'হিন্দি, নেপালি, মারাঠি (+ ল্যাটিন)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'চীনা (+ ল্যাটিন)';

  @override
  String get scriptJapanese => 'জাপানি (+ ল্যাটিন)';

  @override
  String get scriptKorean => 'কোরীয় (+ ল্যাটিন)';

  @override
  String get readAsChinese => 'চীনা হিসেবে পড়ুন';

  @override
  String get readAsJapanese => 'জাপানি হিসেবে পড়ুন';

  @override
  String get readAsKorean => 'কোরীয় হিসেবে পড়ুন';

  @override
  String get languageAuto => 'ভাষা স্বয়ংক্রিয়ভাবে শনাক্ত হয়।';

  @override
  String get appearance => 'চেহারা';

  @override
  String get theme => 'থিম';

  @override
  String get themeSystem => 'ফোন অনুযায়ী';

  @override
  String get themeLight => 'হালকা';

  @override
  String get themeDark => 'গাঢ়';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get aboutPromise => 'বিজ্ঞাপন নেই। অ্যাকাউন্ট নেই। ট্র্যাকিং নেই।';

  @override
  String get aboutPromiseBody =>
      'শেয়ার বা এক্সপোর্ট না করা পর্যন্ত স্ক্যানগুলি এই ফোনেই থাকে। অ্যাপ আনইনস্টল করলে সেগুলি মুছে যায়, তাই যা রাখতে চান তা এক্সপোর্ট করে নিন।';

  @override
  String get openSource => 'ওপেন সোর্স (Apache-2.0)';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get opensInBrowser => 'আপনার ব্রাউজারে খোলে';

  @override
  String get aboutTechAndroid =>
      'স্ক্যানিং ও টেক্সট শনাক্তকরণ Google ML Kit দিয়ে (ডিভাইসেই)। PDF মার্জ PDFBox-Android দিয়ে। দেবনাগরী ফন্ট: Noto (OFL)।';

  @override
  String get aboutTechIos =>
      'স্ক্যানিং Apple VisionKit দিয়ে, টেক্সট শনাক্তকরণ Apple Vision দিয়ে (ডিভাইসেই)। দেবনাগরী ফন্ট: Noto (OFL)।';

  @override
  String couldNotOpenUrl(String url) {
    return '$url খোলা যায়নি';
  }

  @override
  String get scanBusinessCard => 'বিজনেস কার্ড স্ক্যান করুন';

  @override
  String get saveAsContact => 'পরিচিতি হিসেবে সেভ করুন';

  @override
  String get saveToContacts => 'পরিচিতিতে সেভ করুন';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'বিজনেস কার্ড';

  @override
  String get contactHint =>
      'ফিল্ডগুলি দেখে নিন, তারপর সেভ করুন। আপনার ফোনের পরিচিতি অ্যাপ সবকিছু পূরণ করা অবস্থায় খুলবে।';

  @override
  String get readingCard => 'কার্ড পড়া হচ্ছে…';

  @override
  String get nothingRecognised =>
      'এই কার্ডে কোনও টেক্সট শনাক্ত করা যায়নি। আপনি তবুও বিবরণ টাইপ করতে পারেন।';

  @override
  String get contactOpened =>
      'পরিচিতি খোলা হয়েছে। রাখতে সেখানে সেভ করুন-এ ট্যাপ করুন।';

  @override
  String couldNotOpenContacts(String error) {
    return 'পরিচিতি খোলা যায়নি: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'কার্ড $stamp';
  }

  @override
  String get fieldCompany => 'কোম্পানি';

  @override
  String get fieldJobTitle => 'পদবি';

  @override
  String get fieldMobile => 'মোবাইল';

  @override
  String get fieldPhone => 'ফোন';

  @override
  String get fieldFax => 'ফ্যাক্স';

  @override
  String get fieldEmail => 'ইমেল';

  @override
  String get fieldWebsite => 'ওয়েবসাইট';

  @override
  String get fieldAddress => 'ঠিকানা';

  @override
  String get fieldCity => 'শহর';

  @override
  String get fieldCountry => 'দেশ';

  @override
  String get fieldNotes => 'নোট';

  @override
  String get drawFirst => 'আগে আপনার স্বাক্ষর আঁকুন।';

  @override
  String get clear => 'পরিষ্কার করুন';

  @override
  String get save => 'সেভ করুন';

  @override
  String get signHint =>
      'বাক্সের ভিতরে আঙুল দিয়ে স্বাক্ষর করুন। বেশি জায়গার জন্য ফোন আড়াআড়ি ধরুন।';

  @override
  String get thin => 'সরু';

  @override
  String get medium => 'মাঝারি';

  @override
  String get thick => 'মোটা';

  @override
  String couldNotReadPage(String error) {
    return 'পৃষ্ঠা পড়া যায়নি: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'স্বাক্ষর করা যায়নি: $error';
  }

  @override
  String get placeSignature => 'স্বাক্ষর বসান';

  @override
  String get apply => 'প্রয়োগ করুন';

  @override
  String get dragPinchHint => 'সরাতে টেনে আনুন। আকার বদলাতে পিঞ্চ করুন।';

  @override
  String get smaller => 'ছোট';

  @override
  String get larger => 'বড়';
}
