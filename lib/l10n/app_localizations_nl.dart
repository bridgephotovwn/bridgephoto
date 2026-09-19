// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scannen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Sluiten';

  @override
  String get delete => 'Verwijderen';

  @override
  String get share => 'Delen';

  @override
  String get copy => 'Kopiëren';

  @override
  String get copied => 'Gekopieerd.';

  @override
  String get saved => 'Opgeslagen.';

  @override
  String get name => 'Naam';

  @override
  String get rename => 'Naam wijzigen';

  @override
  String get settings => 'Instellingen';

  @override
  String get dismiss => 'Negeren';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get cannotBeUndone => 'Dit kan niet ongedaan worden gemaakt.';

  @override
  String get savingPages => 'Pagina\'s opslaan…';

  @override
  String get preparingScanner =>
      'Scanner voorbereiden…\nEerste gebruik: Google Play-services downloadt de scanner eenmalig.';

  @override
  String get scannerUnavailable => 'De scanner is niet beschikbaar.';

  @override
  String scannerUnavailableWith(String error) {
    return 'De scanner is niet beschikbaar: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Kan de pagina\'s niet opslaan: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Kan de bestandskiezer niet openen: $error';
  }

  @override
  String get importingPdf => 'PDF importeren…';

  @override
  String get importedPdf => 'Geïmporteerde PDF';

  @override
  String couldNotImport(String error) {
    return 'Kan niet importeren: $error';
  }

  @override
  String get pickTwoPdfs => 'Kies minstens twee PDF-bestanden.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF-bestanden samenvoegen…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Samengevoegd $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Kan niet samenvoegen: $error';
  }

  @override
  String get saveToFolder => 'Opslaan in een map';

  @override
  String couldNotSave(String error) {
    return 'Kan niet opslaan: $error';
  }

  @override
  String get mergedDocument => 'Samengevoegd document';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count meer';
  }

  @override
  String get merging => 'Samenvoegen…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documenten verwijderen?',
      one: '1 document verwijderen?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF maken…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF $n / $total maken…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF maken, pagina $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Kan de PDF niet maken: $error';
  }

  @override
  String get searchDocuments => 'Documenten zoeken';

  @override
  String get closeSearch => 'Zoeken sluiten';

  @override
  String get search => 'Zoeken';

  @override
  String get importPdfAsPages => 'PDF importeren als pagina\'s';

  @override
  String get mergePdfFiles => 'PDF-bestanden samenvoegen';

  @override
  String get clearSelection => 'Selectie wissen';

  @override
  String nSelected(int count) {
    return '$count geselecteerd';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count geselecteerd · samenvoegen in deze volgorde';
  }

  @override
  String get mergeIntoOne => 'Samenvoegen tot één document';

  @override
  String get shareAsPdf => 'Delen als PDF';

  @override
  String get selectAll => 'Alles selecteren';

  @override
  String get noScansYet => 'Nog geen scans';

  @override
  String get nothingMatches => 'Geen resultaten';

  @override
  String get emptyHint =>
      'Tik op Scannen om een document te fotograferen. Alles blijft op deze telefoon.';

  @override
  String get tryAnotherWord => 'Probeer een ander woord.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina\'s',
      one: '1 pagina',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Scan $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO is onverwacht gestopt';

  @override
  String get crashBody =>
      'Een rapport van de fout is alleen op deze telefoon opgeslagen. Door het met de ontwikkelaar te delen helpt u het probleem op te lossen. Het bevat technische details, niet uw documenten.';

  @override
  String get reportCopied => 'Rapport gekopieerd.';

  @override
  String get crashReportSubject => 'Crashrapport BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF opgeslagen.';

  @override
  String couldNotSavePdf(String error) {
    return 'Kan de PDF niet opslaan: $error';
  }

  @override
  String get exportPagesAsImages => 'Pagina\'s exporteren als afbeeldingen';

  @override
  String get saveToPhotos => 'Opslaan in Foto\'s';

  @override
  String get savingToPhotos => 'Opslaan in Foto\'s…';

  @override
  String get photosNeedsAndroid10 =>
      'Opslaan in Foto\'s vereist Android 10 of nieuwer. Gebruik in plaats daarvan Delen.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO mag niets toevoegen aan Foto\'s. Sta dit toe in Instellingen of gebruik Delen.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count afbeeldingen opgeslagen in Foto\'s.',
      one: '1 afbeelding opgeslagen in Foto\'s.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Kan niet exporteren: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Dit document verwijderen?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count pagina\'s worden verwijderd. Dit kan niet ongedaan worden gemaakt.',
      one: '1 pagina wordt verwijderd. Dit kan niet ongedaan worden gemaakt.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Tekst (OCR)';

  @override
  String get sharePdf => 'PDF delen';

  @override
  String get savePdfToFolder => 'PDF opslaan in een map';

  @override
  String get exportAsImages => 'Exporteren als JPEG / PNG';

  @override
  String get deleteDocument => 'Document verwijderen';

  @override
  String get noPages => 'Geen pagina\'s. Tik op Pagina\'s toevoegen.';

  @override
  String get addPages => 'Pagina\'s toevoegen';

  @override
  String get holdToReorder => 'houd een pagina vast om de volgorde te wijzigen';

  @override
  String get savePdfDialogTitle => 'PDF opslaan';

  @override
  String get saveDialogTitle => 'Opslaan';

  @override
  String couldNotRotate(String error) {
    return 'Kan niet draaien: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Kan niet delen: $error';
  }

  @override
  String get noTextOnPage => 'Geen tekst gevonden op deze pagina.';

  @override
  String pageNText(int n) {
    return 'Tekst van pagina $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Pagina $n verwijderen?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Pagina $n van $total';
  }

  @override
  String get rotateLeft => 'Linksom draaien';

  @override
  String get rotateRight => 'Rechtsom draaien';

  @override
  String get sign => 'Ondertekenen';

  @override
  String get copyText => 'Tekst kopiëren';

  @override
  String get shareImage => 'Afbeelding delen';

  @override
  String get deletePage => 'Pagina verwijderen';

  @override
  String get signed => 'Ondertekend.';

  @override
  String signPageN(int n) {
    return 'Pagina $n ondertekenen';
  }

  @override
  String get deleteThisSignature => 'Deze handtekening verwijderen';

  @override
  String get newSignature => 'Nieuwe handtekening';

  @override
  String readingPage(int n, int total) {
    return 'Pagina $n / $total lezen';
  }

  @override
  String get ocrFailed => 'Tekstherkenning mislukt.';

  @override
  String ocrFailedWith(String error) {
    return 'Tekstherkenning mislukt: $error';
  }

  @override
  String get textSaved => 'Tekst opgeslagen.';

  @override
  String get text => 'Tekst';

  @override
  String get copyAll => 'Alles kopiëren';

  @override
  String get shareText => 'Tekst delen';

  @override
  String get saveAsTxt => 'Opslaan als .txt';

  @override
  String get readAgain => 'Opnieuw lezen';

  @override
  String get readAsLatin => 'Lezen als Engels / Latijns';

  @override
  String get readAsDevanagari => 'Lezen als Hindi / Nepalees';

  @override
  String get ocrModelHint =>
      'Op Android wordt het tekstmodel eenmalig gedownload door Google Play-services. Wacht bij het eerste gebruik een minuut en probeer het opnieuw.';

  @override
  String get noTextFound => 'Geen tekst gevonden.';

  @override
  String pageSeparator(int n) {
    return '--- Pagina $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Scanmodus';

  @override
  String get modeFull => 'Volledig: filters + vlekken en vingers verwijderen';

  @override
  String get modeFilter => 'Alleen filters';

  @override
  String get modeBase => 'Basis: alleen bijsnijden en draaien';

  @override
  String get allowGallery => 'Importeren uit galerij toestaan';

  @override
  String get allowGalleryHint => 'Toont een galerijknop in de scanner';

  @override
  String get pagesPerScan => 'Pagina\'s per scan';

  @override
  String get iosScannerNote =>
      'Op de iPhone is de scanner de documentcamera van Apple zelf.';

  @override
  String get iosScannerNote2 =>
      'Automatisch vastleggen, randdetectie en kleurmodi zijn ingebouwd.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Paginaformaat';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Zelfde vorm als de scan';

  @override
  String get searchablePdf => 'Doorzoekbare PDF';

  @override
  String get searchablePdfHint =>
      'Voegt een onzichtbare tekstlaag toe zodat u in de PDF kunt zoeken en tekst kunt kopiëren';

  @override
  String get textRecognition => 'Tekstherkenning';

  @override
  String get quality => 'Kwaliteit';

  @override
  String get qualityBest =>
      'Beste: volledige resolutie, leest ook kleine lettertjes';

  @override
  String get qualityFast => 'Snel: verkleinde kopie van de pagina';

  @override
  String get language => 'Taal';

  @override
  String get scriptLatin => 'Engels en andere talen met Latijns schrift';

  @override
  String get scriptDevanagari => 'Hindi, Nepalees, Marathi (+ Latijns)';

  @override
  String get scriptChinese => 'Chinees (+ Latijns)';

  @override
  String get scriptJapanese => 'Japans (+ Latijns)';

  @override
  String get scriptKorean => 'Koreaans (+ Latijns)';

  @override
  String get readAsChinese => 'Lezen als Chinees';

  @override
  String get readAsJapanese => 'Lezen als Japans';

  @override
  String get readAsKorean => 'Lezen als Koreaans';

  @override
  String get languageAuto => 'De taal wordt automatisch herkend.';

  @override
  String get appearance => 'Weergave';

  @override
  String get theme => 'Thema';

  @override
  String get themeSystem => 'Zoals de telefoon';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get about => 'Over';

  @override
  String get aboutPromise => 'Geen advertenties. Geen account. Geen tracking.';

  @override
  String get aboutPromiseBody =>
      'Scans blijven op deze telefoon, tenzij u ze deelt of exporteert. Bij het verwijderen van de app worden ze gewist, dus exporteer wat u wilt bewaren.';

  @override
  String get openSource => 'Opensource (Apache-2.0)';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get opensInBrowser => 'Wordt geopend in uw browser';

  @override
  String get aboutTechAndroid =>
      'Scannen en tekstherkenning door Google ML Kit (op het apparaat). PDF\'s samenvoegen door PDFBox-Android. Devanagari-lettertype: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scannen door Apple VisionKit, tekstherkenning door Apple Vision (op het apparaat). Devanagari-lettertype: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Kan $url niet openen';
  }

  @override
  String get scanBusinessCard => 'Een visitekaartje scannen';

  @override
  String get saveAsContact => 'Opslaan als contact';

  @override
  String get saveToContacts => 'Opslaan in Contacten';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Visitekaartje';

  @override
  String get contactHint =>
      'Controleer de velden en sla daarna op. De app Contacten op uw telefoon wordt geopend met alles al ingevuld.';

  @override
  String get readingCard => 'Kaartje wordt gelezen…';

  @override
  String get nothingRecognised =>
      'Er is geen tekst herkend op dit kaartje. U kunt de gegevens alsnog intypen.';

  @override
  String get contactOpened =>
      'Contacten is geopend. Tik daar op Opslaan om het contact te bewaren.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Kan Contacten niet openen: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kaartje $stamp';
  }

  @override
  String get fieldCompany => 'Bedrijf';

  @override
  String get fieldJobTitle => 'Functie';

  @override
  String get fieldMobile => 'Mobiel';

  @override
  String get fieldPhone => 'Telefoon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Adres';

  @override
  String get fieldCity => 'Plaats';

  @override
  String get fieldCountry => 'Land';

  @override
  String get fieldNotes => 'Notities';

  @override
  String get drawFirst => 'Teken eerst uw handtekening.';

  @override
  String get clear => 'Wissen';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get save => 'Opslaan';

  @override
  String get signHint =>
      'Onderteken in het vak met uw vinger. Draai de telefoon een kwartslag voor meer ruimte.';

  @override
  String get thin => 'Dun';

  @override
  String get medium => 'Gemiddeld';

  @override
  String get thick => 'Dik';

  @override
  String couldNotReadPage(String error) {
    return 'Kan de pagina niet lezen: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Kan niet ondertekenen: $error';
  }

  @override
  String get placeSignature => 'Handtekening plaatsen';

  @override
  String get apply => 'Toepassen';

  @override
  String get dragPinchHint =>
      'Sleep om te verplaatsen. Knijp om de grootte te wijzigen.';

  @override
  String get smaller => 'Kleiner';

  @override
  String get larger => 'Groter';
}
