// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'സ്കാൻ';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get ok => 'ശരി';

  @override
  String get close => 'അടയ്ക്കുക';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get share => 'പങ്കിടുക';

  @override
  String get copy => 'പകർത്തുക';

  @override
  String get copied => 'പകർത്തി.';

  @override
  String get saved => 'സേവ് ചെയ്തു.';

  @override
  String get name => 'പേര്';

  @override
  String get rename => 'പേര് മാറ്റുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get dismiss => 'അവഗണിക്കുക';

  @override
  String get tryAgain => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get cannotBeUndone => 'ഇത് പഴയപടിയാക്കാനാവില്ല.';

  @override
  String get savingPages => 'പേജുകൾ സേവ് ചെയ്യുന്നു…';

  @override
  String get preparingScanner =>
      'സ്കാനർ തയ്യാറാക്കുന്നു…\nആദ്യ ഉപയോഗം: Google Play സേവനങ്ങൾ ഇത് ഒരിക്കൽ ഡൗൺലോഡ് ചെയ്യും.';

  @override
  String get scannerUnavailable => 'സ്കാനർ ലഭ്യമല്ല.';

  @override
  String scannerUnavailableWith(String error) {
    return 'സ്കാനർ ലഭ്യമല്ല: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'പേജുകൾ സേവ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ഫയൽ പിക്കർ തുറക്കാനായില്ല: $error';
  }

  @override
  String get importingPdf => 'PDF ഇമ്പോർട്ട് ചെയ്യുന്നു…';

  @override
  String get importedPdf => 'ഇമ്പോർട്ട് ചെയ്ത PDF';

  @override
  String couldNotImport(String error) {
    return 'ഇമ്പോർട്ട് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get pickTwoPdfs => 'കുറഞ്ഞത് രണ്ട് PDF ഫയലുകൾ തിരഞ്ഞെടുക്കുക.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF ഫയലുകൾ ലയിപ്പിക്കുന്നു…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ലയിപ്പിച്ചത് $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ലയിപ്പിക്കാനായില്ല: $error';
  }

  @override
  String get saveToFolder => 'ഫോൾഡറിൽ സേവ് ചെയ്യുക';

  @override
  String couldNotSave(String error) {
    return 'സേവ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get mergedDocument => 'ലയിപ്പിച്ച രേഖ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count കൂടി';
  }

  @override
  String get merging => 'ലയിപ്പിക്കുന്നു…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count രേഖകൾ ഇല്ലാതാക്കണോ?',
      one: '1 രേഖ ഇല്ലാതാക്കണോ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF തയ്യാറാക്കുന്നു…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF തയ്യാറാക്കുന്നു $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF തയ്യാറാക്കുന്നു, പേജ് $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF തയ്യാറാക്കാനായില്ല: $error';
  }

  @override
  String get searchDocuments => 'രേഖകൾ തിരയുക';

  @override
  String get closeSearch => 'തിരയൽ അടയ്ക്കുക';

  @override
  String get search => 'തിരയുക';

  @override
  String get importPdfAsPages => 'PDF പേജുകളായി ഇമ്പോർട്ട് ചെയ്യുക';

  @override
  String get mergePdfFiles => 'PDF ഫയലുകൾ ലയിപ്പിക്കുക';

  @override
  String get clearSelection => 'തിരഞ്ഞെടുപ്പ് മായ്ക്കുക';

  @override
  String nSelected(int count) {
    return '$count തിരഞ്ഞെടുത്തു';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count തിരഞ്ഞെടുത്തു · ഇതേ ക്രമത്തിൽ ലയിപ്പിക്കും';
  }

  @override
  String get mergeIntoOne => 'ഒറ്റ രേഖയായി ലയിപ്പിക്കുക';

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
  String get shareAsPdf => 'PDF ആയി പങ്കിടുക';

  @override
  String get selectAll => 'എല്ലാം തിരഞ്ഞെടുക്കുക';

  @override
  String get noScansYet => 'ഇതുവരെ സ്കാനുകളില്ല';

  @override
  String get nothingMatches => 'ഒന്നും പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get emptyHint =>
      'രേഖയുടെ ഫോട്ടോ എടുക്കാൻ സ്കാൻ ടാപ്പ് ചെയ്യുക. എല്ലാം ഈ ഫോണിൽ തന്നെ നിലനിൽക്കും.';

  @override
  String get tryAnotherWord => 'മറ്റൊരു വാക്ക് ശ്രമിക്കുക.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count പേജുകൾ',
      one: '1 പേജ്',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'സ്കാൻ $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO അപ്രതീക്ഷിതമായി അടഞ്ഞു';

  @override
  String get crashBody =>
      'എന്താണ് തെറ്റിയതെന്ന റിപ്പോർട്ട് ഈ ഫോണിൽ മാത്രം സേവ് ചെയ്തിട്ടുണ്ട്. അത് ഡെവലപ്പറുമായി പങ്കിടുന്നത് പ്രശ്നം പരിഹരിക്കാൻ സഹായിക്കും. അതിൽ സാങ്കേതിക വിവരങ്ങൾ മാത്രമേയുള്ളൂ, നിങ്ങളുടെ രേഖകളല്ല.';

  @override
  String get reportCopied => 'റിപ്പോർട്ട് പകർത്തി.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO ക്രാഷ് റിപ്പോർട്ട്';

  @override
  String get pdfSaved => 'PDF സേവ് ചെയ്തു.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF സേവ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get exportPagesAsImages => 'പേജുകൾ ചിത്രങ്ങളായി എക്സ്പോർട്ട് ചെയ്യുക';

  @override
  String get saveToPhotos => 'ഫോട്ടോസിൽ സേവ് ചെയ്യുക';

  @override
  String get savingToPhotos => 'ഫോട്ടോസിൽ സേവ് ചെയ്യുന്നു…';

  @override
  String get photosNeedsAndroid10 =>
      'ഫോട്ടോസിൽ സേവ് ചെയ്യാൻ Android 10 അല്ലെങ്കിൽ പുതിയത് വേണം. പകരം പങ്കിടുക ഉപയോഗിക്കുക.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO-യ്ക്ക് ഫോട്ടോസിൽ ചേർക്കാൻ അനുമതിയില്ല. ക്രമീകരണങ്ങളിൽ അനുവദിക്കുക, അല്ലെങ്കിൽ പങ്കിടുക ഉപയോഗിക്കുക.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ചിത്രങ്ങൾ ഫോട്ടോസിൽ സേവ് ചെയ്തു.',
      one: '1 ചിത്രം ഫോട്ടോസിൽ സേവ് ചെയ്തു.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'എക്സ്പോർട്ട് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get deleteDocumentQuestion => 'ഈ രേഖ ഇല്ലാതാക്കണോ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count പേജുകൾ ഇല്ലാതാക്കപ്പെടും. ഇത് പഴയപടിയാക്കാനാവില്ല.',
      one: '1 പേജ് ഇല്ലാതാക്കപ്പെടും. ഇത് പഴയപടിയാക്കാനാവില്ല.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ടെക്സ്റ്റ് (OCR)';

  @override
  String get sharePdf => 'PDF പങ്കിടുക';

  @override
  String get savePdfToFolder => 'PDF ഫോൾഡറിൽ സേവ് ചെയ്യുക';

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
  String get exportAsImages => 'JPEG / PNG ആയി എക്സ്പോർട്ട് ചെയ്യുക';

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
  String get deleteDocument => 'രേഖ ഇല്ലാതാക്കുക';

  @override
  String get noPages => 'പേജുകളില്ല. പേജുകൾ ചേർക്കുക ടാപ്പ് ചെയ്യുക.';

  @override
  String get addPages => 'പേജുകൾ ചേർക്കുക';

  @override
  String get holdToReorder => 'ക്രമം മാറ്റാൻ പേജ് അമർത്തിപ്പിടിക്കുക';

  @override
  String get savePdfDialogTitle => 'PDF സേവ് ചെയ്യുക';

  @override
  String get saveDialogTitle => 'സേവ് ചെയ്യുക';

  @override
  String couldNotRotate(String error) {
    return 'തിരിക്കാനായില്ല: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'പങ്കിടാനായില്ല: $error';
  }

  @override
  String get noTextOnPage => 'ഈ പേജിൽ ടെക്സ്റ്റ് കണ്ടെത്തിയില്ല.';

  @override
  String pageNText(int n) {
    return 'പേജ് $n ടെക്സ്റ്റ്';
  }

  @override
  String deletePageQuestion(int n) {
    return 'പേജ് $n ഇല്ലാതാക്കണോ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total-ൽ പേജ് $n';
  }

  @override
  String get rotateLeft => 'ഇടത്തേക്ക് തിരിക്കുക';

  @override
  String get rotateRight => 'വലത്തേക്ക് തിരിക്കുക';

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
  String get undo => 'പഴയപടിയാക്കുക';

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
  String get enhanceWhiteboard => 'Whiteboard — bring the marker back';

  @override
  String get enhanceBleed => 'Remove show-through from the back';

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
  String get sign => 'ഒപ്പ്';

  @override
  String get copyText => 'ടെക്സ്റ്റ് പകർത്തുക';

  @override
  String get shareImage => 'ചിത്രം പങ്കിടുക';

  @override
  String get deletePage => 'പേജ് ഇല്ലാതാക്കുക';

  @override
  String get signed => 'ഒപ്പിട്ടു.';

  @override
  String signPageN(int n) {
    return 'പേജ് $n-ൽ ഒപ്പിടുക';
  }

  @override
  String get deleteThisSignature => 'ഈ ഒപ്പ് ഇല്ലാതാക്കുക';

  @override
  String get newSignature => 'പുതിയ ഒപ്പ്';

  @override
  String readingPage(int n, int total) {
    return 'പേജ് $n / $total വായിക്കുന്നു';
  }

  @override
  String get ocrFailed => 'ടെക്സ്റ്റ് തിരിച്ചറിയൽ പരാജയപ്പെട്ടു.';

  @override
  String ocrFailedWith(String error) {
    return 'ടെക്സ്റ്റ് തിരിച്ചറിയൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get textSaved => 'ടെക്സ്റ്റ് സേവ് ചെയ്തു.';

  @override
  String get text => 'ടെക്സ്റ്റ്';

  @override
  String get copyAll => 'എല്ലാം പകർത്തുക';

  @override
  String get shareText => 'ടെക്സ്റ്റ് പങ്കിടുക';

  @override
  String get saveAsTxt => '.txt ആയി സേവ് ചെയ്യുക';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'വീണ്ടും വായിക്കുക';

  @override
  String get readAsLatin => 'ഇംഗ്ലീഷ് / ലാറ്റിൻ ആയി വായിക്കുക';

  @override
  String get readAsDevanagari => 'ഹിന്ദി / നേപ്പാളി ആയി വായിക്കുക';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android-ൽ ടെക്സ്റ്റ് മോഡൽ Google Play സേവനങ്ങൾ ഒരിക്കൽ ഡൗൺലോഡ് ചെയ്യും. ഇത് ആദ്യ ഉപയോഗമാണെങ്കിൽ ഒരു മിനിറ്റ് കാത്തിരുന്ന് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get noTextFound => 'ടെക്സ്റ്റ് കണ്ടെത്തിയില്ല.';

  @override
  String pageSeparator(int n) {
    return '--- പേജ് $n ---';
  }

  @override
  String get scanner => 'സ്കാനർ';

  @override
  String get scanMode => 'സ്കാൻ മോഡ്';

  @override
  String get modeFull => 'പൂർണ്ണം: ഫിൽട്ടറുകൾ + കറകളും വിരലുകളും നീക്കൽ';

  @override
  String get modeFilter => 'ഫിൽട്ടറുകൾ മാത്രം';

  @override
  String get modeBase => 'അടിസ്ഥാനം: ക്രോപ്പും തിരിക്കലും മാത്രം';

  @override
  String get allowGallery => 'ഗാലറിയിൽ നിന്ന് ഇമ്പോർട്ട് അനുവദിക്കുക';

  @override
  String get allowGalleryHint => 'സ്കാനറിനുള്ളിൽ ഗാലറി ബട്ടൺ കാണിക്കുന്നു';

  @override
  String get pagesPerScan => 'ഒരു സ്കാനിലെ പേജുകൾ';

  @override
  String get iosScannerNote =>
      'iPhone-ൽ സ്കാനർ Apple-ന്റെ സ്വന്തം ഡോക്യുമെന്റ് ക്യാമറയാണ്.';

  @override
  String get iosScannerNote2 =>
      'ഓട്ടോ ക്യാപ്ചർ, അരികുകൾ തിരിച്ചറിയൽ, കളർ മോഡുകൾ എന്നിവ അതിൽ ഉൾപ്പെടുന്നു.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'പേജ് വലുപ്പം';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'സ്കാനിന്റെ അതേ ആകൃതി';

  @override
  String get searchablePdf => 'തിരയാവുന്ന PDF';

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
      'PDF-ൽ തിരയാനും ടെക്സ്റ്റ് പകർത്താനും അദൃശ്യമായ ടെക്സ്റ്റ് പാളി ചേർക്കുന്നു';

  @override
  String get textRecognition => 'ടെക്സ്റ്റ് തിരിച്ചറിയൽ';

  @override
  String get quality => 'നിലവാരം';

  @override
  String get qualityBest =>
      'മികച്ചത്: പൂർണ്ണ റെസല്യൂഷൻ, ചെറിയ അക്ഷരങ്ങളും വായിക്കും';

  @override
  String get qualityFast => 'വേഗം: പേജിന്റെ ചെറിയ പകർപ്പ്';

  @override
  String get language => 'ഭാഷ';

  @override
  String get scriptLatin => 'ഇംഗ്ലീഷും മറ്റ് ലാറ്റിൻ ലിപി ഭാഷകളും';

  @override
  String get scriptDevanagari => 'ഹിന്ദി, നേപ്പാളി, മറാഠി (+ ലാറ്റിൻ)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'ചൈനീസ് (+ ലാറ്റിൻ)';

  @override
  String get scriptJapanese => 'ജാപ്പനീസ് (+ ലാറ്റിൻ)';

  @override
  String get scriptKorean => 'കൊറിയൻ (+ ലാറ്റിൻ)';

  @override
  String get readAsChinese => 'ചൈനീസ് ആയി വായിക്കുക';

  @override
  String get readAsJapanese => 'ജാപ്പനീസ് ആയി വായിക്കുക';

  @override
  String get readAsKorean => 'കൊറിയൻ ആയി വായിക്കുക';

  @override
  String get languageAuto => 'ഭാഷ സ്വയമേവ തിരിച്ചറിയും.';

  @override
  String get appearance => 'രൂപം';

  @override
  String get theme => 'തീം';

  @override
  String get themeSystem => 'ഫോൺ അനുസരിച്ച്';

  @override
  String get themeLight => 'ലൈറ്റ്';

  @override
  String get themeDark => 'ഡാർക്ക്';

  @override
  String get about => 'വിവരം';

  @override
  String get aboutPromise => 'പരസ്യങ്ങളില്ല. അക്കൗണ്ടില്ല. ട്രാക്കിംഗില്ല.';

  @override
  String get aboutPromiseBody =>
      'പങ്കിടുകയോ എക്സ്പോർട്ട് ചെയ്യുകയോ ചെയ്യുന്നതുവരെ സ്കാനുകൾ ഈ ഫോണിൽ തന്നെ നിലനിൽക്കും. ആപ്പ് അൺഇൻസ്റ്റാൾ ചെയ്താൽ അവ ഇല്ലാതാകും, അതിനാൽ സൂക്ഷിക്കേണ്ടവ എക്സ്പോർട്ട് ചെയ്യുക.';

  @override
  String get openSource => 'ഓപ്പൺ സോഴ്സ് (Apache-2.0)';

  @override
  String get privacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get opensInBrowser => 'നിങ്ങളുടെ ബ്രൗസറിൽ തുറക്കും';

  @override
  String get aboutTechAndroid =>
      'സ്കാനിംഗും ടെക്സ്റ്റ് തിരിച്ചറിയലും Google ML Kit വഴി (ഉപകരണത്തിൽ തന്നെ). PDF ലയനം PDFBox-Android വഴി. ദേവനാഗരി ഫോണ്ട്: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'സ്കാനിംഗ് Apple VisionKit വഴി, ടെക്സ്റ്റ് തിരിച്ചറിയൽ Apple Vision വഴി (ഉപകരണത്തിൽ തന്നെ). ദേവനാഗരി ഫോണ്ട്: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url തുറക്കാനായില്ല';
  }

  @override
  String get scanBusinessCard => 'ബിസിനസ് കാർഡ് സ്കാൻ ചെയ്യുക';

  @override
  String get saveAsContact => 'കോൺടാക്റ്റായി സേവ് ചെയ്യുക';

  @override
  String get saveToContacts => 'കോൺടാക്റ്റുകളിൽ സേവ് ചെയ്യുക';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'ബിസിനസ് കാർഡ്';

  @override
  String get contactHint =>
      'ഫീൽഡുകൾ പരിശോധിച്ച ശേഷം സേവ് ചെയ്യുക. നിങ്ങളുടെ ഫോണിലെ കോൺടാക്റ്റുകൾ ആപ്പ് എല്ലാം പൂരിപ്പിച്ച നിലയിൽ തുറക്കും.';

  @override
  String get readingCard => 'കാർഡ് വായിക്കുന്നു…';

  @override
  String get nothingRecognised =>
      'ഈ കാർഡിൽ ടെക്സ്റ്റ് ഒന്നും തിരിച്ചറിഞ്ഞില്ല. എന്നാലും വിശദാംശങ്ങൾ ടൈപ്പ് ചെയ്യാം.';

  @override
  String get contactOpened =>
      'കോൺടാക്റ്റുകൾ തുറന്നു. സൂക്ഷിക്കാൻ അവിടെ സേവ് ചെയ്യുക ടാപ്പ് ചെയ്യുക.';

  @override
  String couldNotOpenContacts(String error) {
    return 'കോൺടാക്റ്റുകൾ തുറക്കാനായില്ല: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'കാർഡ് $stamp';
  }

  @override
  String get fieldCompany => 'കമ്പനി';

  @override
  String get fieldJobTitle => 'തസ്തിക';

  @override
  String get fieldMobile => 'മൊബൈൽ';

  @override
  String get fieldPhone => 'ഫോൺ';

  @override
  String get fieldFax => 'ഫാക്സ്';

  @override
  String get fieldEmail => 'ഇമെയിൽ';

  @override
  String get fieldWebsite => 'വെബ്‌സൈറ്റ്';

  @override
  String get fieldAddress => 'വിലാസം';

  @override
  String get fieldCity => 'നഗരം';

  @override
  String get fieldCountry => 'രാജ്യം';

  @override
  String get fieldNotes => 'കുറിപ്പുകൾ';

  @override
  String get drawFirst => 'ആദ്യം നിങ്ങളുടെ ഒപ്പ് വരയ്ക്കുക.';

  @override
  String get clear => 'മായ്ക്കുക';

  @override
  String get save => 'സേവ് ചെയ്യുക';

  @override
  String get signHint =>
      'ബോക്സിനുള്ളിൽ വിരൽ കൊണ്ട് ഒപ്പിടുക. കൂടുതൽ സ്ഥലത്തിനായി ഫോൺ വശത്തേക്ക് തിരിക്കുക.';

  @override
  String get thin => 'നേർത്തത്';

  @override
  String get medium => 'ഇടത്തരം';

  @override
  String get thick => 'കട്ടിയുള്ളത്';

  @override
  String couldNotReadPage(String error) {
    return 'പേജ് വായിക്കാനായില്ല: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'ഒപ്പിടാനായില്ല: $error';
  }

  @override
  String get placeSignature => 'ഒപ്പ് വയ്ക്കുക';

  @override
  String get apply => 'പ്രയോഗിക്കുക';

  @override
  String get dragPinchHint =>
      'നീക്കാൻ വലിക്കുക. വലുപ്പം മാറ്റാൻ പിഞ്ച് ചെയ്യുക.';

  @override
  String get smaller => 'ചെറുത്';

  @override
  String get larger => 'വലുത്';
}
