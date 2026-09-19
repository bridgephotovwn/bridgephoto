// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'สแกน';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get ok => 'ตกลง';

  @override
  String get close => 'ปิด';

  @override
  String get delete => 'ลบ';

  @override
  String get share => 'แชร์';

  @override
  String get copy => 'คัดลอก';

  @override
  String get copied => 'คัดลอกแล้ว';

  @override
  String get saved => 'บันทึกแล้ว';

  @override
  String get name => 'ชื่อ';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get dismiss => 'ปิด';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String get cannotBeUndone => 'การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get savingPages => 'กำลังบันทึกหน้า…';

  @override
  String get preparingScanner =>
      'กำลังเตรียมเครื่องสแกน…\nการใช้งานครั้งแรก: บริการ Google Play จะดาวน์โหลดครั้งเดียว';

  @override
  String get scannerUnavailable => 'เครื่องสแกนไม่พร้อมใช้งาน';

  @override
  String scannerUnavailableWith(String error) {
    return 'เครื่องสแกนไม่พร้อมใช้งาน: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'บันทึกหน้าไม่ได้: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'เปิดตัวเลือกไฟล์ไม่ได้: $error';
  }

  @override
  String get importingPdf => 'กำลังนำเข้า PDF…';

  @override
  String get importedPdf => 'PDF ที่นำเข้า';

  @override
  String couldNotImport(String error) {
    return 'นำเข้าไม่ได้: $error';
  }

  @override
  String get pickTwoPdfs => 'เลือกไฟล์ PDF อย่างน้อย 2 ไฟล์';

  @override
  String mergingPdfs(int count) {
    return 'กำลังรวมไฟล์ PDF $count ไฟล์…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'รวมแล้ว $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'รวมไม่ได้: $error';
  }

  @override
  String get saveToFolder => 'บันทึกลงโฟลเดอร์';

  @override
  String couldNotSave(String error) {
    return 'บันทึกไม่ได้: $error';
  }

  @override
  String get mergedDocument => 'เอกสารที่รวมแล้ว';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + อีก $count รายการ';
  }

  @override
  String get merging => 'กำลังรวม…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบเอกสาร $count รายการไหม',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'กำลังสร้าง PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'กำลังสร้าง PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'กำลังสร้าง PDF หน้า $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'สร้าง PDF ไม่ได้: $error';
  }

  @override
  String get searchDocuments => 'ค้นหาเอกสาร';

  @override
  String get closeSearch => 'ปิดการค้นหา';

  @override
  String get search => 'ค้นหา';

  @override
  String get importPdfAsPages => 'นำเข้า PDF เป็นหน้า';

  @override
  String get mergePdfFiles => 'รวมไฟล์ PDF';

  @override
  String get clearSelection => 'ล้างการเลือก';

  @override
  String nSelected(int count) {
    return 'เลือกแล้ว $count รายการ';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'เลือกแล้ว $count รายการ · รวมตามลำดับนี้';
  }

  @override
  String get mergeIntoOne => 'รวมเป็นเอกสารเดียว';

  @override
  String get shareAsPdf => 'แชร์เป็น PDF';

  @override
  String get selectAll => 'เลือกทั้งหมด';

  @override
  String get noScansYet => 'ยังไม่มีการสแกน';

  @override
  String get nothingMatches => 'ไม่พบรายการที่ตรงกัน';

  @override
  String get emptyHint =>
      'แตะสแกนเพื่อถ่ายภาพเอกสาร ทุกอย่างจะอยู่ในโทรศัพท์เครื่องนี้เท่านั้น';

  @override
  String get tryAnotherWord => 'ลองใช้คำอื่น';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count หน้า',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'สแกน $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ปิดโดยไม่คาดคิด';

  @override
  String get crashBody =>
      'รายงานปัญหาถูกบันทึกไว้ในโทรศัพท์เครื่องนี้เท่านั้น การแชร์รายงานให้นักพัฒนาจะช่วยแก้ไขปัญหาได้ รายงานมีเฉพาะรายละเอียดทางเทคนิค ไม่มีเอกสารของคุณ';

  @override
  String get reportCopied => 'คัดลอกรายงานแล้ว';

  @override
  String get crashReportSubject => 'รายงานข้อขัดข้องของ BRIDGE PHOTO';

  @override
  String get pdfSaved => 'บันทึก PDF แล้ว';

  @override
  String couldNotSavePdf(String error) {
    return 'บันทึก PDF ไม่ได้: $error';
  }

  @override
  String get exportPagesAsImages => 'ส่งออกหน้าเป็นรูปภาพ';

  @override
  String get saveToPhotos => 'บันทึกลงรูปภาพ';

  @override
  String get savingToPhotos => 'กำลังบันทึกลงรูปภาพ…';

  @override
  String get photosNeedsAndroid10 =>
      'การบันทึกลงรูปภาพต้องใช้ Android 10 ขึ้นไป ให้ใช้แชร์แทน';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ไม่ได้รับอนุญาตให้เพิ่มลงในรูปภาพ โปรดอนุญาตในการตั้งค่า หรือใช้แชร์แทน';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึกรูปภาพ $count รูปลงในรูปภาพแล้ว',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'ส่งออกไม่ได้: $error';
  }

  @override
  String get deleteDocumentQuestion => 'ลบเอกสารนี้ไหม';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ระบบจะลบ $count หน้า การดำเนินการนี้ไม่สามารถเลิกทำได้',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'ข้อความ (OCR)';

  @override
  String get sharePdf => 'แชร์ PDF';

  @override
  String get savePdfToFolder => 'บันทึก PDF ลงโฟลเดอร์';

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
  String get exportAsImages => 'ส่งออกเป็น JPEG / PNG';

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
  String get deleteDocument => 'ลบเอกสาร';

  @override
  String get noPages => 'ไม่มีหน้า แตะเพิ่มหน้า';

  @override
  String get addPages => 'เพิ่มหน้า';

  @override
  String get holdToReorder => 'กดหน้าค้างไว้เพื่อจัดลำดับใหม่';

  @override
  String get savePdfDialogTitle => 'บันทึก PDF';

  @override
  String get saveDialogTitle => 'บันทึก';

  @override
  String couldNotRotate(String error) {
    return 'หมุนไม่ได้: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'แชร์ไม่ได้: $error';
  }

  @override
  String get noTextOnPage => 'ไม่พบข้อความในหน้านี้';

  @override
  String pageNText(int n) {
    return 'ข้อความหน้า $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'ลบหน้า $n ไหม';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'หน้า $n จาก $total';
  }

  @override
  String get rotateLeft => 'หมุนซ้าย';

  @override
  String get rotateRight => 'หมุนขวา';

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
  String get undo => 'เลิกทำ';

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
  String get sign => 'เซ็น';

  @override
  String get copyText => 'คัดลอกข้อความ';

  @override
  String get shareImage => 'แชร์รูปภาพ';

  @override
  String get deletePage => 'ลบหน้า';

  @override
  String get signed => 'เซ็นแล้ว';

  @override
  String signPageN(int n) {
    return 'เซ็นหน้า $n';
  }

  @override
  String get deleteThisSignature => 'ลบลายเซ็นนี้';

  @override
  String get newSignature => 'ลายเซ็นใหม่';

  @override
  String readingPage(int n, int total) {
    return 'กำลังอ่านหน้า $n / $total';
  }

  @override
  String get ocrFailed => 'การจดจำข้อความล้มเหลว';

  @override
  String ocrFailedWith(String error) {
    return 'การจดจำข้อความล้มเหลว: $error';
  }

  @override
  String get textSaved => 'บันทึกข้อความแล้ว';

  @override
  String get text => 'ข้อความ';

  @override
  String get copyAll => 'คัดลอกทั้งหมด';

  @override
  String get shareText => 'แชร์ข้อความ';

  @override
  String get saveAsTxt => 'บันทึกเป็น .txt';

  @override
  String get readAgain => 'อ่านอีกครั้ง';

  @override
  String get readAsLatin => 'อ่านเป็นภาษาอังกฤษ / อักษรละติน';

  @override
  String get readAsDevanagari => 'อ่านเป็นภาษาฮินดี / เนปาล';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'ใน Android บริการ Google Play จะดาวน์โหลดโมเดลข้อความเพียงครั้งเดียว หากเป็นการใช้งานครั้งแรก โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get noTextFound => 'ไม่พบข้อความ';

  @override
  String pageSeparator(int n) {
    return '--- หน้า $n ---';
  }

  @override
  String get scanner => 'เครื่องสแกน';

  @override
  String get scanMode => 'โหมดสแกน';

  @override
  String get modeFull => 'เต็มรูปแบบ: ฟิลเตอร์ + ลบรอยเปื้อนและนิ้ว';

  @override
  String get modeFilter => 'ฟิลเตอร์เท่านั้น';

  @override
  String get modeBase => 'พื้นฐาน: ครอบตัดและหมุนเท่านั้น';

  @override
  String get allowGallery => 'อนุญาตให้นำเข้าจากแกลเลอรี';

  @override
  String get allowGalleryHint => 'แสดงปุ่มแกลเลอรีในเครื่องสแกน';

  @override
  String get pagesPerScan => 'จำนวนหน้าต่อการสแกน';

  @override
  String get iosScannerNote =>
      'ใน iPhone เครื่องสแกนคือกล้องเอกสารของ Apple เอง';

  @override
  String get iosScannerNote2 =>
      'มีการถ่ายอัตโนมัติ การตรวจจับขอบ และโหมดสีในตัว';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'ขนาดหน้า';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'รูปทรงเดียวกับที่สแกน';

  @override
  String get searchablePdf => 'PDF ที่ค้นหาได้';

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
      'เพิ่มเลเยอร์ข้อความที่มองไม่เห็นเพื่อให้ค้นหาและคัดลอกข้อความใน PDF ได้';

  @override
  String get textRecognition => 'การจดจำข้อความ';

  @override
  String get quality => 'คุณภาพ';

  @override
  String get qualityBest => 'ดีที่สุด: ความละเอียดเต็ม อ่านตัวอักษรขนาดเล็กได้';

  @override
  String get qualityFast => 'เร็ว: สำเนาหน้าขนาดเล็กลง';

  @override
  String get language => 'ภาษา';

  @override
  String get scriptLatin => 'ภาษาอังกฤษและภาษาอื่นๆ ที่ใช้อักษรละติน';

  @override
  String get scriptDevanagari => 'ฮินดี เนปาล มราฐี (+ ละติน)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'จีน (+ ละติน)';

  @override
  String get scriptJapanese => 'ญี่ปุ่น (+ ละติน)';

  @override
  String get scriptKorean => 'เกาหลี (+ ละติน)';

  @override
  String get readAsChinese => 'อ่านเป็นภาษาจีน';

  @override
  String get readAsJapanese => 'อ่านเป็นภาษาญี่ปุ่น';

  @override
  String get readAsKorean => 'อ่านเป็นภาษาเกาหลี';

  @override
  String get languageAuto => 'ระบบจะตรวจหาภาษาโดยอัตโนมัติ';

  @override
  String get appearance => 'ลักษณะที่ปรากฏ';

  @override
  String get theme => 'ธีม';

  @override
  String get themeSystem => 'ตามโทรศัพท์';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get aboutPromise => 'ไม่มีโฆษณา ไม่ต้องมีบัญชี ไม่มีการติดตาม';

  @override
  String get aboutPromiseBody =>
      'งานสแกนจะอยู่ในโทรศัพท์เครื่องนี้เท่านั้น เว้นแต่คุณจะแชร์หรือส่งออก การถอนการติดตั้งแอปจะลบงานสแกนทั้งหมด ดังนั้นโปรดส่งออกสิ่งที่ต้องการเก็บไว้';

  @override
  String get openSource => 'โอเพนซอร์ส (Apache-2.0)';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get opensInBrowser => 'เปิดในเบราว์เซอร์ของคุณ';

  @override
  String get aboutTechAndroid =>
      'การสแกนและการจดจำข้อความโดย Google ML Kit (ในอุปกรณ์) การรวม PDF โดย PDFBox-Android แบบอักษรเทวนาครี: Noto (OFL)';

  @override
  String get aboutTechIos =>
      'การสแกนโดย Apple VisionKit การจดจำข้อความโดย Apple Vision (ในอุปกรณ์) แบบอักษรเทวนาครี: Noto (OFL)';

  @override
  String couldNotOpenUrl(String url) {
    return 'เปิด $url ไม่ได้';
  }

  @override
  String get scanBusinessCard => 'สแกนนามบัตร';

  @override
  String get saveAsContact => 'บันทึกเป็นรายชื่อติดต่อ';

  @override
  String get saveToContacts => 'บันทึกลงรายชื่อติดต่อ';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'นามบัตร';

  @override
  String get contactHint =>
      'ตรวจสอบช่องข้อมูล แล้วบันทึก แอปรายชื่อติดต่อในโทรศัพท์ของคุณจะเปิดขึ้นพร้อมข้อมูลที่กรอกไว้ครบแล้ว';

  @override
  String get readingCard => 'กำลังอ่านนามบัตร…';

  @override
  String get nothingRecognised =>
      'ไม่พบข้อความบนนามบัตรนี้ คุณยังพิมพ์รายละเอียดเองได้';

  @override
  String get contactOpened =>
      'เปิดรายชื่อติดต่อแล้ว แตะบันทึกที่นั่นเพื่อเก็บไว้';

  @override
  String couldNotOpenContacts(String error) {
    return 'เปิดรายชื่อติดต่อไม่ได้: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'นามบัตร $stamp';
  }

  @override
  String get fieldCompany => 'บริษัท';

  @override
  String get fieldJobTitle => 'ตำแหน่งงาน';

  @override
  String get fieldMobile => 'มือถือ';

  @override
  String get fieldPhone => 'โทรศัพท์';

  @override
  String get fieldFax => 'แฟกซ์';

  @override
  String get fieldEmail => 'อีเมล';

  @override
  String get fieldWebsite => 'เว็บไซต์';

  @override
  String get fieldAddress => 'ที่อยู่';

  @override
  String get fieldCity => 'เมือง';

  @override
  String get fieldCountry => 'ประเทศ';

  @override
  String get fieldNotes => 'หมายเหตุ';

  @override
  String get drawFirst => 'โปรดวาดลายเซ็นของคุณก่อน';

  @override
  String get clear => 'ล้าง';

  @override
  String get save => 'บันทึก';

  @override
  String get signHint =>
      'เซ็นในกรอบด้วยนิ้วของคุณ หมุนโทรศัพท์เป็นแนวนอนเพื่อให้มีพื้นที่มากขึ้น';

  @override
  String get thin => 'บาง';

  @override
  String get medium => 'ปานกลาง';

  @override
  String get thick => 'หนา';

  @override
  String couldNotReadPage(String error) {
    return 'อ่านหน้าไม่ได้: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'เซ็นไม่ได้: $error';
  }

  @override
  String get placeSignature => 'วางลายเซ็น';

  @override
  String get apply => 'ใช้';

  @override
  String get dragPinchHint => 'ลากเพื่อย้าย บีบนิ้วเพื่อปรับขนาด';

  @override
  String get smaller => 'เล็กลง';

  @override
  String get larger => 'ใหญ่ขึ้น';
}
