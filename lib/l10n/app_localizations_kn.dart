// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'ಸ್ಕ್ಯಾನ್';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get ok => 'ಸರಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get share => 'ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get copy => 'ನಕಲಿಸಿ';

  @override
  String get copied => 'ನಕಲಿಸಲಾಗಿದೆ.';

  @override
  String get saved => 'ಉಳಿಸಲಾಗಿದೆ.';

  @override
  String get name => 'ಹೆಸರು';

  @override
  String get rename => 'ಹೆಸರು ಬದಲಿಸಿ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get dismiss => 'ವಜಾಗೊಳಿಸಿ';

  @override
  String get tryAgain => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get cannotBeUndone => 'ಇದನ್ನು ಹಿಂತಿರುಗಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get savingPages => 'ಪುಟಗಳನ್ನು ಉಳಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String get preparingScanner =>
      'ಸ್ಕ್ಯಾನರ್ ಸಿದ್ಧವಾಗುತ್ತಿದೆ…\nಮೊದಲ ಬಳಕೆ: Google Play ಸೇವೆಗಳು ಇದನ್ನು ಒಮ್ಮೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡುತ್ತವೆ.';

  @override
  String get scannerUnavailable => 'ಸ್ಕ್ಯಾನರ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String scannerUnavailableWith(String error) {
    return 'ಸ್ಕ್ಯಾನರ್ ಲಭ್ಯವಿಲ್ಲ: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'ಪುಟಗಳನ್ನು ಉಳಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ಫೈಲ್ ಆಯ್ಕೆಗಾರವನ್ನು ತೆರೆಯಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get importingPdf => 'PDF ಆಮದು ಮಾಡಲಾಗುತ್ತಿದೆ…';

  @override
  String get importedPdf => 'ಆಮದು ಮಾಡಿದ PDF';

  @override
  String couldNotImport(String error) {
    return 'ಆಮದು ಮಾಡಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get pickTwoPdfs => 'ಕನಿಷ್ಠ ಎರಡು PDF ಫೈಲ್‌ಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF ಫೈಲ್‌ಗಳನ್ನು ವಿಲೀನಗೊಳಿಸಲಾಗುತ್ತಿದೆ…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ವಿಲೀನ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ವಿಲೀನಗೊಳಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get saveToFolder => 'ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String couldNotSave(String error) {
    return 'ಉಳಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get mergedDocument => 'ವಿಲೀನಗೊಳಿಸಿದ ದಾಖಲೆ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + ಇನ್ನೂ $count';
  }

  @override
  String get merging => 'ವಿಲೀನಗೊಳಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ದಾಖಲೆಗಳನ್ನು ಅಳಿಸಬೇಕೇ?',
      one: '1 ದಾಖಲೆಯನ್ನು ಅಳಿಸಬೇಕೇ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF ರಚಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF ರಚಿಸಲಾಗುತ್ತಿದೆ $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF ರಚಿಸಲಾಗುತ್ತಿದೆ, ಪುಟ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF ರಚಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get searchDocuments => 'ದಾಖಲೆಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get closeSearch => 'ಹುಡುಕಾಟ ಮುಚ್ಚಿ';

  @override
  String get search => 'ಹುಡುಕಿ';

  @override
  String get importPdfAsPages => 'PDF ಅನ್ನು ಪುಟಗಳಾಗಿ ಆಮದು ಮಾಡಿ';

  @override
  String get mergePdfFiles => 'PDF ಫೈಲ್‌ಗಳನ್ನು ವಿಲೀನಗೊಳಿಸಿ';

  @override
  String get clearSelection => 'ಆಯ್ಕೆ ತೆರವುಗೊಳಿಸಿ';

  @override
  String nSelected(int count) {
    return '$count ಆಯ್ಕೆಯಾಗಿದೆ';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ಆಯ್ಕೆಯಾಗಿದೆ · ಇದೇ ಕ್ರಮದಲ್ಲಿ ವಿಲೀನವಾಗುತ್ತದೆ';
  }

  @override
  String get mergeIntoOne => 'ಒಂದೇ ದಾಖಲೆಯಾಗಿ ವಿಲೀನಗೊಳಿಸಿ';

  @override
  String get shareAsPdf => 'PDF ಆಗಿ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get selectAll => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get noScansYet => 'ಇನ್ನೂ ಸ್ಕ್ಯಾನ್‌ಗಳಿಲ್ಲ';

  @override
  String get nothingMatches => 'ಯಾವುದೂ ಹೊಂದಿಕೆಯಾಗಲಿಲ್ಲ';

  @override
  String get emptyHint =>
      'ದಾಖಲೆಯ ಫೋಟೋ ತೆಗೆಯಲು ಸ್ಕ್ಯಾನ್ ಟ್ಯಾಪ್ ಮಾಡಿ. ಎಲ್ಲವೂ ಈ ಫೋನ್‌ನಲ್ಲೇ ಇರುತ್ತದೆ.';

  @override
  String get tryAnotherWord => 'ಬೇರೆ ಪದವನ್ನು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಪುಟಗಳು',
      one: '1 ಪುಟ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'ಸ್ಕ್ಯಾನ್ $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ಅನಿರೀಕ್ಷಿತವಾಗಿ ಮುಚ್ಚಿಹೋಯಿತು';

  @override
  String get crashBody =>
      'ಏನು ತಪ್ಪಾಯಿತು ಎಂಬ ವರದಿಯನ್ನು ಈ ಫೋನ್‌ನಲ್ಲಿ ಮಾತ್ರ ಉಳಿಸಲಾಗಿದೆ. ಅದನ್ನು ಡೆವಲಪರ್‌ಗೆ ಹಂಚಿಕೊಂಡರೆ ಸಮಸ್ಯೆ ಸರಿಪಡಿಸಲು ಸಹಾಯವಾಗುತ್ತದೆ. ಅದರಲ್ಲಿ ತಾಂತ್ರಿಕ ವಿವರಗಳಿವೆ, ನಿಮ್ಮ ದಾಖಲೆಗಳಲ್ಲ.';

  @override
  String get reportCopied => 'ವರದಿ ನಕಲಿಸಲಾಗಿದೆ.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO ಕ್ರ್ಯಾಶ್ ವರದಿ';

  @override
  String get pdfSaved => 'PDF ಉಳಿಸಲಾಗಿದೆ.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ಉಳಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get exportPagesAsImages => 'ಪುಟಗಳನ್ನು ಚಿತ್ರಗಳಾಗಿ ರಫ್ತು ಮಾಡಿ';

  @override
  String get saveToPhotos => 'ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get savingToPhotos => 'ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String get photosNeedsAndroid10 =>
      'ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲು Android 10 ಅಥವಾ ಹೊಸದು ಬೇಕು. ಬದಲಿಗೆ ಹಂಚಿಕೊಳ್ಳಿ ಬಳಸಿ.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ಗೆ ಫೋಟೋಗಳಿಗೆ ಸೇರಿಸಲು ಅನುಮತಿ ಇಲ್ಲ. ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅನುಮತಿಸಿ, ಅಥವಾ ಹಂಚಿಕೊಳ್ಳಿ ಬಳಸಿ.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಚಿತ್ರಗಳನ್ನು ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ.',
      one: '1 ಚಿತ್ರವನ್ನು ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'ರಫ್ತು ಮಾಡಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get deleteDocumentQuestion => 'ಈ ದಾಖಲೆಯನ್ನು ಅಳಿಸಬೇಕೇ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಪುಟಗಳು ಅಳಿಸಲ್ಪಡುತ್ತವೆ. ಇದನ್ನು ಹಿಂತಿರುಗಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
      one: '1 ಪುಟ ಅಳಿಸಲ್ಪಡುತ್ತದೆ. ಇದನ್ನು ಹಿಂತಿರುಗಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ಪಠ್ಯ (OCR)';

  @override
  String get sharePdf => 'PDF ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get savePdfToFolder => 'PDF ಅನ್ನು ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get exportAsImages => 'JPEG / PNG ಆಗಿ ರಫ್ತು ಮಾಡಿ';

  @override
  String get deleteDocument => 'ದಾಖಲೆ ಅಳಿಸಿ';

  @override
  String get noPages => 'ಪುಟಗಳಿಲ್ಲ. ಪುಟಗಳನ್ನು ಸೇರಿಸಿ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get addPages => 'ಪುಟಗಳನ್ನು ಸೇರಿಸಿ';

  @override
  String get holdToReorder => 'ಕ್ರಮ ಬದಲಿಸಲು ಪುಟವನ್ನು ಒತ್ತಿ ಹಿಡಿಯಿರಿ';

  @override
  String get savePdfDialogTitle => 'PDF ಉಳಿಸಿ';

  @override
  String get saveDialogTitle => 'ಉಳಿಸಿ';

  @override
  String couldNotRotate(String error) {
    return 'ತಿರುಗಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'ಹಂಚಿಕೊಳ್ಳಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get noTextOnPage => 'ಈ ಪುಟದಲ್ಲಿ ಯಾವುದೇ ಪಠ್ಯ ಸಿಗಲಿಲ್ಲ.';

  @override
  String pageNText(int n) {
    return 'ಪುಟ $n ಪಠ್ಯ';
  }

  @override
  String deletePageQuestion(int n) {
    return 'ಪುಟ $n ಅನ್ನು ಅಳಿಸಬೇಕೇ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total ರಲ್ಲಿ ಪುಟ $n';
  }

  @override
  String get rotateLeft => 'ಎಡಕ್ಕೆ ತಿರುಗಿಸಿ';

  @override
  String get rotateRight => 'ಬಲಕ್ಕೆ ತಿರುಗಿಸಿ';

  @override
  String get sign => 'ಸಹಿ';

  @override
  String get copyText => 'ಪಠ್ಯ ನಕಲಿಸಿ';

  @override
  String get shareImage => 'ಚಿತ್ರ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get deletePage => 'ಪುಟ ಅಳಿಸಿ';

  @override
  String get signed => 'ಸಹಿ ಮಾಡಲಾಗಿದೆ.';

  @override
  String signPageN(int n) {
    return 'ಪುಟ $n ಕ್ಕೆ ಸಹಿ ಮಾಡಿ';
  }

  @override
  String get deleteThisSignature => 'ಈ ಸಹಿಯನ್ನು ಅಳಿಸಿ';

  @override
  String get newSignature => 'ಹೊಸ ಸಹಿ';

  @override
  String readingPage(int n, int total) {
    return 'ಪುಟ $n / $total ಓದಲಾಗುತ್ತಿದೆ';
  }

  @override
  String get ocrFailed => 'ಪಠ್ಯ ಗುರುತಿಸುವಿಕೆ ವಿಫಲವಾಯಿತು.';

  @override
  String ocrFailedWith(String error) {
    return 'ಪಠ್ಯ ಗುರುತಿಸುವಿಕೆ ವಿಫಲವಾಯಿತು: $error';
  }

  @override
  String get textSaved => 'ಪಠ್ಯ ಉಳಿಸಲಾಗಿದೆ.';

  @override
  String get text => 'ಪಠ್ಯ';

  @override
  String get copyAll => 'ಎಲ್ಲವನ್ನೂ ನಕಲಿಸಿ';

  @override
  String get shareText => 'ಪಠ್ಯ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get saveAsTxt => '.txt ಆಗಿ ಉಳಿಸಿ';

  @override
  String get readAgain => 'ಮತ್ತೆ ಓದಿ';

  @override
  String get readAsLatin => 'ಇಂಗ್ಲಿಷ್ / ಲ್ಯಾಟಿನ್ ಆಗಿ ಓದಿ';

  @override
  String get readAsDevanagari => 'ಹಿಂದಿ / ನೇಪಾಳಿ ಆಗಿ ಓದಿ';

  @override
  String get ocrModelHint =>
      'Android ನಲ್ಲಿ ಪಠ್ಯ ಮಾದರಿಯನ್ನು Google Play ಸೇವೆಗಳು ಒಮ್ಮೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡುತ್ತವೆ. ಇದು ಮೊದಲ ಬಳಕೆಯಾದರೆ, ಒಂದು ನಿಮಿಷ ಕಾದು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get noTextFound => 'ಯಾವುದೇ ಪಠ್ಯ ಸಿಗಲಿಲ್ಲ.';

  @override
  String pageSeparator(int n) {
    return '--- ಪುಟ $n ---';
  }

  @override
  String get scanner => 'ಸ್ಕ್ಯಾನರ್';

  @override
  String get scanMode => 'ಸ್ಕ್ಯಾನ್ ಮೋಡ್';

  @override
  String get modeFull => 'ಪೂರ್ಣ: ಫಿಲ್ಟರ್‌ಗಳು + ಕಲೆ ಮತ್ತು ಬೆರಳು ತೆಗೆಯುವಿಕೆ';

  @override
  String get modeFilter => 'ಫಿಲ್ಟರ್‌ಗಳು ಮಾತ್ರ';

  @override
  String get modeBase => 'ಮೂಲ: ಕ್ರಾಪ್ ಮತ್ತು ತಿರುಗಿಸುವಿಕೆ ಮಾತ್ರ';

  @override
  String get allowGallery => 'ಗ್ಯಾಲರಿಯಿಂದ ಆಮದಿಗೆ ಅನುಮತಿಸಿ';

  @override
  String get allowGalleryHint => 'ಸ್ಕ್ಯಾನರ್ ಒಳಗೆ ಗ್ಯಾಲರಿ ಬಟನ್ ತೋರಿಸುತ್ತದೆ';

  @override
  String get pagesPerScan => 'ಪ್ರತಿ ಸ್ಕ್ಯಾನ್‌ಗೆ ಪುಟಗಳು';

  @override
  String get iosScannerNote =>
      'iPhone ನಲ್ಲಿ ಸ್ಕ್ಯಾನರ್ ಎಂದರೆ Apple ನ ಸ್ವಂತ ದಾಖಲೆ ಕ್ಯಾಮೆರಾ.';

  @override
  String get iosScannerNote2 =>
      'ಸ್ವಯಂ ಸೆರೆಹಿಡಿಯುವಿಕೆ, ಅಂಚು ಪತ್ತೆ ಮತ್ತು ಬಣ್ಣದ ಮೋಡ್‌ಗಳು ಅದರಲ್ಲೇ ಇವೆ.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'ಪುಟದ ಗಾತ್ರ';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'ಸ್ಕ್ಯಾನ್‌ನ ಆಕಾರದಲ್ಲೇ';

  @override
  String get searchablePdf => 'ಹುಡುಕಬಹುದಾದ PDF';

  @override
  String get searchablePdfHint =>
      'PDF ನಲ್ಲಿ ಹುಡುಕಲು ಮತ್ತು ಪಠ್ಯ ನಕಲಿಸಲು ಅದೃಶ್ಯ ಪಠ್ಯ ಪದರವನ್ನು ಸೇರಿಸುತ್ತದೆ';

  @override
  String get textRecognition => 'ಪಠ್ಯ ಗುರುತಿಸುವಿಕೆ';

  @override
  String get quality => 'ಗುಣಮಟ್ಟ';

  @override
  String get qualityBest =>
      'ಅತ್ಯುತ್ತಮ: ಪೂರ್ಣ ರೆಸಲ್ಯೂಶನ್, ಸಣ್ಣ ಅಕ್ಷರಗಳನ್ನೂ ಓದುತ್ತದೆ';

  @override
  String get qualityFast => 'ವೇಗ: ಪುಟದ ಚಿಕ್ಕ ಪ್ರತಿ';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get scriptLatin => 'ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಇತರ ಲ್ಯಾಟಿನ್ ಲಿಪಿಯ ಭಾಷೆಗಳು';

  @override
  String get scriptDevanagari => 'ಹಿಂದಿ, ನೇಪಾಳಿ, ಮರಾಠಿ (+ ಲ್ಯಾಟಿನ್)';

  @override
  String get scriptChinese => 'ಚೀನೀ (+ ಲ್ಯಾಟಿನ್)';

  @override
  String get scriptJapanese => 'ಜಪಾನೀ (+ ಲ್ಯಾಟಿನ್)';

  @override
  String get scriptKorean => 'ಕೊರಿಯನ್ (+ ಲ್ಯಾಟಿನ್)';

  @override
  String get readAsChinese => 'ಚೀನೀ ಆಗಿ ಓದಿ';

  @override
  String get readAsJapanese => 'ಜಪಾನೀ ಆಗಿ ಓದಿ';

  @override
  String get readAsKorean => 'ಕೊರಿಯನ್ ಆಗಿ ಓದಿ';

  @override
  String get languageAuto => 'ಭಾಷೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಗುರುತಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get appearance => 'ನೋಟ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get themeSystem => 'ಫೋನ್ ಪ್ರಕಾರ';

  @override
  String get themeLight => 'ತಿಳಿ';

  @override
  String get themeDark => 'ಗಾಢ';

  @override
  String get about => 'ಕುರಿತು';

  @override
  String get aboutPromise => 'ಜಾಹೀರಾತಿಲ್ಲ. ಖಾತೆ ಇಲ್ಲ. ಟ್ರ್ಯಾಕಿಂಗ್ ಇಲ್ಲ.';

  @override
  String get aboutPromiseBody =>
      'ನೀವು ಹಂಚಿಕೊಳ್ಳುವವರೆಗೆ ಅಥವಾ ರಫ್ತು ಮಾಡುವವರೆಗೆ ಸ್ಕ್ಯಾನ್‌ಗಳು ಈ ಫೋನ್‌ನಲ್ಲೇ ಇರುತ್ತವೆ. ಆ್ಯಪ್ ಅನ್‌ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿದರೆ ಅವು ಅಳಿಸಿಹೋಗುತ್ತವೆ, ಹಾಗಾಗಿ ಉಳಿಸಿಕೊಳ್ಳಬೇಕಾದದ್ದನ್ನು ರಫ್ತು ಮಾಡಿಕೊಳ್ಳಿ.';

  @override
  String get openSource => 'ಓಪನ್ ಸೋರ್ಸ್ (Apache-2.0)';

  @override
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get opensInBrowser => 'ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ';

  @override
  String get aboutTechAndroid =>
      'ಸ್ಕ್ಯಾನಿಂಗ್ ಮತ್ತು ಪಠ್ಯ ಗುರುತಿಸುವಿಕೆ Google ML Kit ಮೂಲಕ (ಸಾಧನದಲ್ಲೇ). PDF ವಿಲೀನ PDFBox-Android ಮೂಲಕ. ದೇವನಾಗರಿ ಫಾಂಟ್: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'ಸ್ಕ್ಯಾನಿಂಗ್ Apple VisionKit ಮೂಲಕ, ಪಠ್ಯ ಗುರುತಿಸುವಿಕೆ Apple Vision ಮೂಲಕ (ಸಾಧನದಲ್ಲೇ). ದೇವನಾಗರಿ ಫಾಂಟ್: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url ತೆರೆಯಲಾಗಲಿಲ್ಲ';
  }

  @override
  String get scanBusinessCard => 'ವ್ಯಾಪಾರ ಕಾರ್ಡ್ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get saveAsContact => 'ಸಂಪರ್ಕವಾಗಿ ಉಳಿಸಿ';

  @override
  String get saveToContacts => 'ಸಂಪರ್ಕಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'ವ್ಯಾಪಾರ ಕಾರ್ಡ್';

  @override
  String get contactHint =>
      'ಕ್ಷೇತ್ರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ, ನಂತರ ಉಳಿಸಿ. ನಿಮ್ಮ ಫೋನ್‌ನ ಸಂಪರ್ಕಗಳು ಆ್ಯಪ್ ಎಲ್ಲವನ್ನೂ ಭರ್ತಿ ಮಾಡಿ ತೆರೆಯುತ್ತದೆ.';

  @override
  String get readingCard => 'ಕಾರ್ಡ್ ಓದಲಾಗುತ್ತಿದೆ…';

  @override
  String get nothingRecognised =>
      'ಈ ಕಾರ್ಡ್‌ನಲ್ಲಿ ಯಾವುದೇ ಪಠ್ಯ ಗುರುತಿಸಲಾಗಿಲ್ಲ. ನೀವು ಇನ್ನೂ ವಿವರಗಳನ್ನು ಟೈಪ್ ಮಾಡಬಹುದು.';

  @override
  String get contactOpened =>
      'ಸಂಪರ್ಕಗಳು ತೆರೆಯಲಾಗಿದೆ. ಉಳಿಸಿಕೊಳ್ಳಲು ಅಲ್ಲಿ ಉಳಿಸಿ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String couldNotOpenContacts(String error) {
    return 'ಸಂಪರ್ಕಗಳನ್ನು ತೆರೆಯಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'ಕಾರ್ಡ್ $stamp';
  }

  @override
  String get fieldCompany => 'ಕಂಪನಿ';

  @override
  String get fieldJobTitle => 'ಹುದ್ದೆ';

  @override
  String get fieldMobile => 'ಮೊಬೈಲ್';

  @override
  String get fieldPhone => 'ಫೋನ್';

  @override
  String get fieldFax => 'ಫ್ಯಾಕ್ಸ್';

  @override
  String get fieldEmail => 'ಇಮೇಲ್';

  @override
  String get fieldWebsite => 'ವೆಬ್‌ಸೈಟ್';

  @override
  String get fieldAddress => 'ವಿಳಾಸ';

  @override
  String get fieldCity => 'ನಗರ';

  @override
  String get fieldCountry => 'ದೇಶ';

  @override
  String get fieldNotes => 'ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get drawFirst => 'ಮೊದಲು ನಿಮ್ಮ ಸಹಿಯನ್ನು ಬರೆಯಿರಿ.';

  @override
  String get clear => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String get undo => 'ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get signHint =>
      'ಪೆಟ್ಟಿಗೆಯೊಳಗೆ ಬೆರಳಿನಿಂದ ಸಹಿ ಮಾಡಿ. ಹೆಚ್ಚು ಜಾಗಕ್ಕಾಗಿ ಫೋನ್ ಅನ್ನು ಅಡ್ಡವಾಗಿ ಹಿಡಿಯಿರಿ.';

  @override
  String get thin => 'ತೆಳು';

  @override
  String get medium => 'ಮಧ್ಯಮ';

  @override
  String get thick => 'ದಪ್ಪ';

  @override
  String couldNotReadPage(String error) {
    return 'ಪುಟವನ್ನು ಓದಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'ಸಹಿ ಮಾಡಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get placeSignature => 'ಸಹಿ ಇರಿಸಿ';

  @override
  String get apply => 'ಅನ್ವಯಿಸಿ';

  @override
  String get dragPinchHint => 'ಸರಿಸಲು ಎಳೆಯಿರಿ. ಗಾತ್ರ ಬದಲಿಸಲು ಪಿಂಚ್ ಮಾಡಿ.';

  @override
  String get smaller => 'ಚಿಕ್ಕದು';

  @override
  String get larger => 'ದೊಡ್ಡದು';
}
