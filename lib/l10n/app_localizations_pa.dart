// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'ਸਕੈਨ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get share => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get copy => 'ਕਾਪੀ ਕਰੋ';

  @override
  String get copied => 'ਕਾਪੀ ਹੋ ਗਿਆ।';

  @override
  String get saved => 'ਸੇਵ ਹੋ ਗਿਆ।';

  @override
  String get name => 'ਨਾਮ';

  @override
  String get rename => 'ਨਾਮ ਬਦਲੋ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get dismiss => 'ਖਾਰਜ ਕਰੋ';

  @override
  String get tryAgain => 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get cannotBeUndone => 'ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਦਾ।';

  @override
  String get savingPages => 'ਪੰਨੇ ਸੇਵ ਹੋ ਰਹੇ ਹਨ…';

  @override
  String get preparingScanner =>
      'ਸਕੈਨਰ ਤਿਆਰ ਹੋ ਰਿਹਾ ਹੈ…\nਪਹਿਲੀ ਵਾਰ: Google Play ਸੇਵਾਵਾਂ ਇਸਨੂੰ ਇੱਕ ਵਾਰ ਡਾਊਨਲੋਡ ਕਰਦੀਆਂ ਹਨ।';

  @override
  String get scannerUnavailable => 'ਸਕੈਨਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String scannerUnavailableWith(String error) {
    return 'ਸਕੈਨਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'ਪੰਨੇ ਸੇਵ ਨਹੀਂ ਹੋ ਸਕੇ: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ਫ਼ਾਈਲ ਚੋਣਕਾਰ ਨਹੀਂ ਖੁੱਲ੍ਹ ਸਕਿਆ: $error';
  }

  @override
  String get importingPdf => 'PDF ਇੰਪੋਰਟ ਹੋ ਰਹੀ ਹੈ…';

  @override
  String get importedPdf => 'ਇੰਪੋਰਟ ਕੀਤੀ PDF';

  @override
  String couldNotImport(String error) {
    return 'ਇੰਪੋਰਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get pickTwoPdfs => 'ਘੱਟੋ-ਘੱਟ ਦੋ PDF ਫ਼ਾਈਲਾਂ ਚੁਣੋ।';

  @override
  String mergingPdfs(int count) {
    return '$count PDF ਫ਼ਾਈਲਾਂ ਮਰਜ ਹੋ ਰਹੀਆਂ ਹਨ…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ਮਰਜ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ਮਰਜ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get saveToFolder => 'ਫੋਲਡਰ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String couldNotSave(String error) {
    return 'ਸੇਵ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get mergedDocument => 'ਮਰਜ ਕੀਤਾ ਦਸਤਾਵੇਜ਼';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count ਹੋਰ';
  }

  @override
  String get merging => 'ਮਰਜ ਹੋ ਰਿਹਾ ਹੈ…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਦਸਤਾਵੇਜ਼ ਮਿਟਾਉਣੇ ਹਨ?',
      one: '1 ਦਸਤਾਵੇਜ਼ ਮਿਟਾਉਣਾ ਹੈ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF ਬਣ ਰਹੀ ਹੈ…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF ਬਣ ਰਹੀ ਹੈ $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF ਬਣ ਰਹੀ ਹੈ, ਪੰਨਾ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF ਨਹੀਂ ਬਣ ਸਕੀ: $error';
  }

  @override
  String get searchDocuments => 'ਦਸਤਾਵੇਜ਼ ਖੋਜੋ';

  @override
  String get closeSearch => 'ਖੋਜ ਬੰਦ ਕਰੋ';

  @override
  String get search => 'ਖੋਜੋ';

  @override
  String get importPdfAsPages => 'PDF ਨੂੰ ਪੰਨਿਆਂ ਵਜੋਂ ਇੰਪੋਰਟ ਕਰੋ';

  @override
  String get mergePdfFiles => 'PDF ਫ਼ਾਈਲਾਂ ਮਰਜ ਕਰੋ';

  @override
  String get clearSelection => 'ਚੋਣ ਹਟਾਓ';

  @override
  String nSelected(int count) {
    return '$count ਚੁਣੇ ਗਏ';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ਚੁਣੇ ਗਏ · ਇਸੇ ਕ੍ਰਮ ਵਿੱਚ ਮਰਜ ਹੋਣਗੇ';
  }

  @override
  String get mergeIntoOne => 'ਇੱਕ ਦਸਤਾਵੇਜ਼ ਵਿੱਚ ਮਰਜ ਕਰੋ';

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
  String get shareAsPdf => 'PDF ਵਜੋਂ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get selectAll => 'ਸਭ ਚੁਣੋ';

  @override
  String get noScansYet => 'ਹਾਲੇ ਕੋਈ ਸਕੈਨ ਨਹੀਂ';

  @override
  String get nothingMatches => 'ਕੁਝ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get emptyHint =>
      'ਦਸਤਾਵੇਜ਼ ਦੀ ਫੋਟੋ ਲੈਣ ਲਈ ਸਕੈਨ \'ਤੇ ਟੈਪ ਕਰੋ। ਸਭ ਕੁਝ ਇਸੇ ਫ਼ੋਨ \'ਤੇ ਰਹਿੰਦਾ ਹੈ।';

  @override
  String get tryAnotherWord => 'ਕੋਈ ਹੋਰ ਸ਼ਬਦ ਅਜ਼ਮਾਓ।';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਪੰਨੇ',
      one: '1 ਪੰਨਾ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'ਸਕੈਨ $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ਅਚਾਨਕ ਬੰਦ ਹੋ ਗਿਆ';

  @override
  String get crashBody =>
      'ਕੀ ਗ਼ਲਤ ਹੋਇਆ, ਇਸਦੀ ਰਿਪੋਰਟ ਸਿਰਫ਼ ਇਸੇ ਫ਼ੋਨ \'ਤੇ ਸੇਵ ਕੀਤੀ ਗਈ ਹੈ। ਇਸਨੂੰ ਡਿਵੈਲਪਰ ਨਾਲ ਸਾਂਝਾ ਕਰਨ ਨਾਲ ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ ਵਿੱਚ ਮਦਦ ਮਿਲਦੀ ਹੈ। ਇਸ ਵਿੱਚ ਤਕਨੀਕੀ ਵੇਰਵੇ ਹਨ, ਤੁਹਾਡੇ ਦਸਤਾਵੇਜ਼ ਨਹੀਂ।';

  @override
  String get reportCopied => 'ਰਿਪੋਰਟ ਕਾਪੀ ਹੋ ਗਈ।';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO ਕਰੈਸ਼ ਰਿਪੋਰਟ';

  @override
  String get pdfSaved => 'PDF ਸੇਵ ਹੋ ਗਈ।';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ਸੇਵ ਨਹੀਂ ਹੋ ਸਕੀ: $error';
  }

  @override
  String get exportPagesAsImages => 'ਪੰਨਿਆਂ ਨੂੰ ਤਸਵੀਰਾਂ ਵਜੋਂ ਐਕਸਪੋਰਟ ਕਰੋ';

  @override
  String get saveToPhotos => 'ਫੋਟੋਆਂ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get savingToPhotos => 'ਫੋਟੋਆਂ ਵਿੱਚ ਸੇਵ ਹੋ ਰਿਹਾ ਹੈ…';

  @override
  String get photosNeedsAndroid10 =>
      'ਫੋਟੋਆਂ ਵਿੱਚ ਸੇਵ ਕਰਨ ਲਈ Android 10 ਜਾਂ ਨਵਾਂ ਚਾਹੀਦਾ ਹੈ। ਇਸਦੀ ਬਜਾਏ ਸਾਂਝਾ ਕਰੋ ਵਰਤੋ।';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ਨੂੰ ਫੋਟੋਆਂ ਵਿੱਚ ਜੋੜਨ ਦੀ ਇਜਾਜ਼ਤ ਨਹੀਂ ਹੈ। ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਜਾਜ਼ਤ ਦਿਓ, ਜਾਂ ਸਾਂਝਾ ਕਰੋ ਵਰਤੋ।';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਤਸਵੀਰਾਂ ਫੋਟੋਆਂ ਵਿੱਚ ਸੇਵ ਹੋਈਆਂ।',
      one: '1 ਤਸਵੀਰ ਫੋਟੋਆਂ ਵਿੱਚ ਸੇਵ ਹੋਈ।',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'ਐਕਸਪੋਰਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get deleteDocumentQuestion => 'ਇਹ ਦਸਤਾਵੇਜ਼ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਪੰਨੇ ਮਿਟਾ ਦਿੱਤੇ ਜਾਣਗੇ। ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਦਾ।',
      one: '1 ਪੰਨਾ ਮਿਟਾ ਦਿੱਤਾ ਜਾਵੇਗਾ। ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਦਾ।',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ਟੈਕਸਟ (OCR)';

  @override
  String get sharePdf => 'PDF ਸਾਂਝੀ ਕਰੋ';

  @override
  String get savePdfToFolder => 'PDF ਫੋਲਡਰ ਵਿੱਚ ਸੇਵ ਕਰੋ';

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
  String get exportAsImages => 'JPEG / PNG ਵਜੋਂ ਐਕਸਪੋਰਟ ਕਰੋ';

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
  String get deleteDocument => 'ਦਸਤਾਵੇਜ਼ ਮਿਟਾਓ';

  @override
  String get noPages => 'ਕੋਈ ਪੰਨਾ ਨਹੀਂ। ਪੰਨੇ ਜੋੜੋ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get addPages => 'ਪੰਨੇ ਜੋੜੋ';

  @override
  String get holdToReorder => 'ਕ੍ਰਮ ਬਦਲਣ ਲਈ ਪੰਨੇ ਨੂੰ ਦਬਾ ਕੇ ਰੱਖੋ';

  @override
  String get savePdfDialogTitle => 'PDF ਸੇਵ ਕਰੋ';

  @override
  String get saveDialogTitle => 'ਸੇਵ ਕਰੋ';

  @override
  String couldNotRotate(String error) {
    return 'ਘੁਮਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'ਸਾਂਝਾ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get noTextOnPage => 'ਇਸ ਪੰਨੇ \'ਤੇ ਕੋਈ ਟੈਕਸਟ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String pageNText(int n) {
    return 'ਪੰਨਾ $n ਦਾ ਟੈਕਸਟ';
  }

  @override
  String deletePageQuestion(int n) {
    return 'ਪੰਨਾ $n ਮਿਟਾਉਣਾ ਹੈ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total ਵਿੱਚੋਂ ਪੰਨਾ $n';
  }

  @override
  String get rotateLeft => 'ਖੱਬੇ ਘੁਮਾਓ';

  @override
  String get rotateRight => 'ਸੱਜੇ ਘੁਮਾਓ';

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
  String get undo => 'ਵਾਪਸ ਲਓ';

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
  String get sign => 'ਦਸਤਖ਼ਤ';

  @override
  String get copyText => 'ਟੈਕਸਟ ਕਾਪੀ ਕਰੋ';

  @override
  String get shareImage => 'ਤਸਵੀਰ ਸਾਂਝੀ ਕਰੋ';

  @override
  String get deletePage => 'ਪੰਨਾ ਮਿਟਾਓ';

  @override
  String get signed => 'ਦਸਤਖ਼ਤ ਹੋ ਗਏ।';

  @override
  String signPageN(int n) {
    return 'ਪੰਨਾ $n \'ਤੇ ਦਸਤਖ਼ਤ ਕਰੋ';
  }

  @override
  String get deleteThisSignature => 'ਇਹ ਦਸਤਖ਼ਤ ਮਿਟਾਓ';

  @override
  String get newSignature => 'ਨਵੇਂ ਦਸਤਖ਼ਤ';

  @override
  String readingPage(int n, int total) {
    return 'ਪੰਨਾ $n / $total ਪੜ੍ਹਿਆ ਜਾ ਰਿਹਾ ਹੈ';
  }

  @override
  String get ocrFailed => 'ਟੈਕਸਟ ਪਛਾਣ ਅਸਫਲ ਰਹੀ।';

  @override
  String ocrFailedWith(String error) {
    return 'ਟੈਕਸਟ ਪਛਾਣ ਅਸਫਲ ਰਹੀ: $error';
  }

  @override
  String get textSaved => 'ਟੈਕਸਟ ਸੇਵ ਹੋ ਗਿਆ।';

  @override
  String get text => 'ਟੈਕਸਟ';

  @override
  String get copyAll => 'ਸਭ ਕਾਪੀ ਕਰੋ';

  @override
  String get shareText => 'ਟੈਕਸਟ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get saveAsTxt => '.txt ਵਜੋਂ ਸੇਵ ਕਰੋ';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'ਮੁੜ ਪੜ੍ਹੋ';

  @override
  String get readAsLatin => 'ਅੰਗਰੇਜ਼ੀ / ਲਾਤੀਨੀ ਵਜੋਂ ਪੜ੍ਹੋ';

  @override
  String get readAsDevanagari => 'ਹਿੰਦੀ / ਨੇਪਾਲੀ ਵਜੋਂ ਪੜ੍ਹੋ';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android \'ਤੇ ਟੈਕਸਟ ਮਾਡਲ Google Play ਸੇਵਾਵਾਂ ਇੱਕ ਵਾਰ ਡਾਊਨਲੋਡ ਕਰਦੀਆਂ ਹਨ। ਜੇ ਇਹ ਪਹਿਲੀ ਵਰਤੋਂ ਹੈ, ਤਾਂ ਇੱਕ ਮਿੰਟ ਉਡੀਕੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get noTextFound => 'ਕੋਈ ਟੈਕਸਟ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String pageSeparator(int n) {
    return '--- ਪੰਨਾ $n ---';
  }

  @override
  String get scanner => 'ਸਕੈਨਰ';

  @override
  String get scanMode => 'ਸਕੈਨ ਮੋਡ';

  @override
  String get modeFull => 'ਪੂਰਾ: ਫਿਲਟਰ + ਧੱਬੇ ਅਤੇ ਉਂਗਲਾਂ ਸਾਫ਼ ਕਰੋ';

  @override
  String get modeFilter => 'ਸਿਰਫ਼ ਫਿਲਟਰ';

  @override
  String get modeBase => 'ਬੁਨਿਆਦੀ: ਸਿਰਫ਼ ਕ੍ਰੌਪ ਅਤੇ ਘੁਮਾਉਣਾ';

  @override
  String get allowGallery => 'ਗੈਲਰੀ ਤੋਂ ਇੰਪੋਰਟ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get allowGalleryHint => 'ਸਕੈਨਰ ਦੇ ਅੰਦਰ ਗੈਲਰੀ ਬਟਨ ਦਿਖਾਉਂਦਾ ਹੈ';

  @override
  String get pagesPerScan => 'ਪ੍ਰਤੀ ਸਕੈਨ ਪੰਨੇ';

  @override
  String get iosScannerNote =>
      'iPhone \'ਤੇ ਸਕੈਨਰ Apple ਦਾ ਆਪਣਾ ਦਸਤਾਵੇਜ਼ ਕੈਮਰਾ ਹੈ।';

  @override
  String get iosScannerNote2 =>
      'ਆਟੋ ਕੈਪਚਰ, ਕਿਨਾਰਿਆਂ ਦੀ ਪਛਾਣ ਅਤੇ ਰੰਗ ਮੋਡ ਇਸ ਵਿੱਚ ਪਹਿਲਾਂ ਹੀ ਹਨ।';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'ਪੰਨੇ ਦਾ ਆਕਾਰ';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'ਸਕੈਨ ਵਰਗਾ ਹੀ ਆਕਾਰ';

  @override
  String get searchablePdf => 'ਖੋਜਣਯੋਗ PDF';

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
      'ਇੱਕ ਅਦਿੱਖ ਟੈਕਸਟ ਪਰਤ ਜੋੜਦਾ ਹੈ ਤਾਂ ਜੋ PDF ਵਿੱਚ ਖੋਜ ਅਤੇ ਟੈਕਸਟ ਕਾਪੀ ਕੀਤਾ ਜਾ ਸਕੇ';

  @override
  String get textRecognition => 'ਟੈਕਸਟ ਪਛਾਣ';

  @override
  String get quality => 'ਗੁਣਵੱਤਾ';

  @override
  String get qualityBest =>
      'ਸਭ ਤੋਂ ਵਧੀਆ: ਪੂਰਾ ਰੈਜ਼ੋਲਿਊਸ਼ਨ, ਬਾਰੀਕ ਲਿਖਤ ਵੀ ਪੜ੍ਹਦਾ ਹੈ';

  @override
  String get qualityFast => 'ਤੇਜ਼: ਪੰਨੇ ਦੀ ਛੋਟੀ ਕਾਪੀ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get scriptLatin => 'ਅੰਗਰੇਜ਼ੀ ਅਤੇ ਲਾਤੀਨੀ ਲਿਪੀ ਦੀਆਂ ਹੋਰ ਭਾਸ਼ਾਵਾਂ';

  @override
  String get scriptDevanagari => 'ਹਿੰਦੀ, ਨੇਪਾਲੀ, ਮਰਾਠੀ (+ ਲਾਤੀਨੀ)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'ਚੀਨੀ (+ ਲਾਤੀਨੀ)';

  @override
  String get scriptJapanese => 'ਜਾਪਾਨੀ (+ ਲਾਤੀਨੀ)';

  @override
  String get scriptKorean => 'ਕੋਰੀਆਈ (+ ਲਾਤੀਨੀ)';

  @override
  String get readAsChinese => 'ਚੀਨੀ ਵਜੋਂ ਪੜ੍ਹੋ';

  @override
  String get readAsJapanese => 'ਜਾਪਾਨੀ ਵਜੋਂ ਪੜ੍ਹੋ';

  @override
  String get readAsKorean => 'ਕੋਰੀਆਈ ਵਜੋਂ ਪੜ੍ਹੋ';

  @override
  String get languageAuto => 'ਭਾਸ਼ਾ ਆਪਣੇ ਆਪ ਪਛਾਣੀ ਜਾਂਦੀ ਹੈ।';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get themeSystem => 'ਫ਼ੋਨ ਮੁਤਾਬਕ';

  @override
  String get themeLight => 'ਹਲਕਾ';

  @override
  String get themeDark => 'ਗੂੜ੍ਹਾ';

  @override
  String get about => 'ਬਾਰੇ';

  @override
  String get aboutPromise => 'ਨਾ ਇਸ਼ਤਿਹਾਰ। ਨਾ ਖਾਤਾ। ਨਾ ਟਰੈਕਿੰਗ।';

  @override
  String get aboutPromiseBody =>
      'ਸਕੈਨ ਇਸੇ ਫ਼ੋਨ \'ਤੇ ਰਹਿੰਦੇ ਹਨ ਜਦੋਂ ਤੱਕ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਸਾਂਝਾ ਜਾਂ ਐਕਸਪੋਰਟ ਨਹੀਂ ਕਰਦੇ। ਐਪ ਅਣਇੰਸਟਾਲ ਕਰਨ ਨਾਲ ਉਹ ਮਿਟ ਜਾਂਦੇ ਹਨ, ਇਸ ਲਈ ਜੋ ਰੱਖਣਾ ਹੈ ਉਸਨੂੰ ਐਕਸਪੋਰਟ ਕਰ ਲਓ।';

  @override
  String get openSource => 'ਓਪਨ ਸੋਰਸ (Apache-2.0)';

  @override
  String get privacyPolicy => 'ਪਰਦੇਦਾਰੀ ਨੀਤੀ';

  @override
  String get opensInBrowser => 'ਤੁਹਾਡੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁੱਲ੍ਹਦਾ ਹੈ';

  @override
  String get aboutTechAndroid =>
      'ਸਕੈਨਿੰਗ ਅਤੇ ਟੈਕਸਟ ਪਛਾਣ Google ML Kit ਰਾਹੀਂ (ਡਿਵਾਈਸ \'ਤੇ)। PDF ਮਰਜ PDFBox-Android ਰਾਹੀਂ। ਦੇਵਨਾਗਰੀ ਫੌਂਟ: Noto (OFL)।';

  @override
  String get aboutTechIos =>
      'ਸਕੈਨਿੰਗ Apple VisionKit ਰਾਹੀਂ, ਟੈਕਸਟ ਪਛਾਣ Apple Vision ਰਾਹੀਂ (ਡਿਵਾਈਸ \'ਤੇ)। ਦੇਵਨਾਗਰੀ ਫੌਂਟ: Noto (OFL)।';

  @override
  String couldNotOpenUrl(String url) {
    return '$url ਨਹੀਂ ਖੁੱਲ੍ਹ ਸਕਿਆ';
  }

  @override
  String get scanBusinessCard => 'ਬਿਜ਼ਨਸ ਕਾਰਡ ਸਕੈਨ ਕਰੋ';

  @override
  String get saveAsContact => 'ਸੰਪਰਕ ਵਜੋਂ ਸੇਵ ਕਰੋ';

  @override
  String get saveToContacts => 'ਸੰਪਰਕਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'ਬਿਜ਼ਨਸ ਕਾਰਡ';

  @override
  String get contactHint =>
      'ਖੇਤਰਾਂ ਦੀ ਜਾਂਚ ਕਰੋ, ਫਿਰ ਸੇਵ ਕਰੋ। ਤੁਹਾਡੇ ਫ਼ੋਨ ਦੀ ਸੰਪਰਕ ਐਪ ਸਭ ਕੁਝ ਭਰਿਆ ਹੋਇਆ ਖੁੱਲ੍ਹੇਗੀ।';

  @override
  String get readingCard => 'ਕਾਰਡ ਪੜ੍ਹਿਆ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get nothingRecognised =>
      'ਇਸ ਕਾਰਡ \'ਤੇ ਕੋਈ ਟੈਕਸਟ ਨਹੀਂ ਪਛਾਣਿਆ ਗਿਆ। ਤੁਸੀਂ ਫਿਰ ਵੀ ਵੇਰਵੇ ਟਾਈਪ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get contactOpened =>
      'ਸੰਪਰਕ ਖੁੱਲ੍ਹ ਗਿਆ। ਰੱਖਣ ਲਈ ਉੱਥੇ ਸੇਵ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String couldNotOpenContacts(String error) {
    return 'ਸੰਪਰਕ ਨਹੀਂ ਖੁੱਲ੍ਹ ਸਕਿਆ: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'ਕਾਰਡ $stamp';
  }

  @override
  String get fieldCompany => 'ਕੰਪਨੀ';

  @override
  String get fieldJobTitle => 'ਅਹੁਦਾ';

  @override
  String get fieldMobile => 'ਮੋਬਾਈਲ';

  @override
  String get fieldPhone => 'ਫ਼ੋਨ';

  @override
  String get fieldFax => 'ਫ਼ੈਕਸ';

  @override
  String get fieldEmail => 'ਈਮੇਲ';

  @override
  String get fieldWebsite => 'ਵੈੱਬਸਾਈਟ';

  @override
  String get fieldAddress => 'ਪਤਾ';

  @override
  String get fieldCity => 'ਸ਼ਹਿਰ';

  @override
  String get fieldCountry => 'ਦੇਸ਼';

  @override
  String get fieldNotes => 'ਨੋਟ';

  @override
  String get drawFirst => 'ਪਹਿਲਾਂ ਆਪਣੇ ਦਸਤਖ਼ਤ ਬਣਾਓ।';

  @override
  String get clear => 'ਸਾਫ਼ ਕਰੋ';

  @override
  String get save => 'ਸੇਵ ਕਰੋ';

  @override
  String get signHint =>
      'ਡੱਬੇ ਵਿੱਚ ਉਂਗਲ ਨਾਲ ਦਸਤਖ਼ਤ ਕਰੋ। ਵੱਧ ਥਾਂ ਲਈ ਫ਼ੋਨ ਨੂੰ ਲੇਟਵਾਂ ਕਰੋ।';

  @override
  String get thin => 'ਪਤਲਾ';

  @override
  String get medium => 'ਦਰਮਿਆਨਾ';

  @override
  String get thick => 'ਮੋਟਾ';

  @override
  String couldNotReadPage(String error) {
    return 'ਪੰਨਾ ਪੜ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'ਦਸਤਖ਼ਤ ਨਹੀਂ ਹੋ ਸਕੇ: $error';
  }

  @override
  String get placeSignature => 'ਦਸਤਖ਼ਤ ਰੱਖੋ';

  @override
  String get apply => 'ਲਾਗੂ ਕਰੋ';

  @override
  String get dragPinchHint => 'ਹਿਲਾਉਣ ਲਈ ਖਿੱਚੋ। ਆਕਾਰ ਬਦਲਣ ਲਈ ਪਿੰਚ ਕਰੋ।';

  @override
  String get smaller => 'ਛੋਟਾ';

  @override
  String get larger => 'ਵੱਡਾ';
}
