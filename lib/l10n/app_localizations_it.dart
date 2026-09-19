// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scansiona';

  @override
  String get cancel => 'Annulla';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Chiudi';

  @override
  String get delete => 'Elimina';

  @override
  String get share => 'Condividi';

  @override
  String get copy => 'Copia';

  @override
  String get copied => 'Copiato.';

  @override
  String get saved => 'Salvato.';

  @override
  String get name => 'Nome';

  @override
  String get rename => 'Rinomina';

  @override
  String get settings => 'Impostazioni';

  @override
  String get dismiss => 'Ignora';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get cannotBeUndone => 'Questa operazione non può essere annullata.';

  @override
  String get savingPages => 'Salvataggio delle pagine…';

  @override
  String get preparingScanner =>
      'Preparazione dello scanner…\nPrimo utilizzo: i servizi Google Play lo scaricano una sola volta.';

  @override
  String get scannerUnavailable => 'Lo scanner non è disponibile.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Lo scanner non è disponibile: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Impossibile salvare le pagine: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Impossibile aprire il selettore di file: $error';
  }

  @override
  String get importingPdf => 'Importazione del PDF…';

  @override
  String get importedPdf => 'PDF importato';

  @override
  String couldNotImport(String error) {
    return 'Impossibile importare: $error';
  }

  @override
  String get pickTwoPdfs => 'Scegli almeno due file PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Unione di $count file PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Unione $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Impossibile unire: $error';
  }

  @override
  String get saveToFolder => 'Salva in una cartella';

  @override
  String couldNotSave(String error) {
    return 'Impossibile salvare: $error';
  }

  @override
  String get mergedDocument => 'Documento unito';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + altri $count';
  }

  @override
  String get merging => 'Unione in corso…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminare $count documenti?',
      one: 'Eliminare 1 documento?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Creazione del PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Creazione del PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Creazione del PDF, pagina $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Impossibile creare il PDF: $error';
  }

  @override
  String get searchDocuments => 'Cerca documenti';

  @override
  String get closeSearch => 'Chiudi la ricerca';

  @override
  String get search => 'Cerca';

  @override
  String get importPdfAsPages => 'Importa PDF come pagine';

  @override
  String get mergePdfFiles => 'Unisci file PDF';

  @override
  String get clearSelection => 'Annulla selezione';

  @override
  String nSelected(int count) {
    return '$count selezionati';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count selezionati · unione in questo ordine';
  }

  @override
  String get mergeIntoOne => 'Unisci in un unico documento';

  @override
  String get shareAsPdf => 'Condividi come PDF';

  @override
  String get selectAll => 'Seleziona tutto';

  @override
  String get noScansYet => 'Ancora nessuna scansione';

  @override
  String get nothingMatches => 'Nessun risultato';

  @override
  String get emptyHint =>
      'Tocca Scansiona per fotografare un documento. Tutto resta su questo telefono.';

  @override
  String get tryAnotherWord => 'Prova con un\'altra parola.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
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
    return 'Scansione $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO si è chiuso in modo imprevisto';

  @override
  String get crashBody =>
      'Un rapporto sull\'errore è stato salvato solo su questo telefono. Condividerlo con lo sviluppatore aiuta a risolvere il problema. Contiene dettagli tecnici, non i tuoi documenti.';

  @override
  String get reportCopied => 'Rapporto copiato.';

  @override
  String get crashReportSubject =>
      'Rapporto di arresto anomalo di BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF salvato.';

  @override
  String couldNotSavePdf(String error) {
    return 'Impossibile salvare il PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Esporta pagine come immagini';

  @override
  String get saveToPhotos => 'Salva in Foto';

  @override
  String get savingToPhotos => 'Salvataggio in Foto…';

  @override
  String get photosNeedsAndroid10 =>
      'Per salvare in Foto è necessario Android 10 o versioni successive. In alternativa usa Condividi.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO non è autorizzato ad aggiungere elementi a Foto. Consentilo nelle Impostazioni oppure usa Condividi.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count immagini salvate in Foto.',
      one: '1 immagine salvata in Foto.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Impossibile esportare: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Eliminare questo documento?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Verranno eliminate $count pagine. Questa operazione non può essere annullata.',
      one:
          'Verrà eliminata 1 pagina. Questa operazione non può essere annullata.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Testo (OCR)';

  @override
  String get sharePdf => 'Condividi PDF';

  @override
  String get savePdfToFolder => 'Salva PDF in una cartella';

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
  String get exportAsImages => 'Esporta come JPEG / PNG';

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
  String get deleteDocument => 'Elimina documento';

  @override
  String get noPages => 'Nessuna pagina. Tocca Aggiungi pagine.';

  @override
  String get addPages => 'Aggiungi pagine';

  @override
  String get holdToReorder => 'tieni premuta una pagina per riordinare';

  @override
  String get savePdfDialogTitle => 'Salva PDF';

  @override
  String get saveDialogTitle => 'Salva';

  @override
  String couldNotRotate(String error) {
    return 'Impossibile ruotare: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Impossibile condividere: $error';
  }

  @override
  String get noTextOnPage => 'Nessun testo trovato in questa pagina.';

  @override
  String pageNText(int n) {
    return 'Testo della pagina $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Eliminare la pagina $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Pagina $n di $total';
  }

  @override
  String get rotateLeft => 'Ruota a sinistra';

  @override
  String get rotateRight => 'Ruota a destra';

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
  String get undo => 'Annulla';

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
  String get sign => 'Firma';

  @override
  String get copyText => 'Copia testo';

  @override
  String get shareImage => 'Condividi immagine';

  @override
  String get deletePage => 'Elimina pagina';

  @override
  String get signed => 'Firmato.';

  @override
  String signPageN(int n) {
    return 'Firma la pagina $n';
  }

  @override
  String get deleteThisSignature => 'Elimina questa firma';

  @override
  String get newSignature => 'Nuova firma';

  @override
  String readingPage(int n, int total) {
    return 'Lettura della pagina $n / $total';
  }

  @override
  String get ocrFailed => 'Riconoscimento del testo non riuscito.';

  @override
  String ocrFailedWith(String error) {
    return 'Riconoscimento del testo non riuscito: $error';
  }

  @override
  String get textSaved => 'Testo salvato.';

  @override
  String get text => 'Testo';

  @override
  String get copyAll => 'Copia tutto';

  @override
  String get shareText => 'Condividi testo';

  @override
  String get saveAsTxt => 'Salva come .txt';

  @override
  String get readAgain => 'Leggi di nuovo';

  @override
  String get readAsLatin => 'Leggi come inglese / latino';

  @override
  String get readAsDevanagari => 'Leggi come hindi / nepalese';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Su Android il modello di testo viene scaricato una sola volta dai servizi Google Play. Se è il primo utilizzo, attendi un minuto e riprova.';

  @override
  String get noTextFound => 'Nessun testo trovato.';

  @override
  String pageSeparator(int n) {
    return '--- Pagina $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Modalità di scansione';

  @override
  String get modeFull => 'Completa: filtri + rimozione di macchie e dita';

  @override
  String get modeFilter => 'Solo filtri';

  @override
  String get modeBase => 'Base: solo ritaglio e rotazione';

  @override
  String get allowGallery => 'Consenti importazione dalla galleria';

  @override
  String get allowGalleryHint => 'Mostra un pulsante Galleria nello scanner';

  @override
  String get pagesPerScan => 'Pagine per scansione';

  @override
  String get iosScannerNote =>
      'Su iPhone lo scanner è la fotocamera per documenti di Apple.';

  @override
  String get iosScannerNote2 =>
      'Acquisizione automatica, rilevamento dei bordi e modalità colore sono integrati.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Formato pagina';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Stessa forma della scansione';

  @override
  String get searchablePdf => 'PDF ricercabile';

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
      'Aggiunge un livello di testo invisibile per cercare nel PDF e copiare il testo';

  @override
  String get textRecognition => 'Riconoscimento del testo';

  @override
  String get quality => 'Qualità';

  @override
  String get qualityBest =>
      'Massima: risoluzione piena, legge i caratteri piccoli';

  @override
  String get qualityFast => 'Veloce: copia ridotta della pagina';

  @override
  String get language => 'Lingua';

  @override
  String get scriptLatin => 'Inglese e altre lingue con alfabeto latino';

  @override
  String get scriptDevanagari => 'Hindi, nepalese, marathi (+ latino)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Cinese (+ latino)';

  @override
  String get scriptJapanese => 'Giapponese (+ latino)';

  @override
  String get scriptKorean => 'Coreano (+ latino)';

  @override
  String get readAsChinese => 'Leggi come cinese';

  @override
  String get readAsJapanese => 'Leggi come giapponese';

  @override
  String get readAsKorean => 'Leggi come coreano';

  @override
  String get languageAuto => 'La lingua viene rilevata automaticamente.';

  @override
  String get appearance => 'Aspetto';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Come il telefono';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get about => 'Informazioni';

  @override
  String get aboutPromise =>
      'Niente pubblicità. Nessun account. Nessun tracciamento.';

  @override
  String get aboutPromiseBody =>
      'Le scansioni restano su questo telefono, a meno che tu non le condivida o le esporti. Disinstallando l\'app vengono eliminate: esporta ciò che vuoi conservare.';

  @override
  String get openSource => 'Codice open source (Apache-2.0)';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get opensInBrowser => 'Si apre nel browser';

  @override
  String get aboutTechAndroid =>
      'Scansione e riconoscimento del testo con Google ML Kit (sul dispositivo). Unione dei PDF con PDFBox-Android. Font devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scansione con Apple VisionKit, riconoscimento del testo con Apple Vision (sul dispositivo). Font devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Impossibile aprire $url';
  }

  @override
  String get scanBusinessCard => 'Scansiona un biglietto da visita';

  @override
  String get saveAsContact => 'Salva come contatto';

  @override
  String get saveToContacts => 'Salva in Contatti';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Biglietto da visita';

  @override
  String get contactHint =>
      'Controlla i campi, poi salva. L\'app Contatti del telefono si apre con tutti i dati già inseriti.';

  @override
  String get readingCard => 'Lettura del biglietto…';

  @override
  String get nothingRecognised =>
      'Nessun testo riconosciuto su questo biglietto. Puoi comunque digitare i dati.';

  @override
  String get contactOpened =>
      'Contatti è stato aperto. Tocca Salva lì per conservare il contatto.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Impossibile aprire Contatti: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Biglietto $stamp';
  }

  @override
  String get fieldCompany => 'Azienda';

  @override
  String get fieldJobTitle => 'Qualifica';

  @override
  String get fieldMobile => 'Cellulare';

  @override
  String get fieldPhone => 'Telefono';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Sito web';

  @override
  String get fieldAddress => 'Indirizzo';

  @override
  String get fieldCity => 'Città';

  @override
  String get fieldCountry => 'Paese';

  @override
  String get fieldNotes => 'Note';

  @override
  String get drawFirst => 'Disegna prima la tua firma.';

  @override
  String get clear => 'Cancella';

  @override
  String get save => 'Salva';

  @override
  String get signHint =>
      'Firma nel riquadro con il dito. Ruota il telefono in orizzontale per avere più spazio.';

  @override
  String get thin => 'Sottile';

  @override
  String get medium => 'Medio';

  @override
  String get thick => 'Spesso';

  @override
  String couldNotReadPage(String error) {
    return 'Impossibile leggere la pagina: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Impossibile firmare: $error';
  }

  @override
  String get placeSignature => 'Posiziona firma';

  @override
  String get apply => 'Applica';

  @override
  String get dragPinchHint =>
      'Trascina per spostare. Pizzica per ridimensionare.';

  @override
  String get smaller => 'Più piccola';

  @override
  String get larger => 'Più grande';
}
