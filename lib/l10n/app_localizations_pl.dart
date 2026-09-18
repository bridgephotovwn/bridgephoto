// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Skanuj';

  @override
  String get cancel => 'Anuluj';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Zamknij';

  @override
  String get delete => 'Usuń';

  @override
  String get share => 'Udostępnij';

  @override
  String get copy => 'Kopiuj';

  @override
  String get copied => 'Skopiowano.';

  @override
  String get saved => 'Zapisano.';

  @override
  String get name => 'Nazwa';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get settings => 'Ustawienia';

  @override
  String get dismiss => 'Odrzuć';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get cannotBeUndone => 'Tej operacji nie można cofnąć.';

  @override
  String get savingPages => 'Zapisywanie stron…';

  @override
  String get preparingScanner =>
      'Przygotowywanie skanera…\nPierwsze użycie: Usługi Google Play pobierają go jednorazowo.';

  @override
  String get scannerUnavailable => 'Skaner jest niedostępny.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Skaner jest niedostępny: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Nie udało się zapisać stron: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Nie udało się otworzyć wyboru plików: $error';
  }

  @override
  String get importingPdf => 'Importowanie PDF…';

  @override
  String get importedPdf => 'Zaimportowany PDF';

  @override
  String couldNotImport(String error) {
    return 'Nie udało się zaimportować: $error';
  }

  @override
  String get pickTwoPdfs => 'Wybierz co najmniej dwa pliki PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Scalanie plików PDF ($count)…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Scalony $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Nie udało się scalić: $error';
  }

  @override
  String get saveToFolder => 'Zapisz w folderze';

  @override
  String couldNotSave(String error) {
    return 'Nie udało się zapisać: $error';
  }

  @override
  String get mergedDocument => 'Scalony dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + jeszcze $count';
  }

  @override
  String get merging => 'Scalanie…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunąć $count dokumentu?',
      many: 'Usunąć $count dokumentów?',
      few: 'Usunąć $count dokumenty?',
      one: 'Usunąć 1 dokument?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Tworzenie PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Tworzenie PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Tworzenie PDF, strona $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Nie udało się utworzyć PDF: $error';
  }

  @override
  String get searchDocuments => 'Szukaj dokumentów';

  @override
  String get closeSearch => 'Zamknij wyszukiwanie';

  @override
  String get search => 'Szukaj';

  @override
  String get importPdfAsPages => 'Importuj PDF jako strony';

  @override
  String get mergePdfFiles => 'Scal pliki PDF';

  @override
  String get clearSelection => 'Wyczyść zaznaczenie';

  @override
  String nSelected(int count) {
    return 'Zaznaczono: $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Zaznaczono: $count · scalanie w tej kolejności';
  }

  @override
  String get mergeIntoOne => 'Scal w jeden dokument';

  @override
  String get shareAsPdf => 'Udostępnij jako PDF';

  @override
  String get selectAll => 'Zaznacz wszystko';

  @override
  String get noScansYet => 'Brak skanów';

  @override
  String get nothingMatches => 'Brak wyników';

  @override
  String get emptyHint =>
      'Dotknij Skanuj, aby sfotografować dokument. Wszystko zostaje na tym telefonie.';

  @override
  String get tryAnotherWord => 'Spróbuj innego słowa.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '1 strona',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Skan $stamp';
  }

  @override
  String get crashTitle =>
      'Aplikacja BRIDGE PHOTO została nieoczekiwanie zamknięta';

  @override
  String get crashBody =>
      'Raport o błędzie został zapisany tylko na tym telefonie. Udostępnienie go deweloperowi pomaga rozwiązać problem. Zawiera szczegóły techniczne, nie Twoje dokumenty.';

  @override
  String get reportCopied => 'Raport skopiowany.';

  @override
  String get crashReportSubject => 'Raport o awarii BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF zapisany.';

  @override
  String couldNotSavePdf(String error) {
    return 'Nie udało się zapisać PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Eksportuj strony jako obrazy';

  @override
  String get saveToPhotos => 'Zapisz w Zdjęciach';

  @override
  String get savingToPhotos => 'Zapisywanie w Zdjęciach…';

  @override
  String get photosNeedsAndroid10 =>
      'Zapisywanie w Zdjęciach wymaga Androida 10 lub nowszego. Zamiast tego użyj opcji Udostępnij.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO nie ma uprawnień do dodawania do Zdjęć. Zezwól na to w Ustawieniach lub użyj opcji Udostępnij.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano $count obrazu w Zdjęciach.',
      many: 'Zapisano $count obrazów w Zdjęciach.',
      few: 'Zapisano $count obrazy w Zdjęciach.',
      one: 'Zapisano 1 obraz w Zdjęciach.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Nie udało się wyeksportować: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Usunąć ten dokument?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zostanie usunięte $count strony. Tej operacji nie można cofnąć.',
      many: 'Zostanie usuniętych $count stron. Tej operacji nie można cofnąć.',
      few: 'Zostaną usunięte $count strony. Tej operacji nie można cofnąć.',
      one: 'Zostanie usunięta 1 strona. Tej operacji nie można cofnąć.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Tekst (OCR)';

  @override
  String get sharePdf => 'Udostępnij PDF';

  @override
  String get savePdfToFolder => 'Zapisz PDF w folderze';

  @override
  String get exportAsImages => 'Eksportuj jako JPEG / PNG';

  @override
  String get deleteDocument => 'Usuń dokument';

  @override
  String get noPages => 'Brak stron. Dotknij Dodaj strony.';

  @override
  String get addPages => 'Dodaj strony';

  @override
  String get holdToReorder => 'przytrzymaj stronę, aby zmienić kolejność';

  @override
  String get savePdfDialogTitle => 'Zapisz PDF';

  @override
  String get saveDialogTitle => 'Zapisz';

  @override
  String couldNotRotate(String error) {
    return 'Nie udało się obrócić: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Nie udało się udostępnić: $error';
  }

  @override
  String get noTextOnPage => 'Nie znaleziono tekstu na tej stronie.';

  @override
  String pageNText(int n) {
    return 'Tekst strony $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Usunąć stronę $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Strona $n z $total';
  }

  @override
  String get rotateLeft => 'Obróć w lewo';

  @override
  String get rotateRight => 'Obróć w prawo';

  @override
  String get sign => 'Podpisz';

  @override
  String get copyText => 'Kopiuj tekst';

  @override
  String get shareImage => 'Udostępnij obraz';

  @override
  String get deletePage => 'Usuń stronę';

  @override
  String get signed => 'Podpisano.';

  @override
  String signPageN(int n) {
    return 'Podpisz stronę $n';
  }

  @override
  String get deleteThisSignature => 'Usuń ten podpis';

  @override
  String get newSignature => 'Nowy podpis';

  @override
  String readingPage(int n, int total) {
    return 'Odczytywanie strony $n / $total';
  }

  @override
  String get ocrFailed => 'Rozpoznawanie tekstu nie powiodło się.';

  @override
  String ocrFailedWith(String error) {
    return 'Rozpoznawanie tekstu nie powiodło się: $error';
  }

  @override
  String get textSaved => 'Tekst zapisany.';

  @override
  String get text => 'Tekst';

  @override
  String get copyAll => 'Kopiuj wszystko';

  @override
  String get shareText => 'Udostępnij tekst';

  @override
  String get saveAsTxt => 'Zapisz jako .txt';

  @override
  String get readAgain => 'Odczytaj ponownie';

  @override
  String get readAsLatin => 'Odczytaj jako angielski / łaciński';

  @override
  String get readAsDevanagari => 'Odczytaj jako hindi / nepalski';

  @override
  String get ocrModelHint =>
      'Na Androidzie model tekstu jest pobierany jednorazowo przez Usługi Google Play. Jeśli to pierwsze użycie, odczekaj minutę i spróbuj ponownie.';

  @override
  String get noTextFound => 'Nie znaleziono tekstu.';

  @override
  String pageSeparator(int n) {
    return '--- Strona $n ---';
  }

  @override
  String get scanner => 'Skaner';

  @override
  String get scanMode => 'Tryb skanowania';

  @override
  String get modeFull => 'Pełny: filtry + usuwanie plam i palców';

  @override
  String get modeFilter => 'Tylko filtry';

  @override
  String get modeBase => 'Podstawowy: tylko kadrowanie i obracanie';

  @override
  String get allowGallery => 'Zezwól na import z galerii';

  @override
  String get allowGalleryHint => 'Pokazuje przycisk galerii w skanerze';

  @override
  String get pagesPerScan => 'Stron na skan';

  @override
  String get iosScannerNote =>
      'Na urządzeniu iPhone skanerem jest własny aparat do dokumentów firmy Apple.';

  @override
  String get iosScannerNote2 =>
      'Automatyczne przechwytywanie, wykrywanie krawędzi i tryby kolorów są wbudowane.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Rozmiar strony';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Taki sam kształt jak skan';

  @override
  String get searchablePdf => 'PDF z możliwością wyszukiwania';

  @override
  String get searchablePdfHint =>
      'Dodaje niewidoczną warstwę tekstu, aby można było przeszukiwać PDF i kopiować tekst';

  @override
  String get textRecognition => 'Rozpoznawanie tekstu';

  @override
  String get quality => 'Jakość';

  @override
  String get qualityBest =>
      'Najlepsza: pełna rozdzielczość, odczytuje drobny druk';

  @override
  String get qualityFast => 'Szybka: pomniejszona kopia strony';

  @override
  String get language => 'Język';

  @override
  String get scriptLatin => 'Angielski i inne języki z alfabetem łacińskim';

  @override
  String get scriptDevanagari => 'Hindi, nepalski, marathi (+ łaciński)';

  @override
  String get scriptChinese => 'Chiński (+ łaciński)';

  @override
  String get scriptJapanese => 'Japoński (+ łaciński)';

  @override
  String get scriptKorean => 'Koreański (+ łaciński)';

  @override
  String get readAsChinese => 'Odczytaj jako chiński';

  @override
  String get readAsJapanese => 'Odczytaj jako japoński';

  @override
  String get readAsKorean => 'Odczytaj jako koreański';

  @override
  String get languageAuto => 'Język jest wykrywany automatycznie.';

  @override
  String get appearance => 'Wygląd';

  @override
  String get theme => 'Motyw';

  @override
  String get themeSystem => 'Jak w telefonie';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get about => 'Informacje';

  @override
  String get aboutPromise => 'Bez reklam. Bez konta. Bez śledzenia.';

  @override
  String get aboutPromiseBody =>
      'Skany zostają na tym telefonie, chyba że je udostępnisz lub wyeksportujesz. Odinstalowanie aplikacji usuwa je, więc wyeksportuj to, co chcesz zachować.';

  @override
  String get openSource => 'Otwarte oprogramowanie (Apache-2.0)';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get opensInBrowser => 'Otwiera się w przeglądarce';

  @override
  String get aboutTechAndroid =>
      'Skanowanie i rozpoznawanie tekstu: Google ML Kit (na urządzeniu). Scalanie PDF: PDFBox-Android. Czcionka dewanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Skanowanie: Apple VisionKit, rozpoznawanie tekstu: Apple Vision (na urządzeniu). Czcionka dewanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Nie udało się otworzyć $url';
  }

  @override
  String get scanBusinessCard => 'Skanuj wizytówkę';

  @override
  String get saveAsContact => 'Zapisz jako kontakt';

  @override
  String get saveToContacts => 'Zapisz w Kontaktach';

  @override
  String get photoToContact => 'Put the card photo on the contact';

  @override
  String get contactReviewTitle => 'Wizytówka';

  @override
  String get contactHint =>
      'Sprawdź pola, a potem zapisz. Aplikacja Kontakty w telefonie otworzy się z wypełnionymi danymi.';

  @override
  String get readingCard => 'Odczytywanie wizytówki…';

  @override
  String get nothingRecognised =>
      'Nie rozpoznano tekstu na tej wizytówce. Nadal możesz wpisać dane ręcznie.';

  @override
  String get contactOpened =>
      'Otwarto Kontakty. Dotknij tam Zapisz, aby zachować kontakt.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Nie udało się otworzyć Kontaktów: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Wizytówka $stamp';
  }

  @override
  String get fieldCompany => 'Firma';

  @override
  String get fieldJobTitle => 'Stanowisko';

  @override
  String get fieldMobile => 'Komórka';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Faks';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Strona internetowa';

  @override
  String get fieldAddress => 'Adres';

  @override
  String get fieldCity => 'Miasto';

  @override
  String get fieldCountry => 'Kraj';

  @override
  String get fieldNotes => 'Notatki';

  @override
  String get drawFirst => 'Najpierw narysuj swój podpis.';

  @override
  String get clear => 'Wyczyść';

  @override
  String get undo => 'Cofnij';

  @override
  String get save => 'Zapisz';

  @override
  String get signHint =>
      'Podpisz się palcem w polu. Obróć telefon poziomo, aby mieć więcej miejsca.';

  @override
  String get thin => 'Cienki';

  @override
  String get medium => 'Średni';

  @override
  String get thick => 'Gruby';

  @override
  String couldNotReadPage(String error) {
    return 'Nie udało się odczytać strony: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Nie udało się podpisać: $error';
  }

  @override
  String get placeSignature => 'Umieść podpis';

  @override
  String get apply => 'Zastosuj';

  @override
  String get dragPinchHint =>
      'Przeciągnij, aby przesunąć. Uszczypnij, aby zmienić rozmiar.';

  @override
  String get smaller => 'Mniejszy';

  @override
  String get larger => 'Większy';
}
