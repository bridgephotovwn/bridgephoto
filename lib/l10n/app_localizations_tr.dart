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
  String get checkPdfTitle => 'Check a PDF someone sent';

  @override
  String get checkPdfNothing => 'Nothing odd found in this file.';

  @override
  String get checkPdfIntro =>
      'Things worth a look. Each one has an innocent explanation — none of them means the document is false.';

  @override
  String checkPdfBox(int page) {
    return 'Page $page: text is still readable under a blacked-out box';
  }

  @override
  String checkPdfFonts(int page) {
    return 'Page $page: the fonts only half travel with this file';
  }

  @override
  String get checkPdfRevisions =>
      'Saved more than once, one version on top of another';

  @override
  String get checkPdfMadeBy => 'Made by';

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
  String get exportAsImages => 'JPEG / PNG olarak dışa aktar';

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
  String get undo => 'Geri al';

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
  String get enhanceWhiteboard => 'Whiteboard — bring the marker back';

  @override
  String get enhanceBleed => 'Remove show-through from the back';

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
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Yeniden oku';

  @override
  String get readAsLatin => 'İngilizce / Latin olarak oku';

  @override
  String get readAsDevanagari => 'Hintçe / Nepalce olarak oku';

  @override
  String get readAsArabic => 'Read as Arabic';

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
  String get scriptArabic => 'Arabic (+ Latin)';

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
  String get includeCardPhoto => 'Add the card photo';

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
