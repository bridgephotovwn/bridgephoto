// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Imbas';

  @override
  String get cancel => 'Batal';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Tutup';

  @override
  String get delete => 'Padam';

  @override
  String get share => 'Kongsi';

  @override
  String get copy => 'Salin';

  @override
  String get copied => 'Disalin.';

  @override
  String get saved => 'Disimpan.';

  @override
  String get name => 'Nama';

  @override
  String get rename => 'Namakan semula';

  @override
  String get settings => 'Tetapan';

  @override
  String get dismiss => 'Ketepikan';

  @override
  String get tryAgain => 'Cuba lagi';

  @override
  String get cannotBeUndone => 'Tindakan ini tidak boleh dibuat asal.';

  @override
  String get savingPages => 'Menyimpan halaman…';

  @override
  String get preparingScanner =>
      'Menyediakan pengimbas…\nPada penggunaan pertama, perkhidmatan Google Play memuat turunnya sekali.';

  @override
  String get scannerUnavailable => 'Pengimbas tidak tersedia.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Pengimbas tidak tersedia: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Tidak dapat menyimpan halaman: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Tidak dapat membuka pemilih fail: $error';
  }

  @override
  String get importingPdf => 'Mengimport PDF…';

  @override
  String get importedPdf => 'PDF yang diimport';

  @override
  String couldNotImport(String error) {
    return 'Tidak dapat mengimport: $error';
  }

  @override
  String get pickTwoPdfs => 'Pilih sekurang-kurangnya dua fail PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Menggabungkan $count fail PDF…';
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
    return '$first + $count lagi';
  }

  @override
  String get merging => 'Menggabungkan…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Padam $count dokumen?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Membina PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Membina PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Membina PDF, halaman $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Tidak dapat membina PDF: $error';
  }

  @override
  String get searchDocuments => 'Cari dokumen';

  @override
  String get closeSearch => 'Tutup carian';

  @override
  String get search => 'Cari';

  @override
  String get importPdfAsPages => 'Import PDF sebagai halaman';

  @override
  String get mergePdfFiles => 'Gabungkan fail PDF';

  @override
  String get clearSelection => 'Kosongkan pilihan';

  @override
  String nSelected(int count) {
    return '$count dipilih';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count dipilih · gabung mengikut susunan ini';
  }

  @override
  String get mergeIntoOne => 'Gabungkan menjadi satu dokumen';

  @override
  String get shareAsPdf => 'Kongsi sebagai PDF';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String get noScansYet => 'Belum ada imbasan';

  @override
  String get nothingMatches => 'Tiada padanan';

  @override
  String get emptyHint =>
      'Ketik Imbas untuk mengambil gambar dokumen. Semuanya kekal dalam telefon ini.';

  @override
  String get tryAnotherWord => 'Cuba perkataan lain.';

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
    return 'Imbasan $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ditutup secara tidak dijangka';

  @override
  String get crashBody =>
      'Laporan tentang masalah ini disimpan dalam telefon ini sahaja. Berkongsi laporan dengan pembangun membantu membetulkan masalah. Laporan mengandungi butiran teknikal, bukan dokumen anda.';

  @override
  String get reportCopied => 'Laporan disalin.';

  @override
  String get crashReportSubject => 'Laporan ranap BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF disimpan.';

  @override
  String couldNotSavePdf(String error) {
    return 'Tidak dapat menyimpan PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Eksport halaman sebagai imej';

  @override
  String get saveToPhotos => 'Simpan ke Foto';

  @override
  String get savingToPhotos => 'Menyimpan ke Foto…';

  @override
  String get photosNeedsAndroid10 =>
      'Menyimpan ke Foto memerlukan Android 10 atau lebih baharu. Gunakan Kongsi sebagai ganti.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO tidak dibenarkan menambah ke Foto. Benarkan dalam Tetapan, atau gunakan Kongsi.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imej disimpan ke Foto.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Tidak dapat mengeksport: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Padam dokumen ini?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count halaman akan dipadamkan. Tindakan ini tidak boleh dibuat asal.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Teks (OCR)';

  @override
  String get sharePdf => 'Kongsi PDF';

  @override
  String get savePdfToFolder => 'Simpan PDF ke folder';

  @override
  String get exportAsImages => 'Eksport sebagai JPEG / PNG';

  @override
  String get oneSheetTitle => 'Pages on one sheet';

  @override
  String get oneSheetHint =>
      'Tap the pages in the order you want them — front, then back. They go on one printable sheet, and the pages you picked are kept.';

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
  String get deleteDocument => 'Padam dokumen';

  @override
  String get noPages => 'Tiada halaman. Ketik Tambah halaman.';

  @override
  String get addPages => 'Tambah halaman';

  @override
  String get holdToReorder => 'tahan halaman untuk menyusun semula';

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
    return 'Tidak dapat berkongsi: $error';
  }

  @override
  String get noTextOnPage => 'Tiada teks ditemukan pada halaman ini.';

  @override
  String pageNText(int n) {
    return 'Teks halaman $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Padam halaman $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Halaman $n daripada $total';
  }

  @override
  String get rotateLeft => 'Putar ke kiri';

  @override
  String get rotateRight => 'Putar ke kanan';

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
  String get sign => 'Tandatangan';

  @override
  String get copyText => 'Salin teks';

  @override
  String get shareImage => 'Kongsi imej';

  @override
  String get deletePage => 'Padam halaman';

  @override
  String get signed => 'Ditandatangani.';

  @override
  String signPageN(int n) {
    return 'Tandatangani halaman $n';
  }

  @override
  String get deleteThisSignature => 'Padam tandatangan ini';

  @override
  String get newSignature => 'Tandatangan baharu';

  @override
  String readingPage(int n, int total) {
    return 'Membaca halaman $n / $total';
  }

  @override
  String get ocrFailed => 'Pengecaman teks gagal.';

  @override
  String ocrFailedWith(String error) {
    return 'Pengecaman teks gagal: $error';
  }

  @override
  String get textSaved => 'Teks disimpan.';

  @override
  String get text => 'Teks';

  @override
  String get copyAll => 'Salin semua';

  @override
  String get shareText => 'Kongsi teks';

  @override
  String get saveAsTxt => 'Simpan sebagai .txt';

  @override
  String get readAgain => 'Baca semula';

  @override
  String get readAsLatin => 'Baca sebagai Inggeris / Latin';

  @override
  String get readAsDevanagari => 'Baca sebagai Hindi / Nepal';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Pada Android, model teks dimuat turun sekali oleh perkhidmatan Google Play. Jika ini penggunaan pertama, tunggu seminit dan cuba lagi.';

  @override
  String get noTextFound => 'Tiada teks ditemukan.';

  @override
  String pageSeparator(int n) {
    return '--- Halaman $n ---';
  }

  @override
  String get scanner => 'Pengimbas';

  @override
  String get scanMode => 'Mod imbasan';

  @override
  String get modeFull => 'Penuh: penapis + bersihkan kesan kotor dan jari';

  @override
  String get modeFilter => 'Penapis sahaja';

  @override
  String get modeBase => 'Asas: pangkas dan putar sahaja';

  @override
  String get allowGallery => 'Benarkan import daripada galeri';

  @override
  String get allowGalleryHint => 'Menunjukkan butang galeri di dalam pengimbas';

  @override
  String get pagesPerScan => 'Halaman setiap imbasan';

  @override
  String get iosScannerNote =>
      'Pada iPhone, pengimbas ialah kamera dokumen Apple sendiri.';

  @override
  String get iosScannerNote2 =>
      'Tangkapan automatik, pengesanan tepi dan mod warna sudah terbina dalam.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Saiz halaman';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Sama bentuk dengan imbasan';

  @override
  String get searchablePdf => 'PDF boleh cari';

  @override
  String get searchablePdfHint =>
      'Menambah lapisan teks halimunan supaya PDF boleh dicari dan teks boleh disalin';

  @override
  String get textRecognition => 'Pengecaman teks';

  @override
  String get quality => 'Kualiti';

  @override
  String get qualityBest => 'Terbaik: resolusi penuh, membaca cetakan halus';

  @override
  String get qualityFast => 'Pantas: salinan halaman yang lebih kecil';

  @override
  String get language => 'Bahasa';

  @override
  String get scriptLatin => 'Inggeris dan bahasa skrip Latin yang lain';

  @override
  String get scriptDevanagari => 'Hindi, Nepal, Marathi (+ Latin)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Cina (+ Latin)';

  @override
  String get scriptJapanese => 'Jepun (+ Latin)';

  @override
  String get scriptKorean => 'Korea (+ Latin)';

  @override
  String get readAsChinese => 'Baca sebagai Cina';

  @override
  String get readAsJapanese => 'Baca sebagai Jepun';

  @override
  String get readAsKorean => 'Baca sebagai Korea';

  @override
  String get languageAuto => 'Bahasa dikesan secara automatik.';

  @override
  String get appearance => 'Penampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Ikut telefon';

  @override
  String get themeLight => 'Cerah';

  @override
  String get themeDark => 'Gelap';

  @override
  String get about => 'Perihal';

  @override
  String get aboutPromise => 'Tiada iklan. Tiada akaun. Tiada penjejakan.';

  @override
  String get aboutPromiseBody =>
      'Imbasan kekal dalam telefon ini melainkan anda berkongsi atau mengeksportnya. Menyahpasang apl akan memadamkannya, jadi eksport apa yang anda mahu simpan.';

  @override
  String get openSource => 'Sumber terbuka (Apache-2.0)';

  @override
  String get privacyPolicy => 'Dasar privasi';

  @override
  String get opensInBrowser => 'Dibuka dalam penyemak imbas anda';

  @override
  String get aboutTechAndroid =>
      'Pengimbasan dan pengecaman teks oleh Google ML Kit (pada peranti). Penggabungan PDF oleh PDFBox-Android. Fon Devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Pengimbasan oleh Apple VisionKit, pengecaman teks oleh Apple Vision (pada peranti). Fon Devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Tidak dapat membuka $url';
  }

  @override
  String get scanBusinessCard => 'Imbas kad nama';

  @override
  String get saveAsContact => 'Simpan sebagai kenalan';

  @override
  String get saveToContacts => 'Simpan ke Kenalan';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Kad nama';

  @override
  String get contactHint =>
      'Semak medan, kemudian simpan. Apl Kenalan telefon anda akan dibuka dengan semua maklumat telah diisi.';

  @override
  String get readingCard => 'Membaca kad…';

  @override
  String get nothingRecognised =>
      'Tiada teks dikenali pada kad ini. Anda masih boleh menaip butirannya.';

  @override
  String get contactOpened =>
      'Kenalan telah dibuka. Ketik Simpan di sana untuk menyimpannya.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Tidak dapat membuka Kenalan: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kad $stamp';
  }

  @override
  String get fieldCompany => 'Syarikat';

  @override
  String get fieldJobTitle => 'Jawatan';

  @override
  String get fieldMobile => 'Telefon bimbit';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Faks';

  @override
  String get fieldEmail => 'E-mel';

  @override
  String get fieldWebsite => 'Tapak web';

  @override
  String get fieldAddress => 'Alamat';

  @override
  String get fieldCity => 'Bandar';

  @override
  String get fieldCountry => 'Negara';

  @override
  String get fieldNotes => 'Nota';

  @override
  String get drawFirst => 'Lukis tandatangan anda dahulu.';

  @override
  String get clear => 'Kosongkan';

  @override
  String get undo => 'Buat asal';

  @override
  String get save => 'Simpan';

  @override
  String get signHint =>
      'Tandatangan dalam kotak dengan jari anda. Pusingkan telefon ke sisi untuk ruang yang lebih luas.';

  @override
  String get thin => 'Nipis';

  @override
  String get medium => 'Sederhana';

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
  String get placeSignature => 'Letakkan tandatangan';

  @override
  String get apply => 'Gunakan';

  @override
  String get dragPinchHint =>
      'Seret untuk mengalihkan. Cubit untuk mengubah saiz.';

  @override
  String get smaller => 'Kecilkan';

  @override
  String get larger => 'Besarkan';
}
