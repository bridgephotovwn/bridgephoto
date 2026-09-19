// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'स्कॅन';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get ok => 'ठीक आहे';

  @override
  String get close => 'बंद करा';

  @override
  String get delete => 'हटवा';

  @override
  String get share => 'शेअर करा';

  @override
  String get copy => 'कॉपी करा';

  @override
  String get copied => 'कॉपी झाले.';

  @override
  String get saved => 'सेव्ह झाले.';

  @override
  String get name => 'नाव';

  @override
  String get rename => 'नाव बदला';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get dismiss => 'दुर्लक्ष करा';

  @override
  String get tryAgain => 'पुन्हा प्रयत्न करा';

  @override
  String get cannotBeUndone => 'हे पूर्ववत करता येणार नाही.';

  @override
  String get savingPages => 'पाने सेव्ह होत आहेत…';

  @override
  String get preparingScanner =>
      'स्कॅनर तयार होत आहे…\nपहिल्या वापरात: Google Play सेवा ते एकदा डाउनलोड करतात.';

  @override
  String get scannerUnavailable => 'स्कॅनर उपलब्ध नाही.';

  @override
  String scannerUnavailableWith(String error) {
    return 'स्कॅनर उपलब्ध नाही: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'पाने सेव्ह करता आली नाहीत: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'फाइल निवडक उघडता आला नाही: $error';
  }

  @override
  String get importingPdf => 'PDF इंपोर्ट होत आहे…';

  @override
  String get importedPdf => 'इंपोर्ट केलेली PDF';

  @override
  String couldNotImport(String error) {
    return 'इंपोर्ट करता आले नाही: $error';
  }

  @override
  String get pickTwoPdfs => 'किमान दोन PDF फाइल्स निवडा.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF फाइल्स मर्ज होत आहेत…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'मर्ज $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'मर्ज करता आले नाही: $error';
  }

  @override
  String get saveToFolder => 'फोल्डरमध्ये सेव्ह करा';

  @override
  String couldNotSave(String error) {
    return 'सेव्ह करता आले नाही: $error';
  }

  @override
  String get mergedDocument => 'मर्ज केलेला दस्तऐवज';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + आणखी $count';
  }

  @override
  String get merging => 'मर्ज होत आहे…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दस्तऐवज हटवायचे?',
      one: '1 दस्तऐवज हटवायचा?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF तयार होत आहे…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF तयार होत आहे $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF तयार होत आहे, पान $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF तयार करता आली नाही: $error';
  }

  @override
  String get searchDocuments => 'दस्तऐवज शोधा';

  @override
  String get closeSearch => 'शोध बंद करा';

  @override
  String get search => 'शोधा';

  @override
  String get importPdfAsPages => 'PDF पाने म्हणून इंपोर्ट करा';

  @override
  String get mergePdfFiles => 'PDF फाइल्स मर्ज करा';

  @override
  String get clearSelection => 'निवड काढा';

  @override
  String nSelected(int count) {
    return '$count निवडले';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count निवडले · याच क्रमाने मर्ज होतील';
  }

  @override
  String get mergeIntoOne => 'एका दस्तऐवजात मर्ज करा';

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
  String get shareAsPdf => 'PDF म्हणून शेअर करा';

  @override
  String get selectAll => 'सर्व निवडा';

  @override
  String get noScansYet => 'अजून एकही स्कॅन नाही';

  @override
  String get nothingMatches => 'काहीही जुळले नाही';

  @override
  String get emptyHint =>
      'दस्तऐवजाचा फोटो घेण्यासाठी स्कॅनवर टॅप करा. सर्व काही याच फोनवर राहते.';

  @override
  String get tryAnotherWord => 'दुसरा शब्द वापरून पाहा.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पाने',
      one: '1 पान',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'स्कॅन $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO अनपेक्षितपणे बंद झाले';

  @override
  String get crashBody =>
      'काय चुकले याचा अहवाल फक्त याच फोनवर सेव्ह केला आहे. तो डेव्हलपरसोबत शेअर केल्यास समस्या सोडवायला मदत होते. त्यात तांत्रिक तपशील आहेत, तुमचे दस्तऐवज नाहीत.';

  @override
  String get reportCopied => 'अहवाल कॉपी झाला.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO क्रॅश अहवाल';

  @override
  String get pdfSaved => 'PDF सेव्ह झाली.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF सेव्ह करता आली नाही: $error';
  }

  @override
  String get exportPagesAsImages => 'पाने इमेज म्हणून एक्सपोर्ट करा';

  @override
  String get saveToPhotos => 'फोटोमध्ये सेव्ह करा';

  @override
  String get savingToPhotos => 'फोटोमध्ये सेव्ह होत आहे…';

  @override
  String get photosNeedsAndroid10 =>
      'फोटोमध्ये सेव्ह करण्यासाठी Android 10 किंवा नवीन आवश्यक आहे. त्याऐवजी शेअर वापरा.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ला फोटोमध्ये जोडण्याची परवानगी नाही. सेटिंग्जमध्ये परवानगी द्या, किंवा शेअर वापरा.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count इमेज फोटोमध्ये सेव्ह झाल्या.',
      one: '1 इमेज फोटोमध्ये सेव्ह झाली.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'एक्सपोर्ट करता आले नाही: $error';
  }

  @override
  String get deleteDocumentQuestion => 'हा दस्तऐवज हटवायचा?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पाने हटवली जातील. हे पूर्ववत करता येणार नाही.',
      one: '1 पान हटवले जाईल. हे पूर्ववत करता येणार नाही.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'मजकूर (OCR)';

  @override
  String get sharePdf => 'PDF शेअर करा';

  @override
  String get savePdfToFolder => 'PDF फोल्डरमध्ये सेव्ह करा';

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
  String get exportAsImages => 'JPEG / PNG म्हणून एक्सपोर्ट करा';

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
  String get deleteDocument => 'दस्तऐवज हटवा';

  @override
  String get noPages => 'एकही पान नाही. पाने जोडा वर टॅप करा.';

  @override
  String get addPages => 'पाने जोडा';

  @override
  String get holdToReorder => 'क्रम बदलण्यासाठी पान दाबून धरा';

  @override
  String get savePdfDialogTitle => 'PDF सेव्ह करा';

  @override
  String get saveDialogTitle => 'सेव्ह करा';

  @override
  String couldNotRotate(String error) {
    return 'फिरवता आले नाही: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'शेअर करता आले नाही: $error';
  }

  @override
  String get noTextOnPage => 'या पानावर मजकूर आढळला नाही.';

  @override
  String pageNText(int n) {
    return 'पान $n चा मजकूर';
  }

  @override
  String deletePageQuestion(int n) {
    return 'पान $n हटवायचे?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total पैकी पान $n';
  }

  @override
  String get rotateLeft => 'डावीकडे फिरवा';

  @override
  String get rotateRight => 'उजवीकडे फिरवा';

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
  String get undo => 'पूर्ववत करा';

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
  String get sign => 'स्वाक्षरी';

  @override
  String get copyText => 'मजकूर कॉपी करा';

  @override
  String get shareImage => 'इमेज शेअर करा';

  @override
  String get deletePage => 'पान हटवा';

  @override
  String get signed => 'स्वाक्षरी झाली.';

  @override
  String signPageN(int n) {
    return 'पान $n वर स्वाक्षरी करा';
  }

  @override
  String get deleteThisSignature => 'ही स्वाक्षरी हटवा';

  @override
  String get newSignature => 'नवीन स्वाक्षरी';

  @override
  String readingPage(int n, int total) {
    return 'पान $n / $total वाचत आहे';
  }

  @override
  String get ocrFailed => 'मजकूर ओळख अयशस्वी झाली.';

  @override
  String ocrFailedWith(String error) {
    return 'मजकूर ओळख अयशस्वी झाली: $error';
  }

  @override
  String get textSaved => 'मजकूर सेव्ह झाला.';

  @override
  String get text => 'मजकूर';

  @override
  String get copyAll => 'सर्व कॉपी करा';

  @override
  String get shareText => 'मजकूर शेअर करा';

  @override
  String get saveAsTxt => '.txt म्हणून सेव्ह करा';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'पुन्हा वाचा';

  @override
  String get readAsLatin => 'इंग्रजी / लॅटिन म्हणून वाचा';

  @override
  String get readAsDevanagari => 'हिंदी / नेपाळी म्हणून वाचा';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android वर मजकूर मॉडेल Google Play सेवा एकदा डाउनलोड करतात. हा पहिला वापर असल्यास, एक मिनिट थांबा आणि पुन्हा प्रयत्न करा.';

  @override
  String get noTextFound => 'मजकूर आढळला नाही.';

  @override
  String pageSeparator(int n) {
    return '--- पान $n ---';
  }

  @override
  String get scanner => 'स्कॅनर';

  @override
  String get scanMode => 'स्कॅन मोड';

  @override
  String get modeFull => 'पूर्ण: फिल्टर + डाग आणि बोटे साफ करा';

  @override
  String get modeFilter => 'फक्त फिल्टर';

  @override
  String get modeBase => 'मूलभूत: फक्त क्रॉप आणि फिरवणे';

  @override
  String get allowGallery => 'गॅलरीतून इंपोर्ट करण्यास परवानगी द्या';

  @override
  String get allowGalleryHint => 'स्कॅनरमध्ये गॅलरी बटण दाखवते';

  @override
  String get pagesPerScan => 'प्रति स्कॅन पाने';

  @override
  String get iosScannerNote =>
      'iPhone वर स्कॅनर हा Apple चा स्वतःचा दस्तऐवज कॅमेरा आहे.';

  @override
  String get iosScannerNote2 =>
      'स्वयंचलित कॅप्चर, कडा ओळख आणि रंग मोड त्यात अंतर्भूत आहेत.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'पानाचा आकार';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'स्कॅनसारखाच आकार';

  @override
  String get searchablePdf => 'शोधण्यायोग्य PDF';

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
      'अदृश्य मजकूर स्तर जोडते, जेणेकरून PDF मध्ये शोधता येते आणि मजकूर कॉपी करता येतो';

  @override
  String get textRecognition => 'मजकूर ओळख';

  @override
  String get quality => 'गुणवत्ता';

  @override
  String get qualityBest => 'सर्वोत्तम: पूर्ण रिझोल्यूशन, बारीक अक्षरेही वाचते';

  @override
  String get qualityFast => 'जलद: पानाची लहान प्रत';

  @override
  String get language => 'भाषा';

  @override
  String get scriptLatin => 'इंग्रजी आणि लॅटिन लिपीतील इतर भाषा';

  @override
  String get scriptDevanagari => 'हिंदी, नेपाळी, मराठी (+ लॅटिन)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'चिनी (+ लॅटिन)';

  @override
  String get scriptJapanese => 'जपानी (+ लॅटिन)';

  @override
  String get scriptKorean => 'कोरियन (+ लॅटिन)';

  @override
  String get readAsChinese => 'चिनी म्हणून वाचा';

  @override
  String get readAsJapanese => 'जपानी म्हणून वाचा';

  @override
  String get readAsKorean => 'कोरियन म्हणून वाचा';

  @override
  String get languageAuto => 'भाषा आपोआप ओळखली जाते.';

  @override
  String get appearance => 'दिसणे';

  @override
  String get theme => 'थीम';

  @override
  String get themeSystem => 'फोननुसार';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get about => 'माहिती';

  @override
  String get aboutPromise => 'जाहिराती नाहीत. खाते नाही. ट्रॅकिंग नाही.';

  @override
  String get aboutPromiseBody =>
      'तुम्ही शेअर किंवा एक्सपोर्ट करेपर्यंत स्कॅन याच फोनवर राहतात. ॲप अनइंस्टॉल केल्यास ते हटतात, म्हणून जे ठेवायचे ते एक्सपोर्ट करा.';

  @override
  String get openSource => 'ओपन सोर्स (Apache-2.0)';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get opensInBrowser => 'तुमच्या ब्राउझरमध्ये उघडते';

  @override
  String get aboutTechAndroid =>
      'स्कॅनिंग आणि मजकूर ओळख Google ML Kit द्वारे (डिव्हाइसवर). PDF मर्ज PDFBox-Android द्वारे. देवनागरी फॉन्ट: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'स्कॅनिंग Apple VisionKit द्वारे, मजकूर ओळख Apple Vision द्वारे (डिव्हाइसवर). देवनागरी फॉन्ट: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url उघडता आले नाही';
  }

  @override
  String get scanBusinessCard => 'बिझनेस कार्ड स्कॅन करा';

  @override
  String get saveAsContact => 'संपर्क म्हणून सेव्ह करा';

  @override
  String get saveToContacts => 'संपर्कांमध्ये सेव्ह करा';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'बिझनेस कार्ड';

  @override
  String get contactHint =>
      'फील्ड तपासा, नंतर सेव्ह करा. तुमच्या फोनचे संपर्क ॲप सर्व माहिती भरलेले उघडेल.';

  @override
  String get readingCard => 'कार्ड वाचत आहे…';

  @override
  String get nothingRecognised =>
      'या कार्डवर कोणताही मजकूर ओळखला गेला नाही. तरीही तुम्ही तपशील टाइप करू शकता.';

  @override
  String get contactOpened =>
      'संपर्क उघडले. ठेवण्यासाठी तिथे सेव्ह करा वर टॅप करा.';

  @override
  String couldNotOpenContacts(String error) {
    return 'संपर्क उघडता आले नाहीत: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'कार्ड $stamp';
  }

  @override
  String get fieldCompany => 'कंपनी';

  @override
  String get fieldJobTitle => 'पद';

  @override
  String get fieldMobile => 'मोबाइल';

  @override
  String get fieldPhone => 'फोन';

  @override
  String get fieldFax => 'फॅक्स';

  @override
  String get fieldEmail => 'ईमेल';

  @override
  String get fieldWebsite => 'वेबसाइट';

  @override
  String get fieldAddress => 'पत्ता';

  @override
  String get fieldCity => 'शहर';

  @override
  String get fieldCountry => 'देश';

  @override
  String get fieldNotes => 'टिपा';

  @override
  String get drawFirst => 'आधी तुमची स्वाक्षरी काढा.';

  @override
  String get clear => 'साफ करा';

  @override
  String get save => 'सेव्ह करा';

  @override
  String get signHint =>
      'बॉक्समध्ये बोटाने स्वाक्षरी करा. अधिक जागेसाठी फोन आडवा धरा.';

  @override
  String get thin => 'पातळ';

  @override
  String get medium => 'मध्यम';

  @override
  String get thick => 'जाड';

  @override
  String couldNotReadPage(String error) {
    return 'पान वाचता आले नाही: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'स्वाक्षरी करता आली नाही: $error';
  }

  @override
  String get placeSignature => 'स्वाक्षरी ठेवा';

  @override
  String get apply => 'लागू करा';

  @override
  String get dragPinchHint =>
      'हलवण्यासाठी ड्रॅग करा. आकार बदलण्यासाठी पिंच करा.';

  @override
  String get smaller => 'लहान';

  @override
  String get larger => 'मोठे';
}
