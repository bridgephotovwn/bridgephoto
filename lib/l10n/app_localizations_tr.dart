// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Tara';

  @override
  String get cancel => 'İptal';

  @override
  String get ok => 'Tamam';

  @override
  String get close => 'Kapat';

  @override
  String get delete => 'Sil';

  @override
  String get share => 'Paylaş';

  @override
  String get copy => 'Kopyala';

  @override
  String get copied => 'Kopyalandı.';

  @override
  String get saved => 'Kaydedildi.';

  @override
  String get name => 'Ad';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get settings => 'Ayarlar';

  @override
  String get dismiss => 'Kapat';

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get cannotBeUndone => 'Bu işlem geri alınamaz.';

  @override
  String get savingPages => 'Sayfalar kaydediliyor…';

  @override
  String get preparingScanner =>
      'Tarayıcı hazırlanıyor…\nİlk kullanımda Google Play hizmetleri bunu bir kez indirir.';

  @override
  String get scannerUnavailable => 'Tarayıcı kullanılamıyor.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Tarayıcı kullanılamıyor: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Sayfalar kaydedilemedi: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Dosya seçici açılamadı: $error';
  }

  @override
  String get importingPdf => 'PDF içe aktarılıyor…';

  @override
  String get importedPdf => 'İçe aktarılan PDF';

  @override
  String couldNotImport(String error) {
    return 'İçe aktarılamadı: $error';
  }

  @override
  String get pickTwoPdfs => 'En az iki PDF dosyası seçin.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF dosyası birleştiriliyor…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Birleştirilmiş $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Birleştirilemedi: $error';
  }

  @override
  String get saveToFolder => 'Klasöre kaydet';

  @override
  String couldNotSave(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get mergedDocument => 'Birleştirilmiş belge';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count diğer';
  }

  @override
  String get merging => 'Birleştiriliyor…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count belge silinsin mi?',
      one: '1 belge silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF oluşturuluyor…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF oluşturuluyor $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF oluşturuluyor, sayfa $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF oluşturulamadı: $error';
  }

  @override
  String get searchDocuments => 'Belgelerde ara';

  @override
  String get closeSearch => 'Aramayı kapat';

  @override
  String get search => 'Ara';

  @override
  String get importPdfAsPages => 'PDF\'yi sayfa olarak içe aktar';

  @override
  String get mergePdfFiles => 'PDF dosyalarını birleştir';

  @override
  String get clearSelection => 'Seçimi temizle';

  @override
  String nSelected(int count) {
    return '$count seçildi';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count seçildi · bu sırayla birleştirilecek';
  }

  @override
  String get mergeIntoOne => 'Tek belgede birleştir';

  @override
  String get shareAsPdf => 'PDF olarak paylaş';

  @override
  String get selectAll => 'Tümünü seç';

  @override
  String get noScansYet => 'Henüz tarama yok';

  @override
  String get nothingMatches => 'Eşleşen sonuç yok';

  @override
  String get emptyHint =>
      'Bir belgenin fotoğrafını çekmek için Tara\'ya dokunun. Her şey bu telefonda kalır.';

  @override
  String get tryAnotherWord => 'Başka bir kelime deneyin.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Tarama $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO beklenmedik şekilde kapandı';

  @override
  String get crashBody =>
      'Sorunun raporu yalnızca bu telefona kaydedildi. Geliştiriciyle paylaşmanız sorunun çözülmesine yardımcı olur. Rapor, belgelerinizi değil teknik ayrıntıları içerir.';

  @override
  String get reportCopied => 'Rapor kopyalandı.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO çökme raporu';

  @override
  String get pdfSaved => 'PDF kaydedildi.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF kaydedilemedi: $error';
  }

  @override
  String get exportPagesAsImages => 'Sayfaları görsel olarak dışa aktar';

  @override
  String get saveToPhotos => 'Fotoğraflar\'a kaydet';

  @override
  String get savingToPhotos => 'Fotoğraflar\'a kaydediliyor…';

  @override
  String get photosNeedsAndroid10 =>
      'Fotoğraflar\'a kaydetmek için Android 10 veya üzeri gerekir. Bunun yerine Paylaş\'ı kullanın.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO\'nun Fotoğraflar\'a ekleme izni yok. Ayarlar\'dan izin verin veya Paylaş\'ı kullanın.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görsel Fotoğraflar\'a kaydedildi.',
      one: '1 görsel Fotoğraflar\'a kaydedildi.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Dışa aktarılamadı: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Bu belge silinsin mi?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa silinecek. Bu işlem geri alınamaz.',
      one: '1 sayfa silinecek. Bu işlem geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Metin (OCR)';

  @override
  String get sharePdf => 'PDF\'yi paylaş';

  @override
  String get savePdfToFolder => 'PDF\'yi klasöre kaydet';

  @override
  String get exportAsImages => 'JPEG / PNG olarak dışa aktar';

  @override
  String get deleteDocument => 'Belgeyi sil';

  @override
  String get noPages => 'Sayfa yok. Sayfa ekle\'ye dokunun.';

  @override
  String get addPages => 'Sayfa ekle';

  @override
  String get holdToReorder =>
      'sırayı değiştirmek için bir sayfayı basılı tutun';

  @override
  String get savePdfDialogTitle => 'PDF\'yi kaydet';

  @override
  String get saveDialogTitle => 'Kaydet';

  @override
  String couldNotRotate(String error) {
    return 'Döndürülemedi: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Paylaşılamadı: $error';
  }

  @override
  String get noTextOnPage => 'Bu sayfada metin bulunamadı.';

  @override
  String pageNText(int n) {
    return 'Sayfa $n metni';
  }

  @override
  String deletePageQuestion(int n) {
    return '$n. sayfa silinsin mi?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Sayfa $n / $total';
  }

  @override
  String get rotateLeft => 'Sola döndür';

  @override
  String get rotateRight => 'Sağa döndür';

  @override
  String get sign => 'İmzala';

  @override
  String get copyText => 'Metni kopyala';

  @override
  String get shareImage => 'Görseli paylaş';

  @override
  String get deletePage => 'Sayfayı sil';

  @override
  String get signed => 'İmzalandı.';

  @override
  String signPageN(int n) {
    return '$n. sayfayı imzala';
  }

  @override
  String get deleteThisSignature => 'Bu imzayı sil';

  @override
  String get newSignature => 'Yeni imza';

  @override
  String readingPage(int n, int total) {
    return 'Sayfa okunuyor $n / $total';
  }

  @override
  String get ocrFailed => 'Metin tanıma başarısız oldu.';

  @override
  String ocrFailedWith(String error) {
    return 'Metin tanıma başarısız oldu: $error';
  }

  @override
  String get textSaved => 'Metin kaydedildi.';

  @override
  String get text => 'Metin';

  @override
  String get copyAll => 'Tümünü kopyala';

  @override
  String get shareText => 'Metni paylaş';

  @override
  String get saveAsTxt => '.txt olarak kaydet';

  @override
  String get readAgain => 'Yeniden oku';

  @override
  String get readAsLatin => 'İngilizce / Latin olarak oku';

  @override
  String get readAsDevanagari => 'Hintçe / Nepalce olarak oku';

  @override
  String get ocrModelHint =>
      'Android\'de metin modeli Google Play hizmetleri tarafından bir kez indirilir. İlk kullanımsa bir dakika bekleyip tekrar deneyin.';

  @override
  String get noTextFound => 'Metin bulunamadı.';

  @override
  String pageSeparator(int n) {
    return '--- Sayfa $n ---';
  }

  @override
  String get scanner => 'Tarayıcı';

  @override
  String get scanMode => 'Tarama modu';

  @override
  String get modeFull => 'Tam: filtreler + leke ve parmak temizleme';

  @override
  String get modeFilter => 'Yalnızca filtreler';

  @override
  String get modeBase => 'Temel: yalnızca kırpma ve döndürme';

  @override
  String get allowGallery => 'Galeriden içe aktarmaya izin ver';

  @override
  String get allowGalleryHint => 'Tarayıcıda bir galeri düğmesi gösterir';

  @override
  String get pagesPerScan => 'Tarama başına sayfa';

  @override
  String get iosScannerNote =>
      'iPhone\'da tarayıcı, Apple\'ın kendi belge kamerasıdır.';

  @override
  String get iosScannerNote2 =>
      'Otomatik çekim, kenar algılama ve renk modları yerleşiktir.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Sayfa boyutu';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Taramayla aynı biçim';

  @override
  String get searchablePdf => 'Aranabilir PDF';

  @override
  String get searchablePdfHint =>
      'PDF\'de arama yapılabilmesi ve metnin kopyalanabilmesi için görünmez bir metin katmanı ekler';

  @override
  String get textRecognition => 'Metin tanıma';

  @override
  String get quality => 'Kalite';

  @override
  String get qualityBest => 'En iyi: tam çözünürlük, küçük yazıları okur';

  @override
  String get qualityFast => 'Hızlı: sayfanın küçültülmüş kopyası';

  @override
  String get language => 'Dil';

  @override
  String get scriptLatin => 'İngilizce ve diğer Latin alfabeli diller';

  @override
  String get scriptDevanagari => 'Hintçe, Nepalce, Marathi (+ Latin)';

  @override
  String get scriptChinese => 'Çince (+ Latin)';

  @override
  String get scriptJapanese => 'Japonca (+ Latin)';

  @override
  String get scriptKorean => 'Korece (+ Latin)';

  @override
  String get readAsChinese => 'Çince olarak oku';

  @override
  String get readAsJapanese => 'Japonca olarak oku';

  @override
  String get readAsKorean => 'Korece olarak oku';

  @override
  String get languageAuto => 'Dil otomatik olarak algılanır.';

  @override
  String get appearance => 'Görünüm';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Telefonla aynı';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get about => 'Hakkında';

  @override
  String get aboutPromise => 'Reklam yok. Hesap yok. İzleme yok.';

  @override
  String get aboutPromiseBody =>
      'Taramalar, paylaşmadığınız veya dışa aktarmadığınız sürece bu telefonda kalır. Uygulamayı kaldırmak taramaları da siler; saklamak istediklerinizi dışa aktarın.';

  @override
  String get openSource => 'Açık kaynak (Apache-2.0)';

  @override
  String get privacyPolicy => 'Gizlilik politikası';

  @override
  String get opensInBrowser => 'Web tarayıcınızda açılır';

  @override
  String get aboutTechAndroid =>
      'Tarama ve metin tanıma: Google ML Kit (cihazda). PDF birleştirme: PDFBox-Android. Devanagari yazı tipi: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Tarama: Apple VisionKit, metin tanıma: Apple Vision (cihazda). Devanagari yazı tipi: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url açılamadı';
  }

  @override
  String get scanBusinessCard => 'Kartvizit tara';

  @override
  String get saveAsContact => 'Kişi olarak kaydet';

  @override
  String get saveToContacts => 'Kişiler\'e kaydet';

  @override
  String get photoToContact => 'Put the card photo on the contact';

  @override
  String get contactReviewTitle => 'Kartvizit';

  @override
  String get contactHint =>
      'Alanları kontrol edin, sonra kaydedin. Telefonunuzun Kişiler uygulaması tüm bilgiler doldurulmuş olarak açılır.';

  @override
  String get readingCard => 'Kartvizit okunuyor…';

  @override
  String get nothingRecognised =>
      'Bu kartvizitte metin tanınamadı. Bilgileri yine de yazabilirsiniz.';

  @override
  String get contactOpened =>
      'Kişiler açıldı. Saklamak için orada Kaydet\'e dokunun.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Kişiler açılamadı: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kartvizit $stamp';
  }

  @override
  String get fieldCompany => 'Şirket';

  @override
  String get fieldJobTitle => 'Unvan';

  @override
  String get fieldMobile => 'Cep';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Faks';

  @override
  String get fieldEmail => 'E-posta';

  @override
  String get fieldWebsite => 'Web sitesi';

  @override
  String get fieldAddress => 'Adres';

  @override
  String get fieldCity => 'Şehir';

  @override
  String get fieldCountry => 'Ülke';

  @override
  String get fieldNotes => 'Notlar';

  @override
  String get drawFirst => 'Önce imzanızı çizin.';

  @override
  String get clear => 'Temizle';

  @override
  String get undo => 'Geri al';

  @override
  String get save => 'Kaydet';

  @override
  String get signHint =>
      'Kutunun içine parmağınızla imza atın. Daha fazla alan için telefonu yan çevirin.';

  @override
  String get thin => 'İnce';

  @override
  String get medium => 'Orta';

  @override
  String get thick => 'Kalın';

  @override
  String couldNotReadPage(String error) {
    return 'Sayfa okunamadı: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'İmzalanamadı: $error';
  }

  @override
  String get placeSignature => 'İmzayı yerleştir';

  @override
  String get apply => 'Uygula';

  @override
  String get dragPinchHint =>
      'Taşımak için sürükleyin. Boyutlandırmak için iki parmağınızla sıkıştırın.';

  @override
  String get smaller => 'Küçült';

  @override
  String get larger => 'Büyüt';
}
