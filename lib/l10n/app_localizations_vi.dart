// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Quét';

  @override
  String get cancel => 'Hủy';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Đóng';

  @override
  String get delete => 'Xóa';

  @override
  String get share => 'Chia sẻ';

  @override
  String get copy => 'Sao chép';

  @override
  String get copied => 'Đã sao chép.';

  @override
  String get saved => 'Đã lưu.';

  @override
  String get name => 'Tên';

  @override
  String get rename => 'Đổi tên';

  @override
  String get settings => 'Cài đặt';

  @override
  String get dismiss => 'Bỏ qua';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get cannotBeUndone => 'Không thể hoàn tác thao tác này.';

  @override
  String get savingPages => 'Đang lưu các trang…';

  @override
  String get preparingScanner =>
      'Đang chuẩn bị trình quét…\nLần đầu sử dụng: Dịch vụ Google Play sẽ tải xuống một lần.';

  @override
  String get scannerUnavailable => 'Trình quét không khả dụng.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Trình quét không khả dụng: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Không thể lưu các trang: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Không thể mở trình chọn tệp: $error';
  }

  @override
  String get importingPdf => 'Đang nhập PDF…';

  @override
  String get importedPdf => 'PDF đã nhập';

  @override
  String couldNotImport(String error) {
    return 'Không thể nhập: $error';
  }

  @override
  String get pickTwoPdfs => 'Hãy chọn ít nhất hai tệp PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Đang gộp $count tệp PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Đã gộp $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Không thể gộp: $error';
  }

  @override
  String get saveToFolder => 'Lưu vào thư mục';

  @override
  String couldNotSave(String error) {
    return 'Không thể lưu: $error';
  }

  @override
  String get mergedDocument => 'Tài liệu đã gộp';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count tài liệu khác';
  }

  @override
  String get merging => 'Đang gộp…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa $count tài liệu?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Đang tạo PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Đang tạo PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Đang tạo PDF, trang $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Không thể tạo PDF: $error';
  }

  @override
  String get searchDocuments => 'Tìm tài liệu';

  @override
  String get closeSearch => 'Đóng tìm kiếm';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get importPdfAsPages => 'Nhập PDF thành các trang';

  @override
  String get mergePdfFiles => 'Gộp các tệp PDF';

  @override
  String get clearSelection => 'Bỏ chọn';

  @override
  String nSelected(int count) {
    return 'Đã chọn $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Đã chọn $count · gộp theo thứ tự này';
  }

  @override
  String get mergeIntoOne => 'Gộp thành một tài liệu';

  @override
  String get shareAsPdf => 'Chia sẻ dưới dạng PDF';

  @override
  String get selectAll => 'Chọn tất cả';

  @override
  String get noScansYet => 'Chưa có bản quét nào';

  @override
  String get nothingMatches => 'Không có kết quả phù hợp';

  @override
  String get emptyHint =>
      'Nhấn Quét để chụp tài liệu. Mọi thứ đều được lưu trên điện thoại này.';

  @override
  String get tryAnotherWord => 'Hãy thử từ khác.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Bản quét $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO đã đóng đột ngột';

  @override
  String get crashBody =>
      'Báo cáo về sự cố chỉ được lưu trên điện thoại này. Chia sẻ báo cáo với nhà phát triển sẽ giúp khắc phục sự cố. Báo cáo chứa thông tin kỹ thuật, không chứa tài liệu của bạn.';

  @override
  String get reportCopied => 'Đã sao chép báo cáo.';

  @override
  String get crashReportSubject => 'Báo cáo sự cố BRIDGE PHOTO';

  @override
  String get pdfSaved => 'Đã lưu PDF.';

  @override
  String couldNotSavePdf(String error) {
    return 'Không thể lưu PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Xuất các trang thành hình ảnh';

  @override
  String get saveToPhotos => 'Lưu vào Ảnh';

  @override
  String get savingToPhotos => 'Đang lưu vào Ảnh…';

  @override
  String get photosNeedsAndroid10 =>
      'Lưu vào Ảnh cần Android 10 trở lên. Hãy dùng Chia sẻ thay thế.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO không được phép thêm vào Ảnh. Hãy cho phép trong Cài đặt hoặc dùng Chia sẻ.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu $count hình ảnh vào Ảnh.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Không thể xuất: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Xóa tài liệu này?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang sẽ bị xóa. Không thể hoàn tác thao tác này.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Văn bản (OCR)';

  @override
  String get sharePdf => 'Chia sẻ PDF';

  @override
  String get savePdfToFolder => 'Lưu PDF vào thư mục';

  @override
  String get exportAsImages => 'Xuất dưới dạng JPEG / PNG';

  @override
  String get deleteDocument => 'Xóa tài liệu';

  @override
  String get noPages => 'Chưa có trang nào. Nhấn Thêm trang.';

  @override
  String get addPages => 'Thêm trang';

  @override
  String get holdToReorder => 'giữ một trang để sắp xếp lại';

  @override
  String get savePdfDialogTitle => 'Lưu PDF';

  @override
  String get saveDialogTitle => 'Lưu';

  @override
  String couldNotRotate(String error) {
    return 'Không thể xoay: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Không thể chia sẻ: $error';
  }

  @override
  String get noTextOnPage => 'Không tìm thấy văn bản trên trang này.';

  @override
  String pageNText(int n) {
    return 'Văn bản trang $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Xóa trang $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Trang $n / $total';
  }

  @override
  String get rotateLeft => 'Xoay trái';

  @override
  String get rotateRight => 'Xoay phải';

  @override
  String get sign => 'Ký';

  @override
  String get copyText => 'Sao chép văn bản';

  @override
  String get shareImage => 'Chia sẻ hình ảnh';

  @override
  String get deletePage => 'Xóa trang';

  @override
  String get signed => 'Đã ký.';

  @override
  String signPageN(int n) {
    return 'Ký trang $n';
  }

  @override
  String get deleteThisSignature => 'Xóa chữ ký này';

  @override
  String get newSignature => 'Chữ ký mới';

  @override
  String readingPage(int n, int total) {
    return 'Đang đọc trang $n / $total';
  }

  @override
  String get ocrFailed => 'Nhận dạng văn bản không thành công.';

  @override
  String ocrFailedWith(String error) {
    return 'Nhận dạng văn bản không thành công: $error';
  }

  @override
  String get textSaved => 'Đã lưu văn bản.';

  @override
  String get text => 'Văn bản';

  @override
  String get copyAll => 'Sao chép tất cả';

  @override
  String get shareText => 'Chia sẻ văn bản';

  @override
  String get saveAsTxt => 'Lưu dưới dạng .txt';

  @override
  String get readAgain => 'Đọc lại';

  @override
  String get readAsLatin => 'Đọc dưới dạng tiếng Anh / chữ Latinh';

  @override
  String get readAsDevanagari => 'Đọc dưới dạng tiếng Hindi / Nepal';

  @override
  String get ocrModelHint =>
      'Trên Android, mô hình văn bản được Dịch vụ Google Play tải xuống một lần. Nếu đây là lần đầu sử dụng, hãy đợi một phút rồi thử lại.';

  @override
  String get noTextFound => 'Không tìm thấy văn bản.';

  @override
  String pageSeparator(int n) {
    return '--- Trang $n ---';
  }

  @override
  String get scanner => 'Trình quét';

  @override
  String get scanMode => 'Chế độ quét';

  @override
  String get modeFull => 'Đầy đủ: bộ lọc + xóa vết bẩn và ngón tay';

  @override
  String get modeFilter => 'Chỉ bộ lọc';

  @override
  String get modeBase => 'Cơ bản: chỉ cắt và xoay';

  @override
  String get allowGallery => 'Cho phép nhập từ thư viện';

  @override
  String get allowGalleryHint => 'Hiện nút thư viện trong trình quét';

  @override
  String get pagesPerScan => 'Số trang mỗi lần quét';

  @override
  String get iosScannerNote =>
      'Trên iPhone, trình quét là camera tài liệu của chính Apple.';

  @override
  String get iosScannerNote2 =>
      'Chụp tự động, nhận diện cạnh và các chế độ màu đã được tích hợp sẵn.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Khổ trang';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Cùng hình dạng với bản quét';

  @override
  String get searchablePdf => 'PDF có thể tìm kiếm';

  @override
  String get searchablePdfHint =>
      'Thêm một lớp văn bản ẩn để có thể tìm kiếm và sao chép văn bản trong PDF';

  @override
  String get textRecognition => 'Nhận dạng văn bản';

  @override
  String get quality => 'Chất lượng';

  @override
  String get qualityBest => 'Tốt nhất: độ phân giải đầy đủ, đọc được chữ nhỏ';

  @override
  String get qualityFast => 'Nhanh: bản sao nhỏ hơn của trang';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get scriptLatin => 'Tiếng Anh và các ngôn ngữ dùng chữ Latinh khác';

  @override
  String get scriptDevanagari => 'Tiếng Hindi, Nepal, Marathi (+ Latinh)';

  @override
  String get scriptChinese => 'Tiếng Trung (+ Latinh)';

  @override
  String get scriptJapanese => 'Tiếng Nhật (+ Latinh)';

  @override
  String get scriptKorean => 'Tiếng Hàn (+ Latinh)';

  @override
  String get readAsChinese => 'Đọc dưới dạng tiếng Trung';

  @override
  String get readAsJapanese => 'Đọc dưới dạng tiếng Nhật';

  @override
  String get readAsKorean => 'Đọc dưới dạng tiếng Hàn';

  @override
  String get languageAuto => 'Ngôn ngữ được tự động phát hiện.';

  @override
  String get appearance => 'Giao diện';

  @override
  String get theme => 'Chủ đề';

  @override
  String get themeSystem => 'Theo điện thoại';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get about => 'Giới thiệu';

  @override
  String get aboutPromise =>
      'Không quảng cáo. Không tài khoản. Không theo dõi.';

  @override
  String get aboutPromiseBody =>
      'Các bản quét được lưu trên điện thoại này trừ khi bạn chia sẻ hoặc xuất chúng. Gỡ cài đặt ứng dụng sẽ xóa chúng, vì vậy hãy xuất những gì bạn muốn giữ lại.';

  @override
  String get openSource => 'Mã nguồn mở (Apache-2.0)';

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get opensInBrowser => 'Mở trong trình duyệt của bạn';

  @override
  String get aboutTechAndroid =>
      'Quét và nhận dạng văn bản bằng Google ML Kit (trên thiết bị). Gộp PDF bằng PDFBox-Android. Phông chữ Devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Quét bằng Apple VisionKit, nhận dạng văn bản bằng Apple Vision (trên thiết bị). Phông chữ Devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Không thể mở $url';
  }

  @override
  String get drawFirst => 'Hãy vẽ chữ ký của bạn trước.';

  @override
  String get clear => 'Xóa hết';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get save => 'Lưu';

  @override
  String get signHint =>
      'Ký vào ô bằng ngón tay. Xoay ngang điện thoại để có thêm chỗ.';

  @override
  String get thin => 'Mảnh';

  @override
  String get medium => 'Vừa';

  @override
  String get thick => 'Đậm';

  @override
  String couldNotReadPage(String error) {
    return 'Không thể đọc trang: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Không thể ký: $error';
  }

  @override
  String get placeSignature => 'Đặt chữ ký';

  @override
  String get apply => 'Áp dụng';

  @override
  String get dragPinchHint => 'Kéo để di chuyển. Chụm để đổi kích thước.';

  @override
  String get smaller => 'Nhỏ hơn';

  @override
  String get larger => 'Lớn hơn';
}
