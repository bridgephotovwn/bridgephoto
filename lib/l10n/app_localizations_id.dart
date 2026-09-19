// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Pindai';

  @override
  String get cancel => 'Batal';

  @override
  String get ok => 'Oke';

  @override
  String get close => 'Tutup';

  @override
  String get delete => 'Hapus';

  @override
  String get share => 'Bagikan';

  @override
  String get copy => 'Salin';

  @override
  String get copied => 'Disalin.';

  @override
  String get saved => 'Disimpan.';

  @override
  String get name => 'Nama';

  @override
  String get rename => 'Ganti nama';

  @override
  String get settings => 'Setelan';

  @override
  String get dismiss => 'Tutup';

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get cannotBeUndone => 'Tindakan ini tidak dapat diurungkan.';

  @override
  String get savingPages => 'Menyimpan halaman…';

  @override
  String get preparingScanner =>
      'Menyiapkan pemindai…\nPada penggunaan pertama, layanan Google Play mengunduhnya satu kali.';

  @override
  String get scannerUnavailable => 'Pemindai tidak tersedia.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Pemindai tidak tersedia: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Tidak dapat menyimpan halaman: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Tidak dapat membuka pemilih file: $error';
  }

  @override
  String get importingPdf => 'Mengimpor PDF…';

  @override
  String get importedPdf => 'PDF yang diimpor';

  @override
  String couldNotImport(String error) {
    return 'Tidak dapat mengimpor: $error';
  }

  @override
  String get pickTwoPdfs => 'Pilih minimal dua file PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Menggabungkan $count file PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Gabungan $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Tidak dapat menggabungkan: $error';
  }

  @override
  String get saveToFolder => 'Simpan ke folder';

  @override
  String couldNotSave(String error) {
    return 'Tidak dapat menyimpan: $error';
  }

  @override
  String get mergedDocument => 'Dokumen gabungan';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count lainnya';
  }

  @override
  String get merging => 'Menggabungkan…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count dokumen?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Membuat PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Membuat PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Membuat PDF, halaman $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Tidak dapat membuat PDF: $error';
  }

  @override
  String get searchDocuments => 'Cari dokumen';

  @override
  String get closeSearch => 'Tutup penelusuran';

  @override
  String get search => 'Cari';

  @override
  String get importPdfAsPages => 'Impor PDF sebagai halaman';

  @override
  String get mergePdfFiles => 'Gabungkan file PDF';

  @override
  String get clearSelection => 'Batalkan pilihan';

  @override
  String nSelected(int count) {
    return '$count dipilih';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count dipilih · digabungkan sesuai urutan ini';
  }

  @override
  String get mergeIntoOne => 'Gabungkan menjadi satu dokumen';

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
  String get shareAsPdf => 'Bagikan sebagai PDF';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String get noScansYet => 'Belum ada pindaian';

  @override
  String get nothingMatches => 'Tidak ada yang cocok';

  @override
  String get emptyHint =>
      'Ketuk Pindai untuk memotret dokumen. Semuanya tetap tersimpan di ponsel ini.';

  @override
  String get tryAnotherWord => 'Coba kata lain.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Pindaian $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO tertutup secara tak terduga';

  @override
  String get crashBody =>
      'Laporan tentang masalah ini hanya disimpan di ponsel ini. Membagikannya kepada pengembang membantu memperbaiki masalah. Laporan berisi detail teknis, bukan dokumen Anda.';

  @override
  String get reportCopied => 'Laporan disalin.';

  @override
  String get crashReportSubject => 'Laporan error BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF disimpan.';

  @override
  String couldNotSavePdf(String error) {
    return 'Tidak dapat menyimpan PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Ekspor halaman sebagai gambar';

  @override
  String get saveToPhotos => 'Simpan ke Foto';

  @override
  String get savingToPhotos => 'Menyimpan ke Foto…';

  @override
  String get photosNeedsAndroid10 =>
      'Menyimpan ke Foto memerlukan Android 10 atau yang lebih baru. Gunakan Bagikan sebagai gantinya.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO tidak diizinkan menambahkan ke Foto. Izinkan di Setelan, atau gunakan Bagikan.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gambar disimpan ke Foto.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Tidak dapat mengekspor: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Hapus dokumen ini?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count halaman akan dihapus. Tindakan ini tidak dapat diurungkan.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Teks (OCR)';

  @override
  String get sharePdf => 'Bagikan PDF';

  @override
  String get savePdfToFolder => 'Simpan PDF ke folder';

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
  String get exportAsImages => 'Ekspor sebagai JPEG / PNG';

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
  String get deleteDocument => 'Hapus dokumen';

  @override
  String get noPages => 'Tidak ada halaman. Ketuk Tambahkan halaman.';

  @override
  String get addPages => 'Tambahkan halaman';

  @override
  String get holdToReorder => 'tahan halaman untuk mengubah urutan';

  @override
  String get savePdfDialogTitle => 'Simpan PDF';

  @override
  String get saveDialogTitle => 'Simpan';

  @override
  String couldNotRotate(String error) {
    return 'Tidak dapat memutar: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Tidak dapat membagikan: $error';
  }

  @override
  String get noTextOnPage => 'Tidak ada teks yang ditemukan di halaman ini.';

  @override
  String pageNText(int n) {
    return 'Teks halaman $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Hapus halaman $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Halaman $n dari $total';
  }

  @override
  String get rotateLeft => 'Putar ke kiri';

  @override
  String get rotateRight => 'Putar ke kanan';

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
  String get undo => 'Urungkan';

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
  String get sign => 'Tanda tangan';

  @override
  String get copyText => 'Salin teks';

  @override
  String get shareImage => 'Bagikan gambar';

  @override
  String get deletePage => 'Hapus halaman';

  @override
  String get signed => 'Ditandatangani.';

  @override
  String signPageN(int n) {
    return 'Tanda tangani halaman $n';
  }

  @override
  String get deleteThisSignature => 'Hapus tanda tangan ini';

  @override
  String get newSignature => 'Tanda tangan baru';

  @override
  String readingPage(int n, int total) {
    return 'Membaca halaman $n / $total';
  }

  @override
  String get ocrFailed => 'Pengenalan teks gagal.';

  @override
  String ocrFailedWith(String error) {
    return 'Pengenalan teks gagal: $error';
  }

  @override
  String get textSaved => 'Teks disimpan.';

  @override
  String get text => 'Teks';

  @override
  String get copyAll => 'Salin semua';

  @override
  String get shareText => 'Bagikan teks';

  @override
  String get saveAsTxt => 'Simpan sebagai .txt';

  @override
  String get readAgain => 'Baca lagi';

  @override
  String get readAsLatin => 'Baca sebagai Inggris / Latin';

  @override
  String get readAsDevanagari => 'Baca sebagai Hindi / Nepali';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Di Android, model teks diunduh satu kali oleh layanan Google Play. Jika ini penggunaan pertama, tunggu sebentar lalu coba lagi.';

  @override
  String get noTextFound => 'Tidak ada teks yang ditemukan.';

  @override
  String pageSeparator(int n) {
    return '--- Halaman $n ---';
  }

  @override
  String get scanner => 'Pemindai';

  @override
  String get scanMode => 'Mode pindai';

  @override
  String get modeFull => 'Penuh: filter + bersihkan noda dan jari';

  @override
  String get modeFilter => 'Hanya filter';

  @override
  String get modeBase => 'Dasar: hanya pangkas dan putar';

  @override
  String get allowGallery => 'Izinkan impor dari galeri';

  @override
  String get allowGalleryHint => 'Menampilkan tombol galeri di dalam pemindai';

  @override
  String get pagesPerScan => 'Halaman per pindaian';

  @override
  String get iosScannerNote =>
      'Di iPhone, pemindainya adalah kamera dokumen milik Apple sendiri.';

  @override
  String get iosScannerNote2 =>
      'Pengambilan otomatis, deteksi tepi, dan mode warna sudah terpasang.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Ukuran halaman';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Sama seperti bentuk pindaian';

  @override
  String get searchablePdf => 'PDF yang dapat dicari';

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
      'Menambahkan lapisan teks tak terlihat agar PDF dapat dicari dan teksnya disalin';

  @override
  String get textRecognition => 'Pengenalan teks';

  @override
  String get quality => 'Kualitas';

  @override
  String get qualityBest => 'Terbaik: resolusi penuh, membaca tulisan kecil';

  @override
  String get qualityFast => 'Cepat: salinan halaman yang lebih kecil';

  @override
  String get language => 'Bahasa';

  @override
  String get scriptLatin => 'Inggris dan bahasa beraksara Latin lainnya';

  @override
  String get scriptDevanagari => 'Hindi, Nepali, Marathi (+ Latin)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Mandarin (+ Latin)';

  @override
  String get scriptJapanese => 'Jepang (+ Latin)';

  @override
  String get scriptKorean => 'Korea (+ Latin)';

  @override
  String get readAsChinese => 'Baca sebagai Mandarin';

  @override
  String get readAsJapanese => 'Baca sebagai Jepang';

  @override
  String get readAsKorean => 'Baca sebagai Korea';

  @override
  String get languageAuto => 'Bahasa terdeteksi secara otomatis.';

  @override
  String get appearance => 'Tampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Ikuti ponsel';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get about => 'Tentang';

  @override
  String get aboutPromise => 'Tanpa iklan. Tanpa akun. Tanpa pelacakan.';

  @override
  String get aboutPromiseBody =>
      'Pindaian tetap tersimpan di ponsel ini kecuali Anda membagikan atau mengekspornya. Menghapus instalan aplikasi juga menghapusnya, jadi ekspor yang ingin Anda simpan.';

  @override
  String get openSource => 'Sumber terbuka (Apache-2.0)';

  @override
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get opensInBrowser => 'Dibuka di browser Anda';

  @override
  String get aboutTechAndroid =>
      'Pemindaian dan pengenalan teks oleh Google ML Kit (di perangkat). Penggabungan PDF oleh PDFBox-Android. Font Devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Pemindaian oleh Apple VisionKit, pengenalan teks oleh Apple Vision (di perangkat). Font Devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Tidak dapat membuka $url';
  }

  @override
  String get scanBusinessCard => 'Pindai kartu nama';

  @override
  String get saveAsContact => 'Simpan sebagai kontak';

  @override
  String get saveToContacts => 'Simpan ke Kontak';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Kartu nama';

  @override
  String get contactHint =>
      'Periksa kolomnya, lalu simpan. Aplikasi Kontak di ponsel Anda akan terbuka dengan semua data terisi.';

  @override
  String get readingCard => 'Membaca kartu…';

  @override
  String get nothingRecognised =>
      'Tidak ada teks yang dikenali pada kartu ini. Anda tetap dapat mengetik detailnya.';

  @override
  String get contactOpened =>
      'Kontak telah dibuka. Ketuk Simpan di sana untuk menyimpannya.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Tidak dapat membuka Kontak: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kartu $stamp';
  }

  @override
  String get fieldCompany => 'Perusahaan';

  @override
  String get fieldJobTitle => 'Jabatan';

  @override
  String get fieldMobile => 'Ponsel';

  @override
  String get fieldPhone => 'Telepon';

  @override
  String get fieldFax => 'Faks';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Situs web';

  @override
  String get fieldAddress => 'Alamat';

  @override
  String get fieldCity => 'Kota';

  @override
  String get fieldCountry => 'Negara';

  @override
  String get fieldNotes => 'Catatan';

  @override
  String get drawFirst => 'Gambar tanda tangan Anda terlebih dahulu.';

  @override
  String get clear => 'Bersihkan';

  @override
  String get save => 'Simpan';

  @override
  String get signHint =>
      'Tanda tangani di dalam kotak dengan jari Anda. Putar ponsel ke samping untuk ruang lebih luas.';

  @override
  String get thin => 'Tipis';

  @override
  String get medium => 'Sedang';

  @override
  String get thick => 'Tebal';

  @override
  String couldNotReadPage(String error) {
    return 'Tidak dapat membaca halaman: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Tidak dapat menandatangani: $error';
  }

  @override
  String get placeSignature => 'Tempatkan tanda tangan';

  @override
  String get apply => 'Terapkan';

  @override
  String get dragPinchHint =>
      'Seret untuk memindahkan. Cubit untuk mengubah ukuran.';

  @override
  String get smaller => 'Perkecil';

  @override
  String get larger => 'Perbesar';
}
