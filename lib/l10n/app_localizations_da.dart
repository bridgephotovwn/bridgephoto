// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scan';

  @override
  String get cancel => 'Annuller';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Luk';

  @override
  String get delete => 'Slet';

  @override
  String get share => 'Del';

  @override
  String get copy => 'Kopiér';

  @override
  String get copied => 'Kopieret.';

  @override
  String get saved => 'Gemt.';

  @override
  String get name => 'Navn';

  @override
  String get rename => 'Omdøb';

  @override
  String get settings => 'Indstillinger';

  @override
  String get dismiss => 'Afvis';

  @override
  String get tryAgain => 'Prøv igen';

  @override
  String get cannotBeUndone => 'Dette kan ikke fortrydes.';

  @override
  String get savingPages => 'Gemmer sider…';

  @override
  String get preparingScanner =>
      'Forbereder scanneren…\nFørste gang: Google Play-tjenester downloader den én gang.';

  @override
  String get scannerUnavailable => 'Scanneren er ikke tilgængelig.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Scanneren er ikke tilgængelig: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Siderne kunne ikke gemmes: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Filvælgeren kunne ikke åbnes: $error';
  }

  @override
  String get importingPdf => 'Importerer PDF…';

  @override
  String get importedPdf => 'Importeret PDF';

  @override
  String couldNotImport(String error) {
    return 'Kunne ikke importere: $error';
  }

  @override
  String get pickTwoPdfs => 'Vælg mindst to PDF-filer.';

  @override
  String mergingPdfs(int count) {
    return 'Fletter $count PDF-filer…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Flettet $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Kunne ikke flette: $error';
  }

  @override
  String get saveToFolder => 'Gem i en mappe';

  @override
  String couldNotSave(String error) {
    return 'Kunne ikke gemme: $error';
  }

  @override
  String get mergedDocument => 'Flettet dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count mere';
  }

  @override
  String get merging => 'Fletter…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slet $count dokumenter?',
      one: 'Slet 1 dokument?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Opretter PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Opretter PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Opretter PDF, side $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF-filen kunne ikke oprettes: $error';
  }

  @override
  String get searchDocuments => 'Søg i dokumenter';

  @override
  String get closeSearch => 'Luk søgning';

  @override
  String get search => 'Søg';

  @override
  String get importPdfAsPages => 'Importér PDF som sider';

  @override
  String get mergePdfFiles => 'Flet PDF-filer';

  @override
  String get clearSelection => 'Ryd markering';

  @override
  String nSelected(int count) {
    return '$count valgt';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count valgt · flettes i denne rækkefølge';
  }

  @override
  String get mergeIntoOne => 'Flet til ét dokument';

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
  String get shareAsPdf => 'Del som PDF';

  @override
  String get selectAll => 'Vælg alle';

  @override
  String get noScansYet => 'Ingen scanninger endnu';

  @override
  String get nothingMatches => 'Ingen resultater';

  @override
  String get emptyHint =>
      'Tryk på Scan for at fotografere et dokument. Alt bliver på denne telefon.';

  @override
  String get tryAnotherWord => 'Prøv et andet ord.';

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
    return 'Scanning $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO lukkede uventet';

  @override
  String get crashBody =>
      'En rapport om, hvad der gik galt, er kun gemt på denne telefon. Deler du den med udvikleren, hjælper det med at løse problemet. Den indeholder tekniske detaljer, ikke dine dokumenter.';

  @override
  String get reportCopied => 'Rapport kopieret.';

  @override
  String get crashReportSubject => 'Nedbrudsrapport fra BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF gemt.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF-filen kunne ikke gemmes: $error';
  }

  @override
  String get exportPagesAsImages => 'Eksportér sider som billeder';

  @override
  String get saveToPhotos => 'Gem i Fotos';

  @override
  String get savingToPhotos => 'Gemmer i Fotos…';

  @override
  String get photosNeedsAndroid10 =>
      'At gemme i Fotos kræver Android 10 eller nyere. Brug Del i stedet.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO må ikke tilføje til Fotos. Tillad det under Indstillinger, eller brug Del.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder gemt i Fotos.',
      one: '1 billede gemt i Fotos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Kunne ikke eksportere: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Slet dette dokument?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider slettes. Dette kan ikke fortrydes.',
      one: '1 side slettes. Dette kan ikke fortrydes.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Tekst (OCR)';

  @override
  String get sharePdf => 'Del PDF';

  @override
  String get savePdfToFolder => 'Gem PDF i en mappe';

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
  String get exportAsImages => 'Eksportér som JPEG / PNG';

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
  String get deleteDocument => 'Slet dokument';

  @override
  String get noPages => 'Ingen sider. Tryk på Tilføj sider.';

  @override
  String get addPages => 'Tilføj sider';

  @override
  String get holdToReorder => 'hold på en side for at ændre rækkefølgen';

  @override
  String get savePdfDialogTitle => 'Gem PDF';

  @override
  String get saveDialogTitle => 'Gem';

  @override
  String couldNotRotate(String error) {
    return 'Kunne ikke rotere: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Kunne ikke dele: $error';
  }

  @override
  String get noTextOnPage => 'Der blev ikke fundet tekst på denne side.';

  @override
  String pageNText(int n) {
    return 'Tekst på side $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Slet side $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Side $n af $total';
  }

  @override
  String get rotateLeft => 'Rotér til venstre';

  @override
  String get rotateRight => 'Rotér til højre';

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
  String get undo => 'Fortryd';

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
  String get sign => 'Underskriv';

  @override
  String get copyText => 'Kopiér tekst';

  @override
  String get shareImage => 'Del billede';

  @override
  String get deletePage => 'Slet side';

  @override
  String get signed => 'Underskrevet.';

  @override
  String signPageN(int n) {
    return 'Underskriv side $n';
  }

  @override
  String get deleteThisSignature => 'Slet denne underskrift';

  @override
  String get newSignature => 'Ny underskrift';

  @override
  String readingPage(int n, int total) {
    return 'Læser side $n / $total';
  }

  @override
  String get ocrFailed => 'Tekstgenkendelse mislykkedes.';

  @override
  String ocrFailedWith(String error) {
    return 'Tekstgenkendelse mislykkedes: $error';
  }

  @override
  String get textSaved => 'Tekst gemt.';

  @override
  String get text => 'Tekst';

  @override
  String get copyAll => 'Kopiér alt';

  @override
  String get shareText => 'Del tekst';

  @override
  String get saveAsTxt => 'Gem som .txt';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Læs igen';

  @override
  String get readAsLatin => 'Læs som engelsk / latinsk skrift';

  @override
  String get readAsDevanagari => 'Læs som hindi / nepalesisk';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'På Android downloades tekstmodellen én gang af Google Play-tjenester. Hvis det er første gang, så vent et minut, og prøv igen.';

  @override
  String get noTextFound => 'Der blev ikke fundet tekst.';

  @override
  String pageSeparator(int n) {
    return '--- Side $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Scanningstilstand';

  @override
  String get modeFull => 'Fuld: filtre + fjerner pletter og fingre';

  @override
  String get modeFilter => 'Kun filtre';

  @override
  String get modeBase => 'Basis: kun beskæring og rotation';

  @override
  String get allowGallery => 'Tillad import fra galleri';

  @override
  String get allowGalleryHint => 'Viser en galleriknap i scanneren';

  @override
  String get pagesPerScan => 'Sider pr. scanning';

  @override
  String get iosScannerNote =>
      'På iPhone er scanneren Apples eget dokumentkamera.';

  @override
  String get iosScannerNote2 =>
      'Automatisk optagelse, kantregistrering og farvetilstande er indbygget.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Sidestørrelse';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Samme form som scanningen';

  @override
  String get searchablePdf => 'Søgbar PDF';

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
      'Tilføjer et usynligt tekstlag, så der kan søges i PDF-filen og kopieres tekst';

  @override
  String get textRecognition => 'Tekstgenkendelse';

  @override
  String get quality => 'Kvalitet';

  @override
  String get qualityBest => 'Bedst: fuld opløsning, læser små bogstaver';

  @override
  String get qualityFast => 'Hurtig: formindsket kopi af siden';

  @override
  String get language => 'Sprog';

  @override
  String get scriptLatin => 'Engelsk og andre sprog med latinsk skrift';

  @override
  String get scriptDevanagari => 'Hindi, nepalesisk, marathi (+ latinsk)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Kinesisk (+ latinsk)';

  @override
  String get scriptJapanese => 'Japansk (+ latinsk)';

  @override
  String get scriptKorean => 'Koreansk (+ latinsk)';

  @override
  String get readAsChinese => 'Læs som kinesisk';

  @override
  String get readAsJapanese => 'Læs som japansk';

  @override
  String get readAsKorean => 'Læs som koreansk';

  @override
  String get languageAuto => 'Sproget registreres automatisk.';

  @override
  String get appearance => 'Udseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Følg telefonen';

  @override
  String get themeLight => 'Lys';

  @override
  String get themeDark => 'Mørk';

  @override
  String get about => 'Om';

  @override
  String get aboutPromise => 'Ingen reklamer. Ingen konto. Ingen sporing.';

  @override
  String get aboutPromiseBody =>
      'Scanninger bliver på denne telefon, medmindre du deler eller eksporterer dem. Afinstalleres appen, slettes de, så eksportér det, du vil beholde.';

  @override
  String get openSource => 'Åben kildekode (Apache-2.0)';

  @override
  String get privacyPolicy => 'Privatlivspolitik';

  @override
  String get opensInBrowser => 'Åbnes i din browser';

  @override
  String get aboutTechAndroid =>
      'Scanning og tekstgenkendelse af Google ML Kit (på enheden). PDF-fletning af PDFBox-Android. Devanagari-skrifttype: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scanning af Apple VisionKit, tekstgenkendelse af Apple Vision (på enheden). Devanagari-skrifttype: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Kunne ikke åbne $url';
  }

  @override
  String get scanBusinessCard => 'Scan et visitkort';

  @override
  String get saveAsContact => 'Gem som kontakt';

  @override
  String get saveToContacts => 'Gem i Kontakter';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Visitkort';

  @override
  String get contactHint =>
      'Tjek felterne, og gem derefter. Telefonens app Kontakter åbner med alt udfyldt.';

  @override
  String get readingCard => 'Læser kortet…';

  @override
  String get nothingRecognised =>
      'Der blev ikke genkendt nogen tekst på dette kort. Du kan stadig indtaste oplysningerne.';

  @override
  String get contactOpened =>
      'Kontakter er åbnet. Tryk på Gem dér for at beholde kontakten.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Kunne ikke åbne Kontakter: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kort $stamp';
  }

  @override
  String get fieldCompany => 'Virksomhed';

  @override
  String get fieldJobTitle => 'Stilling';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Websted';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'By';

  @override
  String get fieldCountry => 'Land';

  @override
  String get fieldNotes => 'Noter';

  @override
  String get drawFirst => 'Tegn din underskrift først.';

  @override
  String get clear => 'Ryd';

  @override
  String get save => 'Gem';

  @override
  String get signHint =>
      'Skriv under i feltet med fingeren. Vend telefonen på siden for at få mere plads.';

  @override
  String get thin => 'Tynd';

  @override
  String get medium => 'Mellem';

  @override
  String get thick => 'Tyk';

  @override
  String couldNotReadPage(String error) {
    return 'Siden kunne ikke læses: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Kunne ikke underskrive: $error';
  }

  @override
  String get placeSignature => 'Placer underskrift';

  @override
  String get apply => 'Anvend';

  @override
  String get dragPinchHint =>
      'Træk for at flytte. Knib for at ændre størrelse.';

  @override
  String get smaller => 'Mindre';

  @override
  String get larger => 'Større';
}
