// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scanați';

  @override
  String get cancel => 'Anulați';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Închideți';

  @override
  String get delete => 'Ștergeți';

  @override
  String get share => 'Partajați';

  @override
  String get copy => 'Copiați';

  @override
  String get copied => 'Copiat.';

  @override
  String get saved => 'Salvat.';

  @override
  String get name => 'Nume';

  @override
  String get rename => 'Redenumiți';

  @override
  String get settings => 'Setări';

  @override
  String get dismiss => 'Ignorați';

  @override
  String get tryAgain => 'Încercați din nou';

  @override
  String get cannotBeUndone => 'Această acțiune nu poate fi anulată.';

  @override
  String get savingPages => 'Se salvează paginile…';

  @override
  String get preparingScanner =>
      'Se pregătește scanerul…\nPrima utilizare: serviciile Google Play îl descarcă o singură dată.';

  @override
  String get scannerUnavailable => 'Scanerul nu este disponibil.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Scanerul nu este disponibil: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Nu s-au putut salva paginile: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Nu s-a putut deschide selectorul de fișiere: $error';
  }

  @override
  String get importingPdf => 'Se importă PDF…';

  @override
  String get importedPdf => 'PDF importat';

  @override
  String couldNotImport(String error) {
    return 'Nu s-a putut importa: $error';
  }

  @override
  String get pickTwoPdfs => 'Alegeți cel puțin două fișiere PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Se îmbină $count fișiere PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Îmbinat $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Nu s-a putut îmbina: $error';
  }

  @override
  String get saveToFolder => 'Salvați într-un dosar';

  @override
  String couldNotSave(String error) {
    return 'Nu s-a putut salva: $error';
  }

  @override
  String get mergedDocument => 'Document îmbinat';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + încă $count';
  }

  @override
  String get merging => 'Se îmbină…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ștergeți $count de documente?',
      few: 'Ștergeți $count documente?',
      one: 'Ștergeți 1 document?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Se creează PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Se creează PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Se creează PDF, pagina $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Nu s-a putut crea PDF-ul: $error';
  }

  @override
  String get searchDocuments => 'Căutați documente';

  @override
  String get closeSearch => 'Închideți căutarea';

  @override
  String get search => 'Căutați';

  @override
  String get importPdfAsPages => 'Importați PDF ca pagini';

  @override
  String get mergePdfFiles => 'Îmbinați fișiere PDF';

  @override
  String get clearSelection => 'Anulați selecția';

  @override
  String nSelected(int count) {
    return '$count selectate';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count selectate · se îmbină în această ordine';
  }

  @override
  String get mergeIntoOne => 'Îmbinați într-un singur document';

  @override
  String get shareAsPdf => 'Partajați ca PDF';

  @override
  String get selectAll => 'Selectați tot';

  @override
  String get noScansYet => 'Nicio scanare încă';

  @override
  String get nothingMatches => 'Niciun rezultat';

  @override
  String get emptyHint =>
      'Atingeți Scanați pentru a fotografia un document. Totul rămâne pe acest telefon.';

  @override
  String get tryAnotherWord => 'Încercați alt cuvânt.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '1 pagină',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Scanare $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO s-a închis în mod neașteptat';

  @override
  String get crashBody =>
      'Un raport despre eroare a fost salvat doar pe acest telefon. Partajarea lui cu dezvoltatorul ajută la remedierea problemei. Conține detalii tehnice, nu documentele dvs.';

  @override
  String get reportCopied => 'Raport copiat.';

  @override
  String get crashReportSubject => 'Raport de eroare BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF salvat.';

  @override
  String couldNotSavePdf(String error) {
    return 'Nu s-a putut salva PDF-ul: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportați paginile ca imagini';

  @override
  String get saveToPhotos => 'Salvați în Poze';

  @override
  String get savingToPhotos => 'Se salvează în Poze…';

  @override
  String get photosNeedsAndroid10 =>
      'Salvarea în Poze necesită Android 10 sau o versiune mai nouă. Folosiți în schimb Partajați.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO nu are permisiunea de a adăuga în Poze. Permiteți acest lucru din Setări sau folosiți Partajați.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de imagini salvate în Poze.',
      few: '$count imagini salvate în Poze.',
      one: '1 imagine salvată în Poze.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Nu s-a putut exporta: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Ștergeți acest document?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Se vor șterge $count de pagini. Această acțiune nu poate fi anulată.',
      few: 'Se vor șterge $count pagini. Această acțiune nu poate fi anulată.',
      one: 'Se va șterge 1 pagină. Această acțiune nu poate fi anulată.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Text (OCR)';

  @override
  String get sharePdf => 'Partajați PDF';

  @override
  String get savePdfToFolder => 'Salvați PDF într-un dosar';

  @override
  String get exportAsImages => 'Exportați ca JPEG / PNG';

  @override
  String get deleteDocument => 'Ștergeți documentul';

  @override
  String get noPages => 'Nicio pagină. Atingeți Adăugați pagini.';

  @override
  String get addPages => 'Adăugați pagini';

  @override
  String get holdToReorder => 'țineți apăsat pe o pagină pentru a reordona';

  @override
  String get savePdfDialogTitle => 'Salvați PDF';

  @override
  String get saveDialogTitle => 'Salvați';

  @override
  String couldNotRotate(String error) {
    return 'Nu s-a putut roti: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Nu s-a putut partaja: $error';
  }

  @override
  String get noTextOnPage => 'Nu s-a găsit text pe această pagină.';

  @override
  String pageNText(int n) {
    return 'Textul paginii $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Ștergeți pagina $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Pagina $n din $total';
  }

  @override
  String get rotateLeft => 'Rotiți la stânga';

  @override
  String get rotateRight => 'Rotiți la dreapta';

  @override
  String get sign => 'Semnați';

  @override
  String get copyText => 'Copiați textul';

  @override
  String get shareImage => 'Partajați imaginea';

  @override
  String get deletePage => 'Ștergeți pagina';

  @override
  String get signed => 'Semnat.';

  @override
  String signPageN(int n) {
    return 'Semnați pagina $n';
  }

  @override
  String get deleteThisSignature => 'Ștergeți această semnătură';

  @override
  String get newSignature => 'Semnătură nouă';

  @override
  String readingPage(int n, int total) {
    return 'Se citește pagina $n / $total';
  }

  @override
  String get ocrFailed => 'Recunoașterea textului a eșuat.';

  @override
  String ocrFailedWith(String error) {
    return 'Recunoașterea textului a eșuat: $error';
  }

  @override
  String get textSaved => 'Text salvat.';

  @override
  String get text => 'Text';

  @override
  String get copyAll => 'Copiați tot';

  @override
  String get shareText => 'Partajați textul';

  @override
  String get saveAsTxt => 'Salvați ca .txt';

  @override
  String get readAgain => 'Citiți din nou';

  @override
  String get readAsLatin => 'Citiți ca engleză / latină';

  @override
  String get readAsDevanagari => 'Citiți ca hindi / nepaleză';

  @override
  String get ocrModelHint =>
      'Pe Android, modelul de text este descărcat o singură dată de serviciile Google Play. Dacă este prima utilizare, așteptați un minut și încercați din nou.';

  @override
  String get noTextFound => 'Nu s-a găsit text.';

  @override
  String pageSeparator(int n) {
    return '--- Pagina $n ---';
  }

  @override
  String get scanner => 'Scaner';

  @override
  String get scanMode => 'Mod de scanare';

  @override
  String get modeFull => 'Complet: filtre + curățarea petelor și a degetelor';

  @override
  String get modeFilter => 'Doar filtre';

  @override
  String get modeBase => 'De bază: doar decupare și rotire';

  @override
  String get allowGallery => 'Permiteți importul din galerie';

  @override
  String get allowGalleryHint => 'Afișează un buton de galerie în scaner';

  @override
  String get pagesPerScan => 'Pagini per scanare';

  @override
  String get iosScannerNote =>
      'Pe iPhone, scanerul este camera pentru documente proprie Apple.';

  @override
  String get iosScannerNote2 =>
      'Captura automată, detectarea marginilor și modurile de culoare sunt integrate.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Dimensiunea paginii';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Aceeași formă ca scanarea';

  @override
  String get searchablePdf => 'PDF cu căutare';

  @override
  String get searchablePdfHint =>
      'Adaugă un strat de text invizibil pentru a putea căuta în PDF și copia textul';

  @override
  String get textRecognition => 'Recunoașterea textului';

  @override
  String get quality => 'Calitate';

  @override
  String get qualityBest =>
      'Cea mai bună: rezoluție completă, citește și scrisul mărunt';

  @override
  String get qualityFast => 'Rapidă: copie redusă a paginii';

  @override
  String get language => 'Limbă';

  @override
  String get scriptLatin => 'Engleză și alte limbi cu alfabet latin';

  @override
  String get scriptDevanagari => 'Hindi, nepaleză, marathi (+ latină)';

  @override
  String get scriptChinese => 'Chineză (+ latină)';

  @override
  String get scriptJapanese => 'Japoneză (+ latină)';

  @override
  String get scriptKorean => 'Coreeană (+ latină)';

  @override
  String get readAsChinese => 'Citiți ca chineză';

  @override
  String get readAsJapanese => 'Citiți ca japoneză';

  @override
  String get readAsKorean => 'Citiți ca coreeană';

  @override
  String get languageAuto => 'Limba este detectată automat.';

  @override
  String get appearance => 'Aspect';

  @override
  String get theme => 'Temă';

  @override
  String get themeSystem => 'Ca telefonul';

  @override
  String get themeLight => 'Luminoasă';

  @override
  String get themeDark => 'Întunecată';

  @override
  String get about => 'Despre';

  @override
  String get aboutPromise => 'Fără reclame. Fără cont. Fără urmărire.';

  @override
  String get aboutPromiseBody =>
      'Scanările rămân pe acest telefon, cu excepția cazului în care le partajați sau le exportați. Dezinstalarea aplicației le șterge, așa că exportați ce doriți să păstrați.';

  @override
  String get openSource => 'Sursă deschisă (Apache-2.0)';

  @override
  String get privacyPolicy => 'Politica de confidențialitate';

  @override
  String get opensInBrowser => 'Se deschide în browserul dvs.';

  @override
  String get aboutTechAndroid =>
      'Scanare și recunoașterea textului cu Google ML Kit (pe dispozitiv). Îmbinare PDF cu PDFBox-Android. Font devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scanare cu Apple VisionKit, recunoașterea textului cu Apple Vision (pe dispozitiv). Font devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Nu s-a putut deschide $url';
  }

  @override
  String get scanBusinessCard => 'Scan a business card';

  @override
  String get saveAsContact => 'Save as contact';

  @override
  String get saveToContacts => 'Save to Contacts';

  @override
  String get contactReviewTitle => 'Business card';

  @override
  String get contactHint =>
      'Check the fields, then save. Your phone\'s Contacts app opens with everything filled in.';

  @override
  String get readingCard => 'Reading the card…';

  @override
  String get nothingRecognised =>
      'No text was recognised on this card. You can still type the details.';

  @override
  String get contactOpened => 'Contacts opened. Tap Save there to keep it.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Could not open Contacts: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Card $stamp';
  }

  @override
  String get fieldCompany => 'Company';

  @override
  String get fieldJobTitle => 'Job title';

  @override
  String get fieldMobile => 'Mobile';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Address';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get drawFirst => 'Desenați mai întâi semnătura.';

  @override
  String get clear => 'Ștergeți tot';

  @override
  String get undo => 'Anulați';

  @override
  String get save => 'Salvați';

  @override
  String get signHint =>
      'Semnați în casetă cu degetul. Întoarceți telefonul pe orizontală pentru mai mult spațiu.';

  @override
  String get thin => 'Subțire';

  @override
  String get medium => 'Mediu';

  @override
  String get thick => 'Gros';

  @override
  String couldNotReadPage(String error) {
    return 'Nu s-a putut citi pagina: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Nu s-a putut semna: $error';
  }

  @override
  String get placeSignature => 'Plasați semnătura';

  @override
  String get apply => 'Aplicați';

  @override
  String get dragPinchHint =>
      'Trageți pentru a muta. Ciupiți pentru a redimensiona.';

  @override
  String get smaller => 'Mai mică';

  @override
  String get larger => 'Mai mare';
}
