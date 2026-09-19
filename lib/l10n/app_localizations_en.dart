// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scan';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Close';

  @override
  String get delete => 'Delete';

  @override
  String get share => 'Share';

  @override
  String get copy => 'Copy';

  @override
  String get copied => 'Copied.';

  @override
  String get saved => 'Saved.';

  @override
  String get name => 'Name';

  @override
  String get rename => 'Rename';

  @override
  String get settings => 'Settings';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get tryAgain => 'Try again';

  @override
  String get cannotBeUndone => 'This cannot be undone.';

  @override
  String get savingPages => 'Saving pages…';

  @override
  String get preparingScanner =>
      'Preparing the scanner…\nFirst use: Google Play services downloads it once.';

  @override
  String get scannerUnavailable => 'The scanner is not available.';

  @override
  String scannerUnavailableWith(String error) {
    return 'The scanner is not available: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Could not save the pages: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Could not open the file picker: $error';
  }

  @override
  String get importingPdf => 'Importing PDF…';

  @override
  String get importedPdf => 'Imported PDF';

  @override
  String couldNotImport(String error) {
    return 'Could not import: $error';
  }

  @override
  String get pickTwoPdfs => 'Pick at least two PDF files.';

  @override
  String mergingPdfs(int count) {
    return 'Merging $count PDF files…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Merged $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Could not merge: $error';
  }

  @override
  String get saveToFolder => 'Save to a folder';

  @override
  String couldNotSave(String error) {
    return 'Could not save: $error';
  }

  @override
  String get mergedDocument => 'Merged document';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count more';
  }

  @override
  String get merging => 'Merging…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count documents?',
      one: 'Delete 1 document?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Building PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Building PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Building PDF, page $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Could not build the PDF: $error';
  }

  @override
  String get searchDocuments => 'Search documents';

  @override
  String get closeSearch => 'Close search';

  @override
  String get search => 'Search';

  @override
  String get importPdfAsPages => 'Import PDF as pages';

  @override
  String get mergePdfFiles => 'Merge PDF files';

  @override
  String get clearSelection => 'Clear selection';

  @override
  String nSelected(int count) {
    return '$count selected';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count selected · merge in this order';
  }

  @override
  String get mergeIntoOne => 'Merge into one document';

  @override
  String get shareAsPdf => 'Share as PDF';

  @override
  String get selectAll => 'Select all';

  @override
  String get noScansYet => 'No scans yet';

  @override
  String get nothingMatches => 'Nothing matches';

  @override
  String get emptyHint =>
      'Tap Scan to photograph a document. Everything stays on this phone.';

  @override
  String get tryAnotherWord => 'Try another word.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
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
  String get crashTitle => 'BRIDGE PHOTO closed unexpectedly';

  @override
  String get crashBody =>
      'A report of what went wrong was saved on this phone only. Sharing it with the developer helps fix the problem. It contains technical details, not your documents.';

  @override
  String get reportCopied => 'Report copied.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO crash report';

  @override
  String get pdfSaved => 'PDF saved.';

  @override
  String couldNotSavePdf(String error) {
    return 'Could not save the PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Export pages as images';

  @override
  String get saveToPhotos => 'Save to Photos';

  @override
  String get savingToPhotos => 'Saving to Photos…';

  @override
  String get photosNeedsAndroid10 =>
      'Saving to Photos needs Android 10 or newer. Use Share instead.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO is not allowed to add to Photos. Allow it in Settings, or use Share.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images saved to Photos.',
      one: '1 image saved to Photos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Could not export: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Delete this document?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages will be deleted. This cannot be undone.',
      one: '1 page will be deleted. This cannot be undone.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Text (OCR)';

  @override
  String get sharePdf => 'Share PDF';

  @override
  String get savePdfToFolder => 'Save PDF to a folder';

  @override
  String get exportAsImages => 'Export as JPEG / PNG';

  @override
  String get deleteDocument => 'Delete document';

  @override
  String get noPages => 'No pages. Tap Add pages.';

  @override
  String get addPages => 'Add pages';

  @override
  String get holdToReorder => 'hold a page to reorder';

  @override
  String get savePdfDialogTitle => 'Save PDF';

  @override
  String get saveDialogTitle => 'Save';

  @override
  String couldNotRotate(String error) {
    return 'Could not rotate: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Could not share: $error';
  }

  @override
  String get noTextOnPage => 'No text found on this page.';

  @override
  String pageNText(int n) {
    return 'Page $n text';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Delete page $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Page $n of $total';
  }

  @override
  String get rotateLeft => 'Rotate left';

  @override
  String get rotateRight => 'Rotate right';

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
  String get sign => 'Sign';

  @override
  String get copyText => 'Copy text';

  @override
  String get shareImage => 'Share image';

  @override
  String get deletePage => 'Delete page';

  @override
  String get signed => 'Signed.';

  @override
  String signPageN(int n) {
    return 'Sign page $n';
  }

  @override
  String get deleteThisSignature => 'Delete this signature';

  @override
  String get newSignature => 'New signature';

  @override
  String readingPage(int n, int total) {
    return 'Reading page $n / $total';
  }

  @override
  String get ocrFailed => 'Text recognition failed.';

  @override
  String ocrFailedWith(String error) {
    return 'Text recognition failed: $error';
  }

  @override
  String get textSaved => 'Text saved.';

  @override
  String get text => 'Text';

  @override
  String get copyAll => 'Copy all';

  @override
  String get shareText => 'Share text';

  @override
  String get saveAsTxt => 'Save as .txt';

  @override
  String get readAgain => 'Read again';

  @override
  String get readAsLatin => 'Read as English / Latin';

  @override
  String get readAsDevanagari => 'Read as Hindi / Nepali';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'On Android the text model is downloaded once by Google Play services. If this is the first use, wait a minute and try again.';

  @override
  String get noTextFound => 'No text was found.';

  @override
  String pageSeparator(int n) {
    return '--- Page $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Scan mode';

  @override
  String get modeFull => 'Full: filters + clean stains and fingers';

  @override
  String get modeFilter => 'Filters only';

  @override
  String get modeBase => 'Basic: crop and rotate only';

  @override
  String get allowGallery => 'Allow import from gallery';

  @override
  String get allowGalleryHint => 'Shows a gallery button inside the scanner';

  @override
  String get pagesPerScan => 'Pages per scan';

  @override
  String get iosScannerNote =>
      'On iPhone the scanner is Apple\'s own document camera.';

  @override
  String get iosScannerNote2 =>
      'Automatic capture, edge detection and colour modes are built in.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Page size';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Same shape as the scan';

  @override
  String get searchablePdf => 'Searchable PDF';

  @override
  String get searchablePdfHint =>
      'Adds an invisible text layer so the PDF can be searched and text copied';

  @override
  String get textRecognition => 'Text recognition';

  @override
  String get quality => 'Quality';

  @override
  String get qualityBest => 'Best: full resolution, reads small print';

  @override
  String get qualityFast => 'Fast: smaller copy of the page';

  @override
  String get language => 'Language';

  @override
  String get scriptLatin => 'English and other Latin-script languages';

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
  String get readAsChinese => 'Read as Chinese';

  @override
  String get readAsJapanese => 'Read as Japanese';

  @override
  String get readAsKorean => 'Read as Korean';

  @override
  String get languageAuto => 'The language is detected automatically.';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'Follow the phone';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get about => 'About';

  @override
  String get aboutPromise => 'No ads. No account. No tracking.';

  @override
  String get aboutPromiseBody =>
      'Scans stay on this phone unless you share or export them. Uninstalling the app deletes them, so export what you want to keep.';

  @override
  String get openSource => 'Open source (Apache-2.0)';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get opensInBrowser => 'Opens in your browser';

  @override
  String get aboutTechAndroid =>
      'Scanning and text recognition by Google ML Kit (on device). PDF merge by PDFBox-Android. Devanagari font: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scanning by Apple VisionKit, text recognition by Apple Vision (on device). Devanagari font: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Could not open $url';
  }

  @override
  String get scanBusinessCard => 'Scan a business card';

  @override
  String get saveAsContact => 'Save as contact';

  @override
  String get saveToContacts => 'Save to Contacts';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Business card';

  @override
  String get contactHint =>
      'Check the fields, then save. Your phone\'s Contacts app opens with everything filled in.';

  @override
  String get readingCard => 'Reading the card…';

  @override
  String get nothingRecognised =>
      'No text was recognised on this card. You can still type the details.';

  @override
  String get contactOpened => 'Contacts opened. Tap Save there to keep it.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Could not open Contacts: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Card $stamp';
  }

  @override
  String get fieldCompany => 'Company';

  @override
  String get fieldJobTitle => 'Job title';

  @override
  String get fieldMobile => 'Mobile';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Address';

  @override
  String get fieldCity => 'City';

  @override
  String get fieldCountry => 'Country';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get drawFirst => 'Draw your signature first.';

  @override
  String get clear => 'Clear';

  @override
  String get undo => 'Undo';

  @override
  String get save => 'Save';

  @override
  String get signHint =>
      'Sign in the box with your finger. Turn the phone sideways for more room.';

  @override
  String get thin => 'Thin';

  @override
  String get medium => 'Medium';

  @override
  String get thick => 'Thick';

  @override
  String couldNotReadPage(String error) {
    return 'Could not read the page: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Could not sign: $error';
  }

  @override
  String get placeSignature => 'Place signature';

  @override
  String get apply => 'Apply';

  @override
  String get dragPinchHint => 'Drag to move. Pinch to resize.';

  @override
  String get smaller => 'Smaller';

  @override
  String get larger => 'Larger';
}
