// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Σάρωση';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get share => 'Κοινοποίηση';

  @override
  String get copy => 'Αντιγραφή';

  @override
  String get copied => 'Αντιγράφηκε.';

  @override
  String get saved => 'Αποθηκεύτηκε.';

  @override
  String get name => 'Όνομα';

  @override
  String get rename => 'Μετονομασία';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get dismiss => 'Παράβλεψη';

  @override
  String get tryAgain => 'Δοκιμάστε ξανά';

  @override
  String get cannotBeUndone => 'Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get savingPages => 'Αποθήκευση σελίδων…';

  @override
  String get preparingScanner =>
      'Προετοιμασία του σαρωτή…\nΠρώτη χρήση: οι υπηρεσίες Google Play τον κατεβάζουν μία φορά.';

  @override
  String get scannerUnavailable => 'Ο σαρωτής δεν είναι διαθέσιμος.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Ο σαρωτής δεν είναι διαθέσιμος: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Δεν ήταν δυνατή η αποθήκευση των σελίδων: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Δεν ήταν δυνατό το άνοιγμα του επιλογέα αρχείων: $error';
  }

  @override
  String get importingPdf => 'Εισαγωγή PDF…';

  @override
  String get importedPdf => 'Εισαγόμενο PDF';

  @override
  String couldNotImport(String error) {
    return 'Δεν ήταν δυνατή η εισαγωγή: $error';
  }

  @override
  String get pickTwoPdfs => 'Επιλέξτε τουλάχιστον δύο αρχεία PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Συγχώνευση $count αρχείων PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Συγχώνευση $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Δεν ήταν δυνατή η συγχώνευση: $error';
  }

  @override
  String get saveToFolder => 'Αποθήκευση σε φάκελο';

  @override
  String couldNotSave(String error) {
    return 'Δεν ήταν δυνατή η αποθήκευση: $error';
  }

  @override
  String get mergedDocument => 'Συγχωνευμένο έγγραφο';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count ακόμη';
  }

  @override
  String get merging => 'Συγχώνευση…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγραφή $count εγγράφων;',
      one: 'Διαγραφή 1 εγγράφου;',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Δημιουργία PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Δημιουργία PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Δημιουργία PDF, σελίδα $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Δεν ήταν δυνατή η δημιουργία του PDF: $error';
  }

  @override
  String get searchDocuments => 'Αναζήτηση εγγράφων';

  @override
  String get closeSearch => 'Κλείσιμο αναζήτησης';

  @override
  String get search => 'Αναζήτηση';

  @override
  String get importPdfAsPages => 'Εισαγωγή PDF ως σελίδες';

  @override
  String get mergePdfFiles => 'Συγχώνευση αρχείων PDF';

  @override
  String get clearSelection => 'Καθαρισμός επιλογής';

  @override
  String nSelected(int count) {
    return '$count επιλεγμένα';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count επιλεγμένα · συγχώνευση με αυτή τη σειρά';
  }

  @override
  String get mergeIntoOne => 'Συγχώνευση σε ένα έγγραφο';

  @override
  String get shareAsPdf => 'Κοινοποίηση ως PDF';

  @override
  String get selectAll => 'Επιλογή όλων';

  @override
  String get noScansYet => 'Δεν υπάρχουν σαρώσεις ακόμη';

  @override
  String get nothingMatches => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get emptyHint =>
      'Πατήστε Σάρωση για να φωτογραφίσετε ένα έγγραφο. Όλα παραμένουν σε αυτό το τηλέφωνο.';

  @override
  String get tryAnotherWord => 'Δοκιμάστε άλλη λέξη.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '1 σελίδα',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Σάρωση $stamp';
  }

  @override
  String get crashTitle => 'Το BRIDGE PHOTO έκλεισε απροσδόκητα';

  @override
  String get crashBody =>
      'Μια αναφορά για το σφάλμα αποθηκεύτηκε μόνο σε αυτό το τηλέφωνο. Η κοινοποίησή της στον προγραμματιστή βοηθά στη διόρθωση του προβλήματος. Περιέχει τεχνικές λεπτομέρειες, όχι τα έγγραφά σας.';

  @override
  String get reportCopied => 'Η αναφορά αντιγράφηκε.';

  @override
  String get crashReportSubject => 'Αναφορά σφάλματος BRIDGE PHOTO';

  @override
  String get pdfSaved => 'Το PDF αποθηκεύτηκε.';

  @override
  String couldNotSavePdf(String error) {
    return 'Δεν ήταν δυνατή η αποθήκευση του PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Εξαγωγή σελίδων ως εικόνες';

  @override
  String get saveToPhotos => 'Αποθήκευση στις Φωτογραφίες';

  @override
  String get savingToPhotos => 'Αποθήκευση στις Φωτογραφίες…';

  @override
  String get photosNeedsAndroid10 =>
      'Η αποθήκευση στις Φωτογραφίες απαιτεί Android 10 ή νεότερο. Χρησιμοποιήστε την Κοινοποίηση αντ\' αυτού.';

  @override
  String get photosNotAllowed =>
      'Το BRIDGE PHOTO δεν έχει άδεια προσθήκης στις Φωτογραφίες. Επιτρέψτε το στις Ρυθμίσεις ή χρησιμοποιήστε την Κοινοποίηση.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εικόνες αποθηκεύτηκαν στις Φωτογραφίες.',
      one: '1 εικόνα αποθηκεύτηκε στις Φωτογραφίες.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Δεν ήταν δυνατή η εξαγωγή: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Διαγραφή αυτού του εγγράφου;';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Θα διαγραφούν $count σελίδες. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.',
      one: 'Θα διαγραφεί 1 σελίδα. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Κείμενο (OCR)';

  @override
  String get sharePdf => 'Κοινοποίηση PDF';

  @override
  String get savePdfToFolder => 'Αποθήκευση PDF σε φάκελο';

  @override
  String get exportAsImages => 'Εξαγωγή ως JPEG / PNG';

  @override
  String get deleteDocument => 'Διαγραφή εγγράφου';

  @override
  String get noPages => 'Δεν υπάρχουν σελίδες. Πατήστε Προσθήκη σελίδων.';

  @override
  String get addPages => 'Προσθήκη σελίδων';

  @override
  String get holdToReorder => 'κρατήστε πατημένη μια σελίδα για αλλαγή σειράς';

  @override
  String get savePdfDialogTitle => 'Αποθήκευση PDF';

  @override
  String get saveDialogTitle => 'Αποθήκευση';

  @override
  String couldNotRotate(String error) {
    return 'Δεν ήταν δυνατή η περιστροφή: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Δεν ήταν δυνατή η κοινοποίηση: $error';
  }

  @override
  String get noTextOnPage => 'Δεν βρέθηκε κείμενο σε αυτή τη σελίδα.';

  @override
  String pageNText(int n) {
    return 'Κείμενο σελίδας $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Διαγραφή της σελίδας $n;';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Σελίδα $n από $total';
  }

  @override
  String get rotateLeft => 'Περιστροφή αριστερά';

  @override
  String get rotateRight => 'Περιστροφή δεξιά';

  @override
  String get sign => 'Υπογραφή';

  @override
  String get copyText => 'Αντιγραφή κειμένου';

  @override
  String get shareImage => 'Κοινοποίηση εικόνας';

  @override
  String get deletePage => 'Διαγραφή σελίδας';

  @override
  String get signed => 'Υπογράφηκε.';

  @override
  String signPageN(int n) {
    return 'Υπογραφή σελίδας $n';
  }

  @override
  String get deleteThisSignature => 'Διαγραφή αυτής της υπογραφής';

  @override
  String get newSignature => 'Νέα υπογραφή';

  @override
  String readingPage(int n, int total) {
    return 'Ανάγνωση σελίδας $n / $total';
  }

  @override
  String get ocrFailed => 'Η αναγνώριση κειμένου απέτυχε.';

  @override
  String ocrFailedWith(String error) {
    return 'Η αναγνώριση κειμένου απέτυχε: $error';
  }

  @override
  String get textSaved => 'Το κείμενο αποθηκεύτηκε.';

  @override
  String get text => 'Κείμενο';

  @override
  String get copyAll => 'Αντιγραφή όλων';

  @override
  String get shareText => 'Κοινοποίηση κειμένου';

  @override
  String get saveAsTxt => 'Αποθήκευση ως .txt';

  @override
  String get readAgain => 'Ανάγνωση ξανά';

  @override
  String get readAsLatin => 'Ανάγνωση ως αγγλικά / λατινικά';

  @override
  String get readAsDevanagari => 'Ανάγνωση ως χίντι / νεπαλικά';

  @override
  String get ocrModelHint =>
      'Στο Android, το μοντέλο κειμένου κατεβαίνει μία φορά από τις υπηρεσίες Google Play. Αν είναι η πρώτη χρήση, περιμένετε ένα λεπτό και δοκιμάστε ξανά.';

  @override
  String get noTextFound => 'Δεν βρέθηκε κείμενο.';

  @override
  String pageSeparator(int n) {
    return '--- Σελίδα $n ---';
  }

  @override
  String get scanner => 'Σαρωτής';

  @override
  String get scanMode => 'Λειτουργία σάρωσης';

  @override
  String get modeFull => 'Πλήρης: φίλτρα + καθαρισμός λεκέδων και δαχτύλων';

  @override
  String get modeFilter => 'Μόνο φίλτρα';

  @override
  String get modeBase => 'Βασική: μόνο περικοπή και περιστροφή';

  @override
  String get allowGallery => 'Να επιτρέπεται η εισαγωγή από τη συλλογή';

  @override
  String get allowGalleryHint =>
      'Εμφανίζει ένα κουμπί συλλογής μέσα στον σαρωτή';

  @override
  String get pagesPerScan => 'Σελίδες ανά σάρωση';

  @override
  String get iosScannerNote =>
      'Στο iPhone, ο σαρωτής είναι η κάμερα εγγράφων της ίδιας της Apple.';

  @override
  String get iosScannerNote2 =>
      'Η αυτόματη λήψη, η ανίχνευση άκρων και οι λειτουργίες χρώματος είναι ενσωματωμένες.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Μέγεθος σελίδας';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Ίδιο σχήμα με τη σάρωση';

  @override
  String get searchablePdf => 'PDF με δυνατότητα αναζήτησης';

  @override
  String get searchablePdfHint =>
      'Προσθέτει ένα αόρατο επίπεδο κειμένου ώστε να γίνεται αναζήτηση στο PDF και αντιγραφή κειμένου';

  @override
  String get textRecognition => 'Αναγνώριση κειμένου';

  @override
  String get quality => 'Ποιότητα';

  @override
  String get qualityBest =>
      'Βέλτιστη: πλήρης ανάλυση, διαβάζει και τα ψιλά γράμματα';

  @override
  String get qualityFast => 'Γρήγορη: μικρότερο αντίγραφο της σελίδας';

  @override
  String get language => 'Γλώσσα';

  @override
  String get scriptLatin => 'Αγγλικά και άλλες γλώσσες με λατινικό αλφάβητο';

  @override
  String get scriptDevanagari => 'Χίντι, νεπαλικά, μαράθι (+ λατινικά)';

  @override
  String get scriptChinese => 'Κινεζικά (+ λατινικά)';

  @override
  String get scriptJapanese => 'Ιαπωνικά (+ λατινικά)';

  @override
  String get scriptKorean => 'Κορεατικά (+ λατινικά)';

  @override
  String get readAsChinese => 'Ανάγνωση ως κινεζικά';

  @override
  String get readAsJapanese => 'Ανάγνωση ως ιαπωνικά';

  @override
  String get readAsKorean => 'Ανάγνωση ως κορεατικά';

  @override
  String get languageAuto => 'Η γλώσσα ανιχνεύεται αυτόματα.';

  @override
  String get appearance => 'Εμφάνιση';

  @override
  String get theme => 'Θέμα';

  @override
  String get themeSystem => 'Όπως το τηλέφωνο';

  @override
  String get themeLight => 'Φωτεινό';

  @override
  String get themeDark => 'Σκούρο';

  @override
  String get about => 'Πληροφορίες';

  @override
  String get aboutPromise =>
      'Χωρίς διαφημίσεις. Χωρίς λογαριασμό. Χωρίς παρακολούθηση.';

  @override
  String get aboutPromiseBody =>
      'Οι σαρώσεις παραμένουν σε αυτό το τηλέφωνο, εκτός αν τις κοινοποιήσετε ή τις εξαγάγετε. Η απεγκατάσταση της εφαρμογής τις διαγράφει, γι\' αυτό εξαγάγετε ό,τι θέλετε να κρατήσετε.';

  @override
  String get openSource => 'Ανοικτός κώδικας (Apache-2.0)';

  @override
  String get privacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get opensInBrowser => 'Ανοίγει στο πρόγραμμα περιήγησης';

  @override
  String get aboutTechAndroid =>
      'Σάρωση και αναγνώριση κειμένου από το Google ML Kit (στη συσκευή). Συγχώνευση PDF από το PDFBox-Android. Γραμματοσειρά ντεβαναγκάρι: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Σάρωση από το Apple VisionKit, αναγνώριση κειμένου από το Apple Vision (στη συσκευή). Γραμματοσειρά ντεβαναγκάρι: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Δεν ήταν δυνατό το άνοιγμα του $url';
  }

  @override
  String get scanBusinessCard => 'Σάρωση επαγγελματικής κάρτας';

  @override
  String get saveAsContact => 'Αποθήκευση ως επαφή';

  @override
  String get saveToContacts => 'Αποθήκευση στις Επαφές';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Επαγγελματική κάρτα';

  @override
  String get contactHint =>
      'Ελέγξτε τα πεδία και μετά αποθηκεύστε. Η εφαρμογή Επαφές του τηλεφώνου σας ανοίγει με όλα τα στοιχεία συμπληρωμένα.';

  @override
  String get readingCard => 'Ανάγνωση της κάρτας…';

  @override
  String get nothingRecognised =>
      'Δεν αναγνωρίστηκε κείμενο σε αυτή την κάρτα. Μπορείτε να πληκτρολογήσετε τα στοιχεία.';

  @override
  String get contactOpened =>
      'Οι Επαφές άνοιξαν. Πατήστε Αποθήκευση εκεί για να κρατήσετε την επαφή.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Δεν ήταν δυνατό το άνοιγμα των Επαφών: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Κάρτα $stamp';
  }

  @override
  String get fieldCompany => 'Εταιρεία';

  @override
  String get fieldJobTitle => 'Θέση εργασίας';

  @override
  String get fieldMobile => 'Κινητό';

  @override
  String get fieldPhone => 'Τηλέφωνο';

  @override
  String get fieldFax => 'Φαξ';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWebsite => 'Ιστότοπος';

  @override
  String get fieldAddress => 'Διεύθυνση';

  @override
  String get fieldCity => 'Πόλη';

  @override
  String get fieldCountry => 'Χώρα';

  @override
  String get fieldNotes => 'Σημειώσεις';

  @override
  String get drawFirst => 'Σχεδιάστε πρώτα την υπογραφή σας.';

  @override
  String get clear => 'Καθαρισμός';

  @override
  String get undo => 'Αναίρεση';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get signHint =>
      'Υπογράψτε μέσα στο πλαίσιο με το δάχτυλό σας. Γυρίστε το τηλέφωνο οριζόντια για περισσότερο χώρο.';

  @override
  String get thin => 'Λεπτή';

  @override
  String get medium => 'Μεσαία';

  @override
  String get thick => 'Παχιά';

  @override
  String couldNotReadPage(String error) {
    return 'Δεν ήταν δυνατή η ανάγνωση της σελίδας: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Δεν ήταν δυνατή η υπογραφή: $error';
  }

  @override
  String get placeSignature => 'Τοποθέτηση υπογραφής';

  @override
  String get apply => 'Εφαρμογή';

  @override
  String get dragPinchHint =>
      'Σύρετε για μετακίνηση. Τσιμπήστε για αλλαγή μεγέθους.';

  @override
  String get smaller => 'Μικρότερη';

  @override
  String get larger => 'Μεγαλύτερη';
}
