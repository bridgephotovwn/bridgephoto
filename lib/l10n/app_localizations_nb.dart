// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Skann';

  @override
  String get cancel => 'Avbryt';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Lukk';

  @override
  String get delete => 'Slett';

  @override
  String get share => 'Del';

  @override
  String get copy => 'Kopier';

  @override
  String get copied => 'Kopiert.';

  @override
  String get saved => 'Lagret.';

  @override
  String get name => 'Navn';

  @override
  String get rename => 'Gi nytt navn';

  @override
  String get settings => 'Innstillinger';

  @override
  String get dismiss => 'Avvis';

  @override
  String get tryAgain => 'Prøv igjen';

  @override
  String get cannotBeUndone => 'Dette kan ikke angres.';

  @override
  String get savingPages => 'Lagrer sider…';

  @override
  String get preparingScanner =>
      'Klargjør skanneren…\nFørste gang: Google Play-tjenester laster den ned én gang.';

  @override
  String get scannerUnavailable => 'Skanneren er ikke tilgjengelig.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Skanneren er ikke tilgjengelig: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Kunne ikke lagre sidene: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Kunne ikke åpne filvelgeren: $error';
  }

  @override
  String get importingPdf => 'Importerer PDF…';

  @override
  String get importedPdf => 'Importert PDF';

  @override
  String couldNotImport(String error) {
    return 'Kunne ikke importere: $error';
  }

  @override
  String get pickTwoPdfs => 'Velg minst to PDF-filer.';

  @override
  String mergingPdfs(int count) {
    return 'Slår sammen $count PDF-filer…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Sammenslått $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Kunne ikke slå sammen: $error';
  }

  @override
  String get saveToFolder => 'Lagre i en mappe';

  @override
  String couldNotSave(String error) {
    return 'Kunne ikke lagre: $error';
  }

  @override
  String get mergedDocument => 'Sammenslått dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count til';
  }

  @override
  String get merging => 'Slår sammen…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slette $count dokumenter?',
      one: 'Slette 1 dokument?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Lager PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Lager PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Lager PDF, side $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Kunne ikke lage PDF-filen: $error';
  }

  @override
  String get searchDocuments => 'Søk i dokumenter';

  @override
  String get closeSearch => 'Lukk søk';

  @override
  String get search => 'Søk';

  @override
  String get importPdfAsPages => 'Importer PDF som sider';

  @override
  String get mergePdfFiles => 'Slå sammen PDF-filer';

  @override
  String get clearSelection => 'Fjern markering';

  @override
  String nSelected(int count) {
    return '$count valgt';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count valgt · slås sammen i denne rekkefølgen';
  }

  @override
  String get mergeIntoOne => 'Slå sammen til ett dokument';

  @override
  String get shareAsPdf => 'Del som PDF';

  @override
  String get selectAll => 'Velg alle';

  @override
  String get noScansYet => 'Ingen skanninger ennå';

  @override
  String get nothingMatches => 'Ingen treff';

  @override
  String get emptyHint =>
      'Trykk på Skann for å fotografere et dokument. Alt blir værende på denne telefonen.';

  @override
  String get tryAnotherWord => 'Prøv et annet ord.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '1 side',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Skanning $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO ble uventet avsluttet';

  @override
  String get crashBody =>
      'En rapport om hva som gikk galt, er lagret bare på denne telefonen. Å dele den med utvikleren hjelper til med å rette feilen. Den inneholder tekniske detaljer, ikke dokumentene dine.';

  @override
  String get reportCopied => 'Rapport kopiert.';

  @override
  String get crashReportSubject => 'Krasjrapport fra BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF lagret.';

  @override
  String couldNotSavePdf(String error) {
    return 'Kunne ikke lagre PDF-filen: $error';
  }

  @override
  String get exportPagesAsImages => 'Eksporter sider som bilder';

  @override
  String get saveToPhotos => 'Lagre i Bilder';

  @override
  String get savingToPhotos => 'Lagrer i Bilder…';

  @override
  String get photosNeedsAndroid10 =>
      'Lagring i Bilder krever Android 10 eller nyere. Bruk Del i stedet.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO har ikke tillatelse til å legge til i Bilder. Tillat det i Innstillinger, eller bruk Del.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder lagret i Bilder.',
      one: '1 bilde lagret i Bilder.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Kunne ikke eksportere: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Slette dette dokumentet?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider blir slettet. Dette kan ikke angres.',
      one: '1 side blir slettet. Dette kan ikke angres.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Tekst (OCR)';

  @override
  String get sharePdf => 'Del PDF';

  @override
  String get savePdfToFolder => 'Lagre PDF i en mappe';

  @override
  String get exportAsImages => 'Eksporter som JPEG / PNG';

  @override
  String get deleteDocument => 'Slett dokument';

  @override
  String get noPages => 'Ingen sider. Trykk på Legg til sider.';

  @override
  String get addPages => 'Legg til sider';

  @override
  String get holdToReorder => 'hold på en side for å endre rekkefølgen';

  @override
  String get savePdfDialogTitle => 'Lagre PDF';

  @override
  String get saveDialogTitle => 'Lagre';

  @override
  String couldNotRotate(String error) {
    return 'Kunne ikke rotere: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Kunne ikke dele: $error';
  }

  @override
  String get noTextOnPage => 'Fant ingen tekst på denne siden.';

  @override
  String pageNText(int n) {
    return 'Tekst på side $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Slette side $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Side $n av $total';
  }

  @override
  String get rotateLeft => 'Roter til venstre';

  @override
  String get rotateRight => 'Roter til høyre';

  @override
  String get sign => 'Signer';

  @override
  String get copyText => 'Kopier tekst';

  @override
  String get shareImage => 'Del bilde';

  @override
  String get deletePage => 'Slett side';

  @override
  String get signed => 'Signert.';

  @override
  String signPageN(int n) {
    return 'Signer side $n';
  }

  @override
  String get deleteThisSignature => 'Slett denne signaturen';

  @override
  String get newSignature => 'Ny signatur';

  @override
  String readingPage(int n, int total) {
    return 'Leser side $n / $total';
  }

  @override
  String get ocrFailed => 'Tekstgjenkjenning mislyktes.';

  @override
  String ocrFailedWith(String error) {
    return 'Tekstgjenkjenning mislyktes: $error';
  }

  @override
  String get textSaved => 'Tekst lagret.';

  @override
  String get text => 'Tekst';

  @override
  String get copyAll => 'Kopier alt';

  @override
  String get shareText => 'Del tekst';

  @override
  String get saveAsTxt => 'Lagre som .txt';

  @override
  String get readAgain => 'Les på nytt';

  @override
  String get readAsLatin => 'Les som engelsk / latinsk skrift';

  @override
  String get readAsDevanagari => 'Les som hindi / nepali';

  @override
  String get ocrModelHint =>
      'På Android lastes tekstmodellen ned én gang av Google Play-tjenester. Hvis dette er første gang, vent et minutt og prøv igjen.';

  @override
  String get noTextFound => 'Fant ingen tekst.';

  @override
  String pageSeparator(int n) {
    return '--- Side $n ---';
  }

  @override
  String get scanner => 'Skanner';

  @override
  String get scanMode => 'Skannemodus';

  @override
  String get modeFull => 'Full: filtre + fjerner flekker og fingre';

  @override
  String get modeFilter => 'Bare filtre';

  @override
  String get modeBase => 'Enkel: bare beskjæring og rotering';

  @override
  String get allowGallery => 'Tillat import fra galleriet';

  @override
  String get allowGalleryHint => 'Viser en galleriknapp i skanneren';

  @override
  String get pagesPerScan => 'Sider per skanning';

  @override
  String get iosScannerNote =>
      'På iPhone er skanneren Apples eget dokumentkamera.';

  @override
  String get iosScannerNote2 =>
      'Automatisk fotografering, kantregistrering og fargemoduser er innebygd.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Sidestørrelse';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Samme form som skanningen';

  @override
  String get searchablePdf => 'Søkbar PDF';

  @override
  String get searchablePdfHint =>
      'Legger til et usynlig tekstlag slik at du kan søke i PDF-filen og kopiere tekst';

  @override
  String get textRecognition => 'Tekstgjenkjenning';

  @override
  String get quality => 'Kvalitet';

  @override
  String get qualityBest => 'Best: full oppløsning, leser liten skrift';

  @override
  String get qualityFast => 'Rask: forminsket kopi av siden';

  @override
  String get language => 'Språk';

  @override
  String get scriptLatin => 'Engelsk og andre språk med latinsk skrift';

  @override
  String get scriptDevanagari => 'Hindi, nepali, marathi (+ latinsk)';

  @override
  String get scriptChinese => 'Kinesisk (+ latinsk)';

  @override
  String get scriptJapanese => 'Japansk (+ latinsk)';

  @override
  String get scriptKorean => 'Koreansk (+ latinsk)';

  @override
  String get readAsChinese => 'Les som kinesisk';

  @override
  String get readAsJapanese => 'Les som japansk';

  @override
  String get readAsKorean => 'Les som koreansk';

  @override
  String get languageAuto => 'Språket gjenkjennes automatisk.';

  @override
  String get appearance => 'Utseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Følg telefonen';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get about => 'Om';

  @override
  String get aboutPromise => 'Ingen annonser. Ingen konto. Ingen sporing.';

  @override
  String get aboutPromiseBody =>
      'Skanninger blir værende på denne telefonen med mindre du deler eller eksporterer dem. Avinstallerer du appen, slettes de, så eksporter det du vil beholde.';

  @override
  String get openSource => 'Åpen kildekode (Apache-2.0)';

  @override
  String get privacyPolicy => 'Personvernerklæring';

  @override
  String get opensInBrowser => 'Åpnes i nettleseren din';

  @override
  String get aboutTechAndroid =>
      'Skanning og tekstgjenkjenning av Google ML Kit (på enheten). PDF-sammenslåing av PDFBox-Android. Devanagari-skrift: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Skanning av Apple VisionKit, tekstgjenkjenning av Apple Vision (på enheten). Devanagari-skrift: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Kunne ikke åpne $url';
  }

  @override
  String get scanBusinessCard => 'Skann et visittkort';

  @override
  String get saveAsContact => 'Lagre som kontakt';

  @override
  String get saveToContacts => 'Lagre i Kontakter';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Visittkort';

  @override
  String get contactHint =>
      'Sjekk feltene, og lagre deretter. Kontakter-appen på telefonen åpnes med alt fylt ut.';

  @override
  String get readingCard => 'Leser kortet…';

  @override
  String get nothingRecognised =>
      'Ingen tekst ble gjenkjent på dette kortet. Du kan likevel skrive inn opplysningene.';

  @override
  String get contactOpened =>
      'Kontakter er åpnet. Trykk på Lagre der for å beholde kontakten.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Kunne ikke åpne Kontakter: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kort $stamp';
  }

  @override
  String get fieldCompany => 'Firma';

  @override
  String get fieldJobTitle => 'Stilling';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Faks';

  @override
  String get fieldEmail => 'E-post';

  @override
  String get fieldWebsite => 'Nettsted';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'By';

  @override
  String get fieldCountry => 'Land';

  @override
  String get fieldNotes => 'Notater';

  @override
  String get drawFirst => 'Tegn signaturen din først.';

  @override
  String get clear => 'Tøm';

  @override
  String get undo => 'Angre';

  @override
  String get save => 'Lagre';

  @override
  String get signHint =>
      'Signer i feltet med fingeren. Snu telefonen på siden for å få mer plass.';

  @override
  String get thin => 'Tynn';

  @override
  String get medium => 'Middels';

  @override
  String get thick => 'Tykk';

  @override
  String couldNotReadPage(String error) {
    return 'Kunne ikke lese siden: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Kunne ikke signere: $error';
  }

  @override
  String get placeSignature => 'Plasser signatur';

  @override
  String get apply => 'Bruk';

  @override
  String get dragPinchHint => 'Dra for å flytte. Knip for å endre størrelse.';

  @override
  String get smaller => 'Mindre';

  @override
  String get larger => 'Større';
}
