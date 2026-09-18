// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'اسکن';

  @override
  String get cancel => 'لغو';

  @override
  String get ok => 'تأیید';

  @override
  String get close => 'بستن';

  @override
  String get delete => 'حذف';

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String get copy => 'کپی';

  @override
  String get copied => 'کپی شد.';

  @override
  String get saved => 'ذخیره شد.';

  @override
  String get name => 'نام';

  @override
  String get rename => 'تغییر نام';

  @override
  String get settings => 'تنظیمات';

  @override
  String get dismiss => 'رد کردن';

  @override
  String get tryAgain => 'دوباره تلاش کنید';

  @override
  String get cannotBeUndone => 'این کار قابل بازگشت نیست.';

  @override
  String get savingPages => 'در حال ذخیره صفحه‌ها…';

  @override
  String get preparingScanner =>
      'در حال آماده‌سازی اسکنر…\nدر اولین استفاده، خدمات Google Play آن را یک بار دانلود می‌کند.';

  @override
  String get scannerUnavailable => 'اسکنر در دسترس نیست.';

  @override
  String scannerUnavailableWith(String error) {
    return 'اسکنر در دسترس نیست: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'صفحه‌ها ذخیره نشدند: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'انتخابگر فایل باز نشد: $error';
  }

  @override
  String get importingPdf => 'در حال وارد کردن PDF…';

  @override
  String get importedPdf => 'PDF واردشده';

  @override
  String couldNotImport(String error) {
    return 'وارد کردن انجام نشد: $error';
  }

  @override
  String get pickTwoPdfs => 'دست‌کم دو فایل PDF انتخاب کنید.';

  @override
  String mergingPdfs(int count) {
    return 'در حال ادغام $count فایل PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ادغام‌شده $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ادغام انجام نشد: $error';
  }

  @override
  String get saveToFolder => 'ذخیره در پوشه';

  @override
  String couldNotSave(String error) {
    return 'ذخیره انجام نشد: $error';
  }

  @override
  String get mergedDocument => 'سند ادغام‌شده';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count مورد دیگر';
  }

  @override
  String get merging => 'در حال ادغام…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سند حذف شود؟',
      one: 'یک سند حذف شود؟',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'در حال ساخت PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'در حال ساخت PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'در حال ساخت PDF، صفحه $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'ساخت PDF انجام نشد: $error';
  }

  @override
  String get searchDocuments => 'جستجوی اسناد';

  @override
  String get closeSearch => 'بستن جستجو';

  @override
  String get search => 'جستجو';

  @override
  String get importPdfAsPages => 'وارد کردن PDF به‌صورت صفحه';

  @override
  String get mergePdfFiles => 'ادغام فایل‌های PDF';

  @override
  String get clearSelection => 'لغو انتخاب';

  @override
  String nSelected(int count) {
    return '$count مورد انتخاب شد';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count مورد انتخاب شد · ادغام به همین ترتیب';
  }

  @override
  String get mergeIntoOne => 'ادغام در یک سند';

  @override
  String get shareAsPdf => 'اشتراک‌گذاری به‌صورت PDF';

  @override
  String get selectAll => 'انتخاب همه';

  @override
  String get noScansYet => 'هنوز اسکنی وجود ندارد';

  @override
  String get nothingMatches => 'موردی یافت نشد';

  @override
  String get emptyHint =>
      'برای عکس گرفتن از سند، «اسکن» را بزنید. همه‌چیز روی همین گوشی می‌ماند.';

  @override
  String get tryAnotherWord => 'کلمه دیگری را امتحان کنید.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحه',
      one: 'یک صفحه',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'اسکن $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO به‌طور غیرمنتظره بسته شد';

  @override
  String get crashBody =>
      'گزارشی از مشکل فقط روی همین گوشی ذخیره شد. اشتراک‌گذاری آن با توسعه‌دهنده به رفع مشکل کمک می‌کند. این گزارش شامل جزئیات فنی است، نه اسناد شما.';

  @override
  String get reportCopied => 'گزارش کپی شد.';

  @override
  String get crashReportSubject => 'گزارش خرابی BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF ذخیره شد.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF ذخیره نشد: $error';
  }

  @override
  String get exportPagesAsImages => 'خروجی صفحه‌ها به‌صورت تصویر';

  @override
  String get saveToPhotos => 'ذخیره در عکس‌ها';

  @override
  String get savingToPhotos => 'در حال ذخیره در عکس‌ها…';

  @override
  String get photosNeedsAndroid10 =>
      'ذخیره در عکس‌ها به Android 10 یا جدیدتر نیاز دارد. به‌جای آن از اشتراک‌گذاری استفاده کنید.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO اجازه افزودن به عکس‌ها را ندارد. در تنظیمات اجازه دهید یا از اشتراک‌گذاری استفاده کنید.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصویر در عکس‌ها ذخیره شد.',
      one: 'یک تصویر در عکس‌ها ذخیره شد.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'خروجی گرفتن انجام نشد: $error';
  }

  @override
  String get deleteDocumentQuestion => 'این سند حذف شود؟';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحه حذف خواهد شد. این کار قابل بازگشت نیست.',
      one: 'یک صفحه حذف خواهد شد. این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'متن (OCR)';

  @override
  String get sharePdf => 'اشتراک‌گذاری PDF';

  @override
  String get savePdfToFolder => 'ذخیره PDF در پوشه';

  @override
  String get exportAsImages => 'خروجی به‌صورت JPEG / PNG';

  @override
  String get deleteDocument => 'حذف سند';

  @override
  String get noPages => 'صفحه‌ای وجود ندارد. «افزودن صفحه» را بزنید.';

  @override
  String get addPages => 'افزودن صفحه';

  @override
  String get holdToReorder => 'برای جابه‌جایی، صفحه را نگه دارید';

  @override
  String get savePdfDialogTitle => 'ذخیره PDF';

  @override
  String get saveDialogTitle => 'ذخیره';

  @override
  String couldNotRotate(String error) {
    return 'چرخاندن انجام نشد: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'اشتراک‌گذاری انجام نشد: $error';
  }

  @override
  String get noTextOnPage => 'متنی در این صفحه یافت نشد.';

  @override
  String pageNText(int n) {
    return 'متن صفحه $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'صفحه $n حذف شود؟';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'صفحه $n از $total';
  }

  @override
  String get rotateLeft => 'چرخش به چپ';

  @override
  String get rotateRight => 'چرخش به راست';

  @override
  String get sign => 'امضا';

  @override
  String get copyText => 'کپی متن';

  @override
  String get shareImage => 'اشتراک‌گذاری تصویر';

  @override
  String get deletePage => 'حذف صفحه';

  @override
  String get signed => 'امضا شد.';

  @override
  String signPageN(int n) {
    return 'امضای صفحه $n';
  }

  @override
  String get deleteThisSignature => 'حذف این امضا';

  @override
  String get newSignature => 'امضای جدید';

  @override
  String readingPage(int n, int total) {
    return 'در حال خواندن صفحه $n / $total';
  }

  @override
  String get ocrFailed => 'تشخیص متن انجام نشد.';

  @override
  String ocrFailedWith(String error) {
    return 'تشخیص متن انجام نشد: $error';
  }

  @override
  String get textSaved => 'متن ذخیره شد.';

  @override
  String get text => 'متن';

  @override
  String get copyAll => 'کپی همه';

  @override
  String get shareText => 'اشتراک‌گذاری متن';

  @override
  String get saveAsTxt => 'ذخیره به‌صورت ‎.txt';

  @override
  String get readAgain => 'خواندن دوباره';

  @override
  String get readAsLatin => 'خواندن به‌صورت انگلیسی / لاتین';

  @override
  String get readAsDevanagari => 'خواندن به‌صورت هندی / نپالی';

  @override
  String get ocrModelHint =>
      'در Android مدل متن یک بار توسط خدمات Google Play دانلود می‌شود. اگر اولین استفاده است، یک دقیقه صبر کنید و دوباره تلاش کنید.';

  @override
  String get noTextFound => 'متنی یافت نشد.';

  @override
  String pageSeparator(int n) {
    return '--- صفحه $n ---';
  }

  @override
  String get scanner => 'اسکنر';

  @override
  String get scanMode => 'حالت اسکن';

  @override
  String get modeFull => 'کامل: فیلترها + پاک کردن لکه‌ها و انگشت‌ها';

  @override
  String get modeFilter => 'فقط فیلترها';

  @override
  String get modeBase => 'ساده: فقط برش و چرخش';

  @override
  String get allowGallery => 'اجازه وارد کردن از گالری';

  @override
  String get allowGalleryHint => 'دکمه گالری را داخل اسکنر نشان می‌دهد';

  @override
  String get pagesPerScan => 'تعداد صفحه در هر اسکن';

  @override
  String get iosScannerNote =>
      'در iPhone، اسکنر همان دوربین اسناد خود Apple است.';

  @override
  String get iosScannerNote2 =>
      'عکس‌برداری خودکار، تشخیص لبه‌ها و حالت‌های رنگی در آن تعبیه شده است.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'اندازه صفحه';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'هم‌شکل با اسکن';

  @override
  String get searchablePdf => 'PDF قابل جستجو';

  @override
  String get searchablePdfHint =>
      'یک لایه متن نامرئی اضافه می‌کند تا بتوان در PDF جستجو کرد و متن را کپی کرد';

  @override
  String get textRecognition => 'تشخیص متن';

  @override
  String get quality => 'کیفیت';

  @override
  String get qualityBest => 'بهترین: وضوح کامل، خواندن نوشته‌های ریز';

  @override
  String get qualityFast => 'سریع: نسخه کوچک‌تر صفحه';

  @override
  String get language => 'زبان';

  @override
  String get scriptLatin => 'انگلیسی و دیگر زبان‌های با خط لاتین';

  @override
  String get scriptDevanagari => 'هندی، نپالی، مراتی (+ لاتین)';

  @override
  String get scriptChinese => 'چینی (+ لاتین)';

  @override
  String get scriptJapanese => 'ژاپنی (+ لاتین)';

  @override
  String get scriptKorean => 'کره‌ای (+ لاتین)';

  @override
  String get readAsChinese => 'خواندن به‌صورت چینی';

  @override
  String get readAsJapanese => 'خواندن به‌صورت ژاپنی';

  @override
  String get readAsKorean => 'خواندن به‌صورت کره‌ای';

  @override
  String get languageAuto => 'زبان به‌طور خودکار تشخیص داده می‌شود.';

  @override
  String get appearance => 'ظاهر';

  @override
  String get theme => 'پوسته';

  @override
  String get themeSystem => 'مطابق گوشی';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تیره';

  @override
  String get about => 'درباره';

  @override
  String get aboutPromise => 'بدون تبلیغ. بدون حساب کاربری. بدون ردیابی.';

  @override
  String get aboutPromiseBody =>
      'اسکن‌ها روی همین گوشی می‌مانند، مگر اینکه آن‌ها را به اشتراک بگذارید یا خروجی بگیرید. حذف برنامه آن‌ها را پاک می‌کند؛ پس از آنچه می‌خواهید نگه دارید خروجی بگیرید.';

  @override
  String get openSource => 'متن‌باز (Apache-2.0)';

  @override
  String get privacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get opensInBrowser => 'در مرورگر باز می‌شود';

  @override
  String get aboutTechAndroid =>
      'اسکن و تشخیص متن با Google ML Kit (روی دستگاه). ادغام PDF با PDFBox-Android. فونت دوناگری: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'اسکن با Apple VisionKit، تشخیص متن با Apple Vision (روی دستگاه). فونت دوناگری: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url باز نشد';
  }

  @override
  String get scanBusinessCard => 'اسکن کارت ویزیت';

  @override
  String get saveAsContact => 'ذخیره به‌عنوان مخاطب';

  @override
  String get saveToContacts => 'ذخیره در مخاطبین';

  @override
  String get contactReviewTitle => 'کارت ویزیت';

  @override
  String get contactHint =>
      'فیلدها را بررسی و سپس ذخیره کنید. برنامه مخاطبین گوشی شما با همه اطلاعات پرشده باز می‌شود.';

  @override
  String get readingCard => 'در حال خواندن کارت…';

  @override
  String get nothingRecognised =>
      'متنی روی این کارت تشخیص داده نشد. همچنان می‌توانید اطلاعات را تایپ کنید.';

  @override
  String get contactOpened =>
      'مخاطبین باز شد. برای نگه داشتن، همان‌جا «ذخیره» را بزنید.';

  @override
  String couldNotOpenContacts(String error) {
    return 'مخاطبین باز نشد: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'کارت $stamp';
  }

  @override
  String get fieldCompany => 'شرکت';

  @override
  String get fieldJobTitle => 'عنوان شغلی';

  @override
  String get fieldMobile => 'تلفن همراه';

  @override
  String get fieldPhone => 'تلفن';

  @override
  String get fieldFax => 'فکس';

  @override
  String get fieldEmail => 'ایمیل';

  @override
  String get fieldWebsite => 'وب‌سایت';

  @override
  String get fieldAddress => 'نشانی';

  @override
  String get fieldCity => 'شهر';

  @override
  String get fieldCountry => 'کشور';

  @override
  String get fieldNotes => 'یادداشت‌ها';

  @override
  String get drawFirst => 'ابتدا امضای خود را بکشید.';

  @override
  String get clear => 'پاک کردن';

  @override
  String get undo => 'واگرد';

  @override
  String get save => 'ذخیره';

  @override
  String get signHint =>
      'با انگشت خود داخل کادر امضا کنید. برای فضای بیشتر گوشی را افقی بگیرید.';

  @override
  String get thin => 'نازک';

  @override
  String get medium => 'متوسط';

  @override
  String get thick => 'ضخیم';

  @override
  String couldNotReadPage(String error) {
    return 'صفحه خوانده نشد: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'امضا انجام نشد: $error';
  }

  @override
  String get placeSignature => 'قرار دادن امضا';

  @override
  String get apply => 'اعمال';

  @override
  String get dragPinchHint =>
      'برای جابه‌جایی بکشید. برای تغییر اندازه با دو انگشت بکشید.';

  @override
  String get smaller => 'کوچک‌تر';

  @override
  String get larger => 'بزرگ‌تر';
}
