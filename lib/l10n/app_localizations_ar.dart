// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'مسح';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'حسناً';

  @override
  String get close => 'إغلاق';

  @override
  String get delete => 'حذف';

  @override
  String get share => 'مشاركة';

  @override
  String get copy => 'نسخ';

  @override
  String get copied => 'تم النسخ.';

  @override
  String get saved => 'تم الحفظ.';

  @override
  String get name => 'الاسم';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get settings => 'الإعدادات';

  @override
  String get dismiss => 'تجاهل';

  @override
  String get tryAgain => 'أعد المحاولة';

  @override
  String get cannotBeUndone => 'لا يمكن التراجع عن هذا.';

  @override
  String get savingPages => 'جارٍ حفظ الصفحات…';

  @override
  String get preparingScanner =>
      'جارٍ تجهيز الماسح…\nعند أول استخدام تنزّله خدمات Google Play مرة واحدة.';

  @override
  String get scannerUnavailable => 'الماسح غير متاح.';

  @override
  String scannerUnavailableWith(String error) {
    return 'الماسح غير متاح: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'تعذّر حفظ الصفحات: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'تعذّر فتح منتقي الملفات: $error';
  }

  @override
  String get importingPdf => 'جارٍ استيراد PDF…';

  @override
  String get importedPdf => 'PDF مستورد';

  @override
  String couldNotImport(String error) {
    return 'تعذّر الاستيراد: $error';
  }

  @override
  String get pickTwoPdfs => 'اختر ملفّي PDF على الأقل.';

  @override
  String mergingPdfs(int count) {
    return 'جارٍ دمج $count من ملفات PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'مدمج $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'تعذّر الدمج: $error';
  }

  @override
  String get saveToFolder => 'حفظ في مجلد';

  @override
  String couldNotSave(String error) {
    return 'تعذّر الحفظ: $error';
  }

  @override
  String get mergedDocument => 'مستند مدمج';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count أخرى';
  }

  @override
  String get merging => 'جارٍ الدمج…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مستند؟',
      many: 'حذف $count مستندًا؟',
      few: 'حذف $count مستندات؟',
      two: 'حذف مستندين؟',
      one: 'حذف مستند واحد؟',
      zero: 'حذف $count مستندات؟',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'جارٍ إنشاء PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'جارٍ إنشاء PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'جارٍ إنشاء PDF، الصفحة $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'تعذّر إنشاء ملف PDF: $error';
  }

  @override
  String get searchDocuments => 'البحث في المستندات';

  @override
  String get closeSearch => 'إغلاق البحث';

  @override
  String get search => 'بحث';

  @override
  String get importPdfAsPages => 'استيراد PDF كصفحات';

  @override
  String get mergePdfFiles => 'دمج ملفات PDF';

  @override
  String get clearSelection => 'إلغاء التحديد';

  @override
  String nSelected(int count) {
    return 'تم تحديد $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'تم تحديد $count · الدمج بهذا الترتيب';
  }

  @override
  String get mergeIntoOne => 'دمج في مستند واحد';

  @override
  String get moveToFolder => 'نقل إلى مجلد';

  @override
  String get folderName => 'المجلد';

  @override
  String get moveToTop => 'النقل إلى المستوى الأعلى';

  @override
  String movedToFolder(int count, String folder) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم نقل $count إلى $folder',
      one: 'تم النقل إلى $folder',
    );
    return '$_temp0';
  }

  @override
  String movedToTop(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم نقل $count إلى المستوى الأعلى',
      one: 'تم النقل إلى المستوى الأعلى',
    );
    return '$_temp0';
  }

  @override
  String get shareAsPdf => 'مشاركة كملف PDF';

  @override
  String get selectAll => 'تحديد الكل';

  @override
  String get noScansYet => 'لا توجد مستندات ممسوحة بعد';

  @override
  String get nothingMatches => 'لا توجد نتائج مطابقة';

  @override
  String get emptyHint =>
      'اضغط «مسح» لتصوير مستند. كل شيء يبقى على هذا الهاتف.';

  @override
  String get tryAnotherWord => 'جرّب كلمة أخرى.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: '$count صفحات',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'مسح $stamp';
  }

  @override
  String get crashTitle => 'توقّف BRIDGE PHOTO بشكل غير متوقع';

  @override
  String get crashBody =>
      'تم حفظ تقرير بما حدث على هذا الهاتف فقط. مشاركته مع المطوّر تساعد في إصلاح المشكلة. يحتوي على تفاصيل تقنية وليس على مستنداتك.';

  @override
  String get reportCopied => 'تم نسخ التقرير.';

  @override
  String get crashReportSubject => 'تقرير تعطّل BRIDGE PHOTO';

  @override
  String get pdfSaved => 'تم حفظ PDF.';

  @override
  String couldNotSavePdf(String error) {
    return 'تعذّر حفظ ملف PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'تصدير الصفحات كصور';

  @override
  String get saveToPhotos => 'حفظ في الصور';

  @override
  String get savingToPhotos => 'جارٍ الحفظ في الصور…';

  @override
  String get photosNeedsAndroid10 =>
      'يتطلب الحفظ في الصور Android 10 أو أحدث. استخدم المشاركة بدلاً من ذلك.';

  @override
  String get photosNotAllowed =>
      'غير مسموح لتطبيق BRIDGE PHOTO بالإضافة إلى الصور. اسمح بذلك في الإعدادات، أو استخدم المشاركة.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ $count صورة في الصور.',
      many: 'تم حفظ $count صورة في الصور.',
      few: 'تم حفظ $count صور في الصور.',
      two: 'تم حفظ صورتين في الصور.',
      one: 'تم حفظ صورة واحدة في الصور.',
      zero: 'لم تُحفظ أي صورة في الصور.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'تعذّر التصدير: $error';
  }

  @override
  String get deleteDocumentQuestion => 'حذف هذا المستند؟';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سيتم حذف $count صفحة. لا يمكن التراجع عن هذا.',
      many: 'سيتم حذف $count صفحة. لا يمكن التراجع عن هذا.',
      few: 'سيتم حذف $count صفحات. لا يمكن التراجع عن هذا.',
      two: 'سيتم حذف صفحتين. لا يمكن التراجع عن هذا.',
      one: 'سيتم حذف صفحة واحدة. لا يمكن التراجع عن هذا.',
      zero: 'سيتم حذف $count صفحات. لا يمكن التراجع عن هذا.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'النص (OCR)';

  @override
  String get sharePdf => 'مشاركة PDF';

  @override
  String get savePdfToFolder => 'حفظ PDF في مجلد';

  @override
  String get tidyPagesTitle => 'البحث عن الصفحات الفارغة والمكررة';

  @override
  String get splitDocumentTitle => 'تقسيم عند الصفحات الفارغة';

  @override
  String get noDividersFound => 'لا توجد فواصل فارغة';

  @override
  String splitDocumentBody(int count) {
    return 'ستصبح $count مستندات منفصلة. ستُحذف الصفحات الفاصلة.';
  }

  @override
  String get splittingDocument => 'جارٍ التقسيم...';

  @override
  String splitDone(int count) {
    return 'تم التقسيم إلى $count مستندات';
  }

  @override
  String get checkingPages => 'جارٍ فحص الصفحات...';

  @override
  String get nothingToTidy => 'لا شيء للحذف';

  @override
  String tidyFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات قد لا تريدها',
      one: 'صفحة قد لا تريدها',
    );
    return '$_temp0';
  }

  @override
  String pageN(int n) {
    return 'صفحة $n';
  }

  @override
  String get pageIsBlank => 'تبدو فارغة';

  @override
  String pageRepeats(int n) {
    return 'مثل الصفحة $n';
  }

  @override
  String get removeChosen => 'حذف المحدد';

  @override
  String pagesRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حذف $count صفحات',
      one: 'تم حذف صفحة',
    );
    return '$_temp0';
  }

  @override
  String get fitSizeTitle => 'حفظ PDF ضمن حد الحجم';

  @override
  String get fitSizeHint =>
      'للمواقع التي ترفض الملفات الكبيرة. مسحاتك لا تتغير.';

  @override
  String fittingSize(int n, int of) {
    return 'جارٍ التصغير… $n من $of';
  }

  @override
  String pdfSavedAtSize(String size) {
    return 'تم الحفظ، $size';
  }

  @override
  String pdfCouldNotFit(String size) {
    return 'تعذر الوصول للحد. تم الحفظ بحجم $size — وهو الأصغر الممكن.';
  }

  @override
  String get lockPdfTitle => 'حفظ PDF بكلمة مرور';

  @override
  String get lockPdfHint =>
      'سيطلب الملف هذه الكلمة عند الفتح. احتفظ بها — لا يمكن استرجاعها.';

  @override
  String get password => 'كلمة المرور';

  @override
  String get pdfSavedLocked => 'تم الحفظ. الملف يحتاج إلى كلمة المرور لفتحه.';

  @override
  String get exportAsImages => 'تصدير كـ JPEG / PNG';

  @override
  String get oneSheetTitle => 'صفحات في ورقة واحدة';

  @override
  String get oneSheetHint =>
      'اضغط على الوجه ثم الظهر. سيظهران في صفحة واحدة قابلة للطباعة، وتبقى الصفحات كما هي.';

  @override
  String get makeTheSheet => 'إنشاء الصفحة';

  @override
  String get makingSheet => 'جارٍ الإنشاء…';

  @override
  String get sheetAdded => 'تمت إضافة الصفحة في النهاية';

  @override
  String couldNotMakeSheet(String error) {
    return 'تعذر إنشاء الصفحة: $error';
  }

  @override
  String get deleteDocument => 'حذف المستند';

  @override
  String get noPages => 'لا توجد صفحات. اضغط «إضافة صفحات».';

  @override
  String get addPages => 'إضافة صفحات';

  @override
  String get holdToReorder => 'اضغط مطولاً على صفحة لإعادة الترتيب';

  @override
  String get savePdfDialogTitle => 'حفظ PDF';

  @override
  String get saveDialogTitle => 'حفظ';

  @override
  String couldNotRotate(String error) {
    return 'تعذّر التدوير: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'تعذّرت المشاركة: $error';
  }

  @override
  String get noTextOnPage => 'لم يُعثر على نص في هذه الصفحة.';

  @override
  String pageNText(int n) {
    return 'نص الصفحة $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'حذف الصفحة $n؟';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'الصفحة $n من $total';
  }

  @override
  String get rotateLeft => 'تدوير لليسار';

  @override
  String get rotateRight => 'تدوير لليمين';

  @override
  String get splitBookTitle => 'تقسيم صفحة الكتاب';

  @override
  String get splitBookHint =>
      'صورة واحدة لكتاب مفتوح تصبح صفحتين، مقسومتين عند الطي. أي جانب يأتي أولاً؟';

  @override
  String get leftPageFirst => 'اليسار أولاً';

  @override
  String get rightPageFirst => 'اليمين أولاً';

  @override
  String get splitAtTheFold => 'تم التقسيم عند الطي';

  @override
  String get splitInTheMiddle => 'لم يُعثر على طي — تم التقسيم من المنتصف';

  @override
  String couldNotSplit(String error) {
    return 'تعذر تقسيم الصفحة: $error';
  }

  @override
  String get redactTitle => 'إخفاء نهائي';

  @override
  String get hideIdTitle => 'إخفاء رقم الهوية';

  @override
  String get noIdNumbersFound => 'لم يُعثر على رقم هوية';

  @override
  String idNumbersFound(int count, String masked) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'وُجد $count — الأول سيظهر $masked',
      one: 'وُجد رقم — سيظهر $masked',
    );
    return '$_temp0';
  }

  @override
  String get redactHint => 'اسحب فوق كل ما يجب ألا يُقرأ.';

  @override
  String redactCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مناطق مخفاة',
      one: 'منطقة واحدة مخفاة',
    );
    return '$_temp0';
  }

  @override
  String get redactApply => 'إخفاء نهائي';

  @override
  String get redactConfirmTitle => 'لا يمكن التراجع';

  @override
  String get redactConfirmBody =>
      'تُزال الأجزاء المخفاة من الصورة نفسها، ويُحذف النص المستخرج، وتُحذف النسخة الأصلية. هذا ما يجعل المشاركة آمنة — ويعني أنه لا سبيل للعودة.';

  @override
  String get redacted => 'تم الإخفاء. ما كان تحته اختفى.';

  @override
  String couldNotRedact(String error) {
    return 'تعذر الإخفاء: $error';
  }

  @override
  String get undo => 'تراجع';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get enhanceTitle => 'تنظيف الصفحة';

  @override
  String get enhanceAuto => 'تلقائي — موازنة الإضاءة';

  @override
  String get enhanceGrey => 'تدرج رمادي';

  @override
  String get enhanceBw => 'أبيض وأسود — للنص فقط';

  @override
  String get enhanceWhiteboard => 'Whiteboard — bring the marker back';

  @override
  String get enhanceBleed => 'Remove show-through from the back';

  @override
  String get enhanceOriginal => 'المسح الأصلي';

  @override
  String straightenedBy(String degrees) {
    return 'تم التقويم بمقدار $degrees°';
  }

  @override
  String couldNotEnhance(String error) {
    return 'تعذر تنظيف الصفحة: $error';
  }

  @override
  String get sign => 'توقيع';

  @override
  String get copyText => 'نسخ النص';

  @override
  String get shareImage => 'مشاركة الصورة';

  @override
  String get deletePage => 'حذف الصفحة';

  @override
  String get signed => 'تم التوقيع.';

  @override
  String signPageN(int n) {
    return 'توقيع الصفحة $n';
  }

  @override
  String get deleteThisSignature => 'حذف هذا التوقيع';

  @override
  String get newSignature => 'توقيع جديد';

  @override
  String readingPage(int n, int total) {
    return 'جارٍ قراءة الصفحة $n / $total';
  }

  @override
  String get ocrFailed => 'فشل التعرّف على النص.';

  @override
  String ocrFailedWith(String error) {
    return 'فشل التعرّف على النص: $error';
  }

  @override
  String get textSaved => 'تم حفظ النص.';

  @override
  String get text => 'النص';

  @override
  String get copyAll => 'نسخ الكل';

  @override
  String get shareText => 'مشاركة النص';

  @override
  String get saveAsTxt => 'حفظ كملف ‎.txt';

  @override
  String get saveAsWord => 'حفظ كملف Word';

  @override
  String get saveAsExcel => 'حفظ كجدول';

  @override
  String get readAgain => 'إعادة القراءة';

  @override
  String get readAsLatin => 'قراءة كإنجليزية / لاتينية';

  @override
  String get readAsDevanagari => 'قراءة كهندية / نيبالية';

  @override
  String get readAsArabic => 'قراءة كالعربية';

  @override
  String get ocrModelHint =>
      'على Android تنزّل خدمات Google Play نموذج النص مرة واحدة. إذا كان هذا أول استخدام، انتظر دقيقة ثم أعد المحاولة.';

  @override
  String get noTextFound => 'لم يُعثر على أي نص.';

  @override
  String pageSeparator(int n) {
    return '--- الصفحة $n ---';
  }

  @override
  String get scanner => 'الماسح';

  @override
  String get scanMode => 'وضع المسح';

  @override
  String get modeFull => 'كامل: فلاتر + إزالة البقع والأصابع';

  @override
  String get modeFilter => 'الفلاتر فقط';

  @override
  String get modeBase => 'أساسي: قص وتدوير فقط';

  @override
  String get allowGallery => 'السماح بالاستيراد من المعرض';

  @override
  String get allowGalleryHint => 'يعرض زر المعرض داخل الماسح';

  @override
  String get pagesPerScan => 'عدد الصفحات لكل مسح';

  @override
  String get iosScannerNote =>
      'على iPhone الماسح هو كاميرا المستندات الخاصة بشركة Apple.';

  @override
  String get iosScannerNote2 =>
      'الالتقاط التلقائي واكتشاف الحواف وأوضاع الألوان مدمجة فيه.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'حجم الصفحة';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'بنفس شكل المسح';

  @override
  String get searchablePdf => 'PDF قابل للبحث';

  @override
  String get autoName => 'تسمية المسح من الصفحة';

  @override
  String get autoNameHint =>
      'يقرأ التاريخ ونوع المستند ورقمه من الصفحة. لا يغير اسماً اخترته أنت.';

  @override
  String get numberPages => 'ترقيم الصفحات';

  @override
  String get numberPagesHint => 'يضع 1 / 3 أسفل كل صفحة مُصدَّرة.';

  @override
  String get stampText => 'ختم على كل صفحة';

  @override
  String get stampHint =>
      'كلمات تُطبع بخفوت على كل صفحة — نسخة، اسم الشركة. اتركها فارغة لإلغاء الختم.';

  @override
  String get stampNone => 'بلا ختم';

  @override
  String get searchablePdfHint =>
      'يضيف طبقة نص غير مرئية ليمكن البحث في ملف PDF ونسخ النص';

  @override
  String get textRecognition => 'التعرّف على النص';

  @override
  String get quality => 'الجودة';

  @override
  String get qualityBest => 'الأفضل: دقة كاملة، يقرأ الخط الصغير';

  @override
  String get qualityFast => 'سريع: نسخة أصغر من الصفحة';

  @override
  String get language => 'اللغة';

  @override
  String get scriptLatin => 'الإنجليزية واللغات الأخرى ذات الحروف اللاتينية';

  @override
  String get scriptDevanagari => 'الهندية والنيبالية والماراثية (+ اللاتينية)';

  @override
  String get scriptArabic => 'العربية (+ اللاتينية)';

  @override
  String get scriptChinese => 'الصينية (+ اللاتينية)';

  @override
  String get scriptJapanese => 'اليابانية (+ اللاتينية)';

  @override
  String get scriptKorean => 'الكورية (+ اللاتينية)';

  @override
  String get readAsChinese => 'قراءة كصينية';

  @override
  String get readAsJapanese => 'قراءة كيابانية';

  @override
  String get readAsKorean => 'قراءة ككورية';

  @override
  String get languageAuto => 'يتم اكتشاف اللغة تلقائياً.';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get themeSystem => 'حسب إعدادات الهاتف';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get about => 'حول';

  @override
  String get aboutPromise => 'بلا إعلانات. بلا حساب. بلا تتبّع.';

  @override
  String get aboutPromiseBody =>
      'تبقى المستندات الممسوحة على هذا الهاتف ما لم تشاركها أو تصدّرها. إلغاء تثبيت التطبيق يحذفها، لذا صدّر ما تريد الاحتفاظ به.';

  @override
  String get openSource => 'مفتوح المصدر (Apache-2.0)';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get opensInBrowser => 'يُفتح في المتصفح';

  @override
  String get aboutTechAndroid =>
      'المسح والتعرّف على النص بواسطة Google ML Kit (على الجهاز). دمج PDF بواسطة PDFBox-Android. خط الديفاناغاري: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'المسح بواسطة Apple VisionKit، والتعرّف على النص بواسطة Apple Vision (على الجهاز). خط الديفاناغاري: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'تعذّر فتح $url';
  }

  @override
  String get scanBusinessCard => 'مسح بطاقة عمل';

  @override
  String get saveAsContact => 'حفظ كجهة اتصال';

  @override
  String get saveToContacts => 'حفظ في جهات الاتصال';

  @override
  String get includeCardPhoto => 'إضافة صورة البطاقة';

  @override
  String get contactReviewTitle => 'بطاقة عمل';

  @override
  String get contactHint =>
      'تحقّق من الحقول ثم احفظ. سيُفتح تطبيق جهات الاتصال في هاتفك وقد تمت تعبئة كل شيء.';

  @override
  String get readingCard => 'جارٍ قراءة البطاقة…';

  @override
  String get nothingRecognised =>
      'لم يتم التعرّف على أي نص في هذه البطاقة. لا يزال بإمكانك كتابة التفاصيل.';

  @override
  String get contactOpened =>
      'تم فتح جهات الاتصال. اضغط «حفظ» هناك للاحتفاظ بها.';

  @override
  String couldNotOpenContacts(String error) {
    return 'تعذّر فتح جهات الاتصال: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'بطاقة $stamp';
  }

  @override
  String get fieldCompany => 'الشركة';

  @override
  String get fieldJobTitle => 'المسمى الوظيفي';

  @override
  String get fieldMobile => 'الجوّال';

  @override
  String get fieldPhone => 'الهاتف';

  @override
  String get fieldFax => 'الفاكس';

  @override
  String get fieldEmail => 'البريد الإلكتروني';

  @override
  String get fieldWebsite => 'الموقع الإلكتروني';

  @override
  String get fieldAddress => 'العنوان';

  @override
  String get fieldCity => 'المدينة';

  @override
  String get fieldCountry => 'البلد';

  @override
  String get fieldNotes => 'ملاحظات';

  @override
  String get drawFirst => 'ارسم توقيعك أولاً.';

  @override
  String get clear => 'محو';

  @override
  String get save => 'حفظ';

  @override
  String get signHint =>
      'وقّع داخل المربع بإصبعك. أدر الهاتف جانبياً لمساحة أكبر.';

  @override
  String get thin => 'رفيع';

  @override
  String get medium => 'متوسط';

  @override
  String get thick => 'سميك';

  @override
  String couldNotReadPage(String error) {
    return 'تعذّرت قراءة الصفحة: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'تعذّر التوقيع: $error';
  }

  @override
  String get placeSignature => 'وضع التوقيع';

  @override
  String get apply => 'تطبيق';

  @override
  String get dragPinchHint => 'اسحب للتحريك. قرّب بإصبعين لتغيير الحجم.';

  @override
  String get smaller => 'أصغر';

  @override
  String get larger => 'أكبر';
}
