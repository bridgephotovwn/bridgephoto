// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'స్కాన్';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get ok => 'సరే';

  @override
  String get close => 'మూసివేయి';

  @override
  String get delete => 'తొలగించు';

  @override
  String get share => 'షేర్ చేయి';

  @override
  String get copy => 'కాపీ చేయి';

  @override
  String get copied => 'కాపీ అయింది.';

  @override
  String get saved => 'సేవ్ అయింది.';

  @override
  String get name => 'పేరు';

  @override
  String get rename => 'పేరు మార్చు';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get dismiss => 'విస్మరించు';

  @override
  String get tryAgain => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get cannotBeUndone => 'దీన్ని రద్దు చేయలేరు.';

  @override
  String get savingPages => 'పేజీలు సేవ్ అవుతున్నాయి…';

  @override
  String get preparingScanner =>
      'స్కానర్ సిద్ధమవుతోంది…\nమొదటిసారి: Google Play సేవలు దీన్ని ఒకసారి డౌన్‌లోడ్ చేస్తాయి.';

  @override
  String get scannerUnavailable => 'స్కానర్ అందుబాటులో లేదు.';

  @override
  String scannerUnavailableWith(String error) {
    return 'స్కానర్ అందుబాటులో లేదు: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'పేజీలను సేవ్ చేయలేకపోయాం: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ఫైల్ పికర్‌ను తెరవలేకపోయాం: $error';
  }

  @override
  String get importingPdf => 'PDF దిగుమతి అవుతోంది…';

  @override
  String get importedPdf => 'దిగుమతి చేసిన PDF';

  @override
  String couldNotImport(String error) {
    return 'దిగుమతి చేయలేకపోయాం: $error';
  }

  @override
  String get pickTwoPdfs => 'కనీసం రెండు PDF ఫైళ్లను ఎంచుకోండి.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF ఫైళ్లు విలీనం అవుతున్నాయి…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'విలీనం $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'విలీనం చేయలేకపోయాం: $error';
  }

  @override
  String get saveToFolder => 'ఫోల్డర్‌లో సేవ్ చేయి';

  @override
  String couldNotSave(String error) {
    return 'సేవ్ చేయలేకపోయాం: $error';
  }

  @override
  String get mergedDocument => 'విలీనం చేసిన పత్రం';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + మరో $count';
  }

  @override
  String get merging => 'విలీనం అవుతోంది…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పత్రాలను తొలగించాలా?',
      one: '1 పత్రాన్ని తొలగించాలా?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF తయారవుతోంది…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF తయారవుతోంది $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF తయారవుతోంది, పేజీ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF ను తయారు చేయలేకపోయాం: $error';
  }

  @override
  String get searchDocuments => 'పత్రాలను వెతుకు';

  @override
  String get closeSearch => 'శోధనను మూసివేయి';

  @override
  String get search => 'వెతుకు';

  @override
  String get importPdfAsPages => 'PDF ను పేజీలుగా దిగుమతి చేయి';

  @override
  String get mergePdfFiles => 'PDF ఫైళ్లను విలీనం చేయి';

  @override
  String get clearSelection => 'ఎంపికను తీసివేయి';

  @override
  String nSelected(int count) {
    return '$count ఎంచుకున్నారు';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ఎంచుకున్నారు · ఇదే క్రమంలో విలీనం అవుతాయి';
  }

  @override
  String get mergeIntoOne => 'ఒకే పత్రంగా విలీనం చేయి';

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
  String get shareAsPdf => 'PDF గా షేర్ చేయి';

  @override
  String get selectAll => 'అన్నీ ఎంచుకో';

  @override
  String get noScansYet => 'ఇంకా స్కాన్‌లు లేవు';

  @override
  String get nothingMatches => 'ఏదీ సరిపోలలేదు';

  @override
  String get emptyHint =>
      'పత్రాన్ని ఫోటో తీయడానికి స్కాన్ నొక్కండి. అంతా ఈ ఫోన్‌లోనే ఉంటుంది.';

  @override
  String get tryAnotherWord => 'మరో పదం ప్రయత్నించండి.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పేజీలు',
      one: '1 పేజీ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'స్కాన్ $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO అనుకోకుండా మూసివేయబడింది';

  @override
  String get crashBody =>
      'ఏమి తప్పు జరిగిందో తెలిపే నివేదిక ఈ ఫోన్‌లో మాత్రమే సేవ్ చేయబడింది. దాన్ని డెవలపర్‌తో షేర్ చేస్తే సమస్యను సరిచేయడానికి సహాయపడుతుంది. అందులో సాంకేతిక వివరాలు మాత్రమే ఉంటాయి, మీ పత్రాలు కాదు.';

  @override
  String get reportCopied => 'నివేదిక కాపీ అయింది.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO క్రాష్ నివేదిక';

  @override
  String get pdfSaved => 'PDF సేవ్ అయింది.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ను సేవ్ చేయలేకపోయాం: $error';
  }

  @override
  String get exportPagesAsImages => 'పేజీలను చిత్రాలుగా ఎగుమతి చేయి';

  @override
  String get saveToPhotos => 'ఫోటోలలో సేవ్ చేయి';

  @override
  String get savingToPhotos => 'ఫోటోలలో సేవ్ అవుతోంది…';

  @override
  String get photosNeedsAndroid10 =>
      'ఫోటోలలో సేవ్ చేయడానికి Android 10 లేదా కొత్తది కావాలి. బదులుగా షేర్ వాడండి.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO కు ఫోటోలలో జోడించే అనుమతి లేదు. సెట్టింగ్‌లలో అనుమతించండి, లేదా షేర్ వాడండి.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count చిత్రాలు ఫోటోలలో సేవ్ అయ్యాయి.',
      one: '1 చిత్రం ఫోటోలలో సేవ్ అయింది.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'ఎగుమతి చేయలేకపోయాం: $error';
  }

  @override
  String get deleteDocumentQuestion => 'ఈ పత్రాన్ని తొలగించాలా?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పేజీలు తొలగించబడతాయి. దీన్ని రద్దు చేయలేరు.',
      one: '1 పేజీ తొలగించబడుతుంది. దీన్ని రద్దు చేయలేరు.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'టెక్స్ట్ (OCR)';

  @override
  String get sharePdf => 'PDF షేర్ చేయి';

  @override
  String get savePdfToFolder => 'PDF ను ఫోల్డర్‌లో సేవ్ చేయి';

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
  String get exportAsImages => 'JPEG / PNG గా ఎగుమతి చేయి';

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
  String get deleteDocument => 'పత్రాన్ని తొలగించు';

  @override
  String get noPages => 'పేజీలు లేవు. పేజీలను జోడించు నొక్కండి.';

  @override
  String get addPages => 'పేజీలను జోడించు';

  @override
  String get holdToReorder => 'క్రమం మార్చడానికి పేజీని నొక్కి పట్టుకోండి';

  @override
  String get savePdfDialogTitle => 'PDF సేవ్ చేయి';

  @override
  String get saveDialogTitle => 'సేవ్ చేయి';

  @override
  String couldNotRotate(String error) {
    return 'తిప్పలేకపోయాం: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'షేర్ చేయలేకపోయాం: $error';
  }

  @override
  String get noTextOnPage => 'ఈ పేజీలో టెక్స్ట్ ఏదీ కనబడలేదు.';

  @override
  String pageNText(int n) {
    return 'పేజీ $n టెక్స్ట్';
  }

  @override
  String deletePageQuestion(int n) {
    return 'పేజీ $n ను తొలగించాలా?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$total లో పేజీ $n';
  }

  @override
  String get rotateLeft => 'ఎడమకు తిప్పు';

  @override
  String get rotateRight => 'కుడికి తిప్పు';

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
  String get undo => 'వెనక్కి';

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
  String get sign => 'సంతకం';

  @override
  String get copyText => 'టెక్స్ట్ కాపీ చేయి';

  @override
  String get shareImage => 'చిత్రాన్ని షేర్ చేయి';

  @override
  String get deletePage => 'పేజీని తొలగించు';

  @override
  String get signed => 'సంతకం అయింది.';

  @override
  String signPageN(int n) {
    return 'పేజీ $n పై సంతకం చేయి';
  }

  @override
  String get deleteThisSignature => 'ఈ సంతకాన్ని తొలగించు';

  @override
  String get newSignature => 'కొత్త సంతకం';

  @override
  String readingPage(int n, int total) {
    return 'పేజీ $n / $total చదువుతోంది';
  }

  @override
  String get ocrFailed => 'టెక్స్ట్ గుర్తింపు విఫలమైంది.';

  @override
  String ocrFailedWith(String error) {
    return 'టెక్స్ట్ గుర్తింపు విఫలమైంది: $error';
  }

  @override
  String get textSaved => 'టెక్స్ట్ సేవ్ అయింది.';

  @override
  String get text => 'టెక్స్ట్';

  @override
  String get copyAll => 'అన్నీ కాపీ చేయి';

  @override
  String get shareText => 'టెక్స్ట్ షేర్ చేయి';

  @override
  String get saveAsTxt => '.txt గా సేవ్ చేయి';

  @override
  String get readAgain => 'మళ్లీ చదువు';

  @override
  String get readAsLatin => 'ఇంగ్లీష్ / లాటిన్‌గా చదువు';

  @override
  String get readAsDevanagari => 'హిందీ / నేపాలీగా చదువు';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android లో టెక్స్ట్ మోడల్‌ను Google Play సేవలు ఒకసారి డౌన్‌లోడ్ చేస్తాయి. ఇది మొదటిసారి అయితే, ఒక నిమిషం వేచి ఉండి మళ్లీ ప్రయత్నించండి.';

  @override
  String get noTextFound => 'టెక్స్ట్ ఏదీ కనబడలేదు.';

  @override
  String pageSeparator(int n) {
    return '--- పేజీ $n ---';
  }

  @override
  String get scanner => 'స్కానర్';

  @override
  String get scanMode => 'స్కాన్ మోడ్';

  @override
  String get modeFull => 'పూర్తి: ఫిల్టర్లు + మరకలు, వేళ్లు తొలగింపు';

  @override
  String get modeFilter => 'ఫిల్టర్లు మాత్రమే';

  @override
  String get modeBase => 'ప్రాథమిక: క్రాప్, తిప్పడం మాత్రమే';

  @override
  String get allowGallery => 'గ్యాలరీ నుండి దిగుమతిని అనుమతించు';

  @override
  String get allowGalleryHint => 'స్కానర్ లోపల గ్యాలరీ బటన్ చూపిస్తుంది';

  @override
  String get pagesPerScan => 'ఒక్కో స్కాన్‌కు పేజీలు';

  @override
  String get iosScannerNote => 'iPhone లో స్కానర్ అంటే Apple సొంత పత్ర కెమెరా.';

  @override
  String get iosScannerNote2 =>
      'ఆటో క్యాప్చర్, అంచుల గుర్తింపు, రంగు మోడ్‌లు అందులోనే ఉంటాయి.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'పేజీ పరిమాణం';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'స్కాన్ ఆకారంలోనే';

  @override
  String get searchablePdf => 'శోధించగల PDF';

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
      'PDF లో వెతకడానికి, టెక్స్ట్ కాపీ చేయడానికి కనిపించని టెక్స్ట్ పొరను జోడిస్తుంది';

  @override
  String get textRecognition => 'టెక్స్ట్ గుర్తింపు';

  @override
  String get quality => 'నాణ్యత';

  @override
  String get qualityBest =>
      'ఉత్తమం: పూర్తి రిజల్యూషన్, చిన్న అక్షరాలను కూడా చదువుతుంది';

  @override
  String get qualityFast => 'వేగం: పేజీ యొక్క చిన్న కాపీ';

  @override
  String get language => 'భాష';

  @override
  String get scriptLatin => 'ఇంగ్లీష్ మరియు ఇతర లాటిన్ లిపి భాషలు';

  @override
  String get scriptDevanagari => 'హిందీ, నేపాలీ, మరాఠీ (+ లాటిన్)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'చైనీస్ (+ లాటిన్)';

  @override
  String get scriptJapanese => 'జపనీస్ (+ లాటిన్)';

  @override
  String get scriptKorean => 'కొరియన్ (+ లాటిన్)';

  @override
  String get readAsChinese => 'చైనీస్‌గా చదువు';

  @override
  String get readAsJapanese => 'జపనీస్‌గా చదువు';

  @override
  String get readAsKorean => 'కొరియన్‌గా చదువు';

  @override
  String get languageAuto => 'భాష స్వయంచాలకంగా గుర్తించబడుతుంది.';

  @override
  String get appearance => 'రూపం';

  @override
  String get theme => 'థీమ్';

  @override
  String get themeSystem => 'ఫోన్ ప్రకారం';

  @override
  String get themeLight => 'లేత';

  @override
  String get themeDark => 'ముదురు';

  @override
  String get about => 'గురించి';

  @override
  String get aboutPromise => 'ప్రకటనలు లేవు. ఖాతా లేదు. ట్రాకింగ్ లేదు.';

  @override
  String get aboutPromiseBody =>
      'మీరు షేర్ చేసే వరకు లేదా ఎగుమతి చేసే వరకు స్కాన్‌లు ఈ ఫోన్‌లోనే ఉంటాయి. యాప్ అన్‌ఇన్‌స్టాల్ చేస్తే అవి తొలగిపోతాయి, కాబట్టి ఉంచుకోవాలనుకున్నవి ఎగుమతి చేసుకోండి.';

  @override
  String get openSource => 'ఓపెన్ సోర్స్ (Apache-2.0)';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get opensInBrowser => 'మీ బ్రౌజర్‌లో తెరుచుకుంటుంది';

  @override
  String get aboutTechAndroid =>
      'స్కానింగ్ మరియు టెక్స్ట్ గుర్తింపు Google ML Kit ద్వారా (పరికరంలోనే). PDF విలీనం PDFBox-Android ద్వారా. దేవనాగరి ఫాంట్: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'స్కానింగ్ Apple VisionKit ద్వారా, టెక్స్ట్ గుర్తింపు Apple Vision ద్వారా (పరికరంలోనే). దేవనాగరి ఫాంట్: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url ను తెరవలేకపోయాం';
  }

  @override
  String get scanBusinessCard => 'బిజినెస్ కార్డ్ స్కాన్ చేయి';

  @override
  String get saveAsContact => 'కాంటాక్ట్‌గా సేవ్ చేయి';

  @override
  String get saveToContacts => 'కాంటాక్ట్‌లలో సేవ్ చేయి';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'బిజినెస్ కార్డ్';

  @override
  String get contactHint =>
      'ఫీల్డ్‌లను తనిఖీ చేసి, ఆపై సేవ్ చేయండి. మీ ఫోన్‌లోని కాంటాక్ట్‌లు యాప్ అన్నీ నింపబడి తెరుచుకుంటుంది.';

  @override
  String get readingCard => 'కార్డ్ చదువుతోంది…';

  @override
  String get nothingRecognised =>
      'ఈ కార్డ్‌లో టెక్స్ట్ ఏదీ గుర్తించబడలేదు. మీరు ఇప్పటికీ వివరాలను టైప్ చేయవచ్చు.';

  @override
  String get contactOpened =>
      'కాంటాక్ట్‌లు తెరుచుకుంది. ఉంచడానికి అక్కడ సేవ్ చేయి నొక్కండి.';

  @override
  String couldNotOpenContacts(String error) {
    return 'కాంటాక్ట్‌లను తెరవలేకపోయాం: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'కార్డ్ $stamp';
  }

  @override
  String get fieldCompany => 'కంపెనీ';

  @override
  String get fieldJobTitle => 'ఉద్యోగ హోదా';

  @override
  String get fieldMobile => 'మొబైల్';

  @override
  String get fieldPhone => 'ఫోన్';

  @override
  String get fieldFax => 'ఫ్యాక్స్';

  @override
  String get fieldEmail => 'ఇమెయిల్';

  @override
  String get fieldWebsite => 'వెబ్‌సైట్';

  @override
  String get fieldAddress => 'చిరునామా';

  @override
  String get fieldCity => 'నగరం';

  @override
  String get fieldCountry => 'దేశం';

  @override
  String get fieldNotes => 'గమనికలు';

  @override
  String get drawFirst => 'ముందుగా మీ సంతకం గీయండి.';

  @override
  String get clear => 'తుడిచివేయి';

  @override
  String get save => 'సేవ్ చేయి';

  @override
  String get signHint =>
      'పెట్టెలో వేలితో సంతకం చేయండి. ఎక్కువ స్థలం కోసం ఫోన్‌ను అడ్డంగా తిప్పండి.';

  @override
  String get thin => 'సన్నని';

  @override
  String get medium => 'మధ్యస్థం';

  @override
  String get thick => 'మందమైన';

  @override
  String couldNotReadPage(String error) {
    return 'పేజీని చదవలేకపోయాం: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'సంతకం చేయలేకపోయాం: $error';
  }

  @override
  String get placeSignature => 'సంతకాన్ని ఉంచు';

  @override
  String get apply => 'వర్తింపజేయి';

  @override
  String get dragPinchHint =>
      'కదపడానికి లాగండి. పరిమాణం మార్చడానికి పించ్ చేయండి.';

  @override
  String get smaller => 'చిన్నది';

  @override
  String get larger => 'పెద్దది';
}
