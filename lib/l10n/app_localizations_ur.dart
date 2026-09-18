// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'اسکین';

  @override
  String get cancel => 'منسوخ';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get close => 'بند کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get copy => 'کاپی';

  @override
  String get copied => 'کاپی ہو گیا۔';

  @override
  String get saved => 'محفوظ ہو گیا۔';

  @override
  String get name => 'نام';

  @override
  String get rename => 'نام بدلیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get dismiss => 'نظرانداز کریں';

  @override
  String get tryAgain => 'دوبارہ کوشش کریں';

  @override
  String get cannotBeUndone => 'یہ واپس نہیں ہو سکتا۔';

  @override
  String get savingPages => 'صفحات محفوظ ہو رہے ہیں…';

  @override
  String get preparingScanner =>
      'اسکینر تیار ہو رہا ہے…\nپہلی بار استعمال پر Google Play سروسز اسے ایک بار ڈاؤن لوڈ کرتی ہیں۔';

  @override
  String get scannerUnavailable => 'اسکینر دستیاب نہیں ہے۔';

  @override
  String scannerUnavailableWith(String error) {
    return 'اسکینر دستیاب نہیں ہے: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'صفحات محفوظ نہیں ہو سکے: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'فائل منتخب کنندہ نہیں کھل سکا: $error';
  }

  @override
  String get importingPdf => 'PDF درآمد ہو رہی ہے…';

  @override
  String get importedPdf => 'درآمد شدہ PDF';

  @override
  String couldNotImport(String error) {
    return 'درآمد نہیں ہو سکی: $error';
  }

  @override
  String get pickTwoPdfs => 'کم از کم دو PDF فائلیں منتخب کریں۔';

  @override
  String mergingPdfs(int count) {
    return '$count PDF فائلیں ضم ہو رہی ہیں…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ضم شدہ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ضم نہیں ہو سکا: $error';
  }

  @override
  String get saveToFolder => 'فولڈر میں محفوظ کریں';

  @override
  String couldNotSave(String error) {
    return 'محفوظ نہیں ہو سکا: $error';
  }

  @override
  String get mergedDocument => 'ضم شدہ دستاویز';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count مزید';
  }

  @override
  String get merging => 'ضم ہو رہا ہے…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دستاویزات حذف کریں؟',
      one: 'ایک دستاویز حذف کریں؟',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF بن رہی ہے…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF بن رہی ہے $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF بن رہی ہے، صفحہ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF نہیں بن سکی: $error';
  }

  @override
  String get searchDocuments => 'دستاویزات تلاش کریں';

  @override
  String get closeSearch => 'تلاش بند کریں';

  @override
  String get search => 'تلاش';

  @override
  String get importPdfAsPages => 'PDF کو صفحات کے طور پر درآمد کریں';

  @override
  String get mergePdfFiles => 'PDF فائلیں ضم کریں';

  @override
  String get clearSelection => 'انتخاب ہٹائیں';

  @override
  String nSelected(int count) {
    return '$count منتخب';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count منتخب · اسی ترتیب سے ضم ہوں گی';
  }

  @override
  String get mergeIntoOne => 'ایک دستاویز میں ضم کریں';

  @override
  String get shareAsPdf => 'PDF کے طور پر شیئر کریں';

  @override
  String get selectAll => 'سب منتخب کریں';

  @override
  String get noScansYet => 'ابھی کوئی اسکین نہیں';

  @override
  String get nothingMatches => 'کچھ نہیں ملا';

  @override
  String get emptyHint =>
      'دستاویز کی تصویر لینے کے لیے «اسکین» دبائیں۔ سب کچھ اسی فون پر رہتا ہے۔';

  @override
  String get tryAnotherWord => 'کوئی اور لفظ آزمائیں۔';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: 'ایک صفحہ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'اسکین $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO غیر متوقع طور پر بند ہو گیا';

  @override
  String get crashBody =>
      'خرابی کی رپورٹ صرف اسی فون پر محفوظ کی گئی ہے۔ اسے ڈویلپر کے ساتھ شیئر کرنے سے مسئلہ حل کرنے میں مدد ملتی ہے۔ اس میں تکنیکی تفصیلات ہیں، آپ کی دستاویزات نہیں۔';

  @override
  String get reportCopied => 'رپورٹ کاپی ہو گئی۔';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO کریش رپورٹ';

  @override
  String get pdfSaved => 'PDF محفوظ ہو گئی۔';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF محفوظ نہیں ہو سکی: $error';
  }

  @override
  String get exportPagesAsImages => 'صفحات کو تصاویر کے طور پر برآمد کریں';

  @override
  String get saveToPhotos => 'فوٹوز میں محفوظ کریں';

  @override
  String get savingToPhotos => 'فوٹوز میں محفوظ ہو رہا ہے…';

  @override
  String get photosNeedsAndroid10 =>
      'فوٹوز میں محفوظ کرنے کے لیے Android 10 یا اس سے نیا درکار ہے۔ اس کے بجائے شیئر استعمال کریں۔';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO کو فوٹوز میں شامل کرنے کی اجازت نہیں ہے۔ ترتیبات میں اجازت دیں، یا شیئر استعمال کریں۔';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر فوٹوز میں محفوظ ہو گئیں۔',
      one: 'ایک تصویر فوٹوز میں محفوظ ہو گئی۔',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'برآمد نہیں ہو سکا: $error';
  }

  @override
  String get deleteDocumentQuestion => 'یہ دستاویز حذف کریں؟';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات حذف ہو جائیں گے۔ یہ واپس نہیں ہو سکتا۔',
      one: 'ایک صفحہ حذف ہو جائے گا۔ یہ واپس نہیں ہو سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'متن (OCR)';

  @override
  String get sharePdf => 'PDF شیئر کریں';

  @override
  String get savePdfToFolder => 'PDF فولڈر میں محفوظ کریں';

  @override
  String get exportAsImages => 'JPEG / PNG کے طور پر برآمد کریں';

  @override
  String get deleteDocument => 'دستاویز حذف کریں';

  @override
  String get noPages => 'کوئی صفحہ نہیں۔ «صفحات شامل کریں» دبائیں۔';

  @override
  String get addPages => 'صفحات شامل کریں';

  @override
  String get holdToReorder => 'ترتیب بدلنے کے لیے صفحے کو دبائے رکھیں';

  @override
  String get savePdfDialogTitle => 'PDF محفوظ کریں';

  @override
  String get saveDialogTitle => 'محفوظ کریں';

  @override
  String couldNotRotate(String error) {
    return 'گھمایا نہیں جا سکا: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'شیئر نہیں ہو سکا: $error';
  }

  @override
  String get noTextOnPage => 'اس صفحے پر کوئی متن نہیں ملا۔';

  @override
  String pageNText(int n) {
    return 'صفحہ $n کا متن';
  }

  @override
  String deletePageQuestion(int n) {
    return 'صفحہ $n حذف کریں؟';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'صفحہ $n از $total';
  }

  @override
  String get rotateLeft => 'بائیں گھمائیں';

  @override
  String get rotateRight => 'دائیں گھمائیں';

  @override
  String get sign => 'دستخط';

  @override
  String get copyText => 'متن کاپی کریں';

  @override
  String get shareImage => 'تصویر شیئر کریں';

  @override
  String get deletePage => 'صفحہ حذف کریں';

  @override
  String get signed => 'دستخط ہو گئے۔';

  @override
  String signPageN(int n) {
    return 'صفحہ $n پر دستخط کریں';
  }

  @override
  String get deleteThisSignature => 'یہ دستخط حذف کریں';

  @override
  String get newSignature => 'نئے دستخط';

  @override
  String readingPage(int n, int total) {
    return 'صفحہ $n / $total پڑھا جا رہا ہے';
  }

  @override
  String get ocrFailed => 'متن کی شناخت ناکام ہو گئی۔';

  @override
  String ocrFailedWith(String error) {
    return 'متن کی شناخت ناکام ہو گئی: $error';
  }

  @override
  String get textSaved => 'متن محفوظ ہو گیا۔';

  @override
  String get text => 'متن';

  @override
  String get copyAll => 'سب کاپی کریں';

  @override
  String get shareText => 'متن شیئر کریں';

  @override
  String get saveAsTxt => '‎.txt کے طور پر محفوظ کریں';

  @override
  String get readAgain => 'دوبارہ پڑھیں';

  @override
  String get readAsLatin => 'انگریزی / لاطینی کے طور پر پڑھیں';

  @override
  String get readAsDevanagari => 'ہندی / نیپالی کے طور پر پڑھیں';

  @override
  String get ocrModelHint =>
      'Android پر متن کا ماڈل Google Play سروسز ایک بار ڈاؤن لوڈ کرتی ہیں۔ اگر یہ پہلا استعمال ہے تو ایک منٹ انتظار کریں اور دوبارہ کوشش کریں۔';

  @override
  String get noTextFound => 'کوئی متن نہیں ملا۔';

  @override
  String pageSeparator(int n) {
    return '--- صفحہ $n ---';
  }

  @override
  String get scanner => 'اسکینر';

  @override
  String get scanMode => 'اسکین موڈ';

  @override
  String get modeFull => 'مکمل: فلٹرز + دھبے اور انگلیاں صاف کریں';

  @override
  String get modeFilter => 'صرف فلٹرز';

  @override
  String get modeBase => 'بنیادی: صرف کراپ اور گھمانا';

  @override
  String get allowGallery => 'گیلری سے درآمد کی اجازت دیں';

  @override
  String get allowGalleryHint => 'اسکینر کے اندر گیلری کا بٹن دکھاتا ہے';

  @override
  String get pagesPerScan => 'فی اسکین صفحات';

  @override
  String get iosScannerNote =>
      'iPhone پر اسکینر Apple کا اپنا دستاویزی کیمرہ ہے۔';

  @override
  String get iosScannerNote2 =>
      'خودکار کیپچر، کناروں کی شناخت اور رنگ کے موڈ اس میں شامل ہیں۔';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'صفحے کا سائز';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'اسکین جیسی شکل';

  @override
  String get searchablePdf => 'قابلِ تلاش PDF';

  @override
  String get searchablePdfHint =>
      'ایک غیر مرئی متن کی تہہ شامل کرتا ہے تاکہ PDF میں تلاش اور متن کاپی کیا جا سکے';

  @override
  String get textRecognition => 'متن کی شناخت';

  @override
  String get quality => 'معیار';

  @override
  String get qualityBest => 'بہترین: مکمل ریزولوشن، باریک تحریر پڑھتا ہے';

  @override
  String get qualityFast => 'تیز: صفحے کی چھوٹی نقل';

  @override
  String get language => 'زبان';

  @override
  String get scriptLatin => 'انگریزی اور لاطینی رسم الخط کی دیگر زبانیں';

  @override
  String get scriptDevanagari => 'ہندی، نیپالی، مراٹھی (+ لاطینی)';

  @override
  String get scriptChinese => 'چینی (+ لاطینی)';

  @override
  String get scriptJapanese => 'جاپانی (+ لاطینی)';

  @override
  String get scriptKorean => 'کوریائی (+ لاطینی)';

  @override
  String get readAsChinese => 'چینی کے طور پر پڑھیں';

  @override
  String get readAsJapanese => 'جاپانی کے طور پر پڑھیں';

  @override
  String get readAsKorean => 'کوریائی کے طور پر پڑھیں';

  @override
  String get languageAuto => 'زبان خودکار طور پر شناخت ہو جاتی ہے۔';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get theme => 'تھیم';

  @override
  String get themeSystem => 'فون کے مطابق';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'گہرا';

  @override
  String get about => 'تعارف';

  @override
  String get aboutPromise => 'نہ اشتہار۔ نہ اکاؤنٹ۔ نہ ٹریکنگ۔';

  @override
  String get aboutPromiseBody =>
      'اسکین اسی فون پر رہتے ہیں جب تک آپ انہیں شیئر یا برآمد نہ کریں۔ ایپ ان انسٹال کرنے سے وہ حذف ہو جاتے ہیں، اس لیے جو رکھنا ہو اسے برآمد کر لیں۔';

  @override
  String get openSource => 'اوپن سورس (Apache-2.0)';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get opensInBrowser => 'آپ کے براؤزر میں کھلتا ہے';

  @override
  String get aboutTechAndroid =>
      'اسکیننگ اور متن کی شناخت Google ML Kit سے (ڈیوائس پر)۔ PDF ضم PDFBox-Android سے۔ دیوناگری فونٹ: Noto (OFL)۔';

  @override
  String get aboutTechIos =>
      'اسکیننگ Apple VisionKit سے، متن کی شناخت Apple Vision سے (ڈیوائس پر)۔ دیوناگری فونٹ: Noto (OFL)۔';

  @override
  String couldNotOpenUrl(String url) {
    return '$url نہیں کھل سکا';
  }

  @override
  String get scanBusinessCard => 'بزنس کارڈ اسکین کریں';

  @override
  String get saveAsContact => 'بطور رابطہ محفوظ کریں';

  @override
  String get saveToContacts => 'رابطوں میں محفوظ کریں';

  @override
  String get photoToContact => 'Put the card photo on the contact';

  @override
  String get contactReviewTitle => 'بزنس کارڈ';

  @override
  String get contactHint =>
      'فیلڈز چیک کریں، پھر محفوظ کریں۔ آپ کے فون کی رابطے ایپ سب کچھ بھرا ہوا کھلے گی۔';

  @override
  String get readingCard => 'کارڈ پڑھا جا رہا ہے…';

  @override
  String get nothingRecognised =>
      'اس کارڈ پر کوئی متن نہیں پہچانا گیا۔ آپ پھر بھی تفصیلات ٹائپ کر سکتے ہیں۔';

  @override
  String get contactOpened =>
      'رابطے کھل گئے۔ رکھنے کے لیے وہاں «محفوظ کریں» دبائیں۔';

  @override
  String couldNotOpenContacts(String error) {
    return 'رابطے نہیں کھل سکے: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'کارڈ $stamp';
  }

  @override
  String get fieldCompany => 'کمپنی';

  @override
  String get fieldJobTitle => 'عہدہ';

  @override
  String get fieldMobile => 'موبائل';

  @override
  String get fieldPhone => 'فون';

  @override
  String get fieldFax => 'فیکس';

  @override
  String get fieldEmail => 'ای میل';

  @override
  String get fieldWebsite => 'ویب سائٹ';

  @override
  String get fieldAddress => 'پتہ';

  @override
  String get fieldCity => 'شہر';

  @override
  String get fieldCountry => 'ملک';

  @override
  String get fieldNotes => 'نوٹس';

  @override
  String get drawFirst => 'پہلے اپنے دستخط بنائیں۔';

  @override
  String get clear => 'صاف کریں';

  @override
  String get undo => 'واپس لیں';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get signHint =>
      'خانے میں انگلی سے دستخط کریں۔ زیادہ جگہ کے لیے فون کو افقی کر لیں۔';

  @override
  String get thin => 'باریک';

  @override
  String get medium => 'درمیانہ';

  @override
  String get thick => 'موٹا';

  @override
  String couldNotReadPage(String error) {
    return 'صفحہ پڑھا نہیں جا سکا: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'دستخط نہیں ہو سکے: $error';
  }

  @override
  String get placeSignature => 'دستخط رکھیں';

  @override
  String get apply => 'لاگو کریں';

  @override
  String get dragPinchHint =>
      'ہلانے کے لیے گھسیٹیں۔ سائز بدلنے کے لیے دو انگلیوں سے پنچ کریں۔';

  @override
  String get smaller => 'چھوٹا';

  @override
  String get larger => 'بڑا';
}
