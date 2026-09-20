// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Skenovat';

  @override
  String get cancel => 'Zrušit';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Zavřít';

  @override
  String get delete => 'Smazat';

  @override
  String get share => 'Sdílet';

  @override
  String get copy => 'Kopírovat';

  @override
  String get copied => 'Zkopírováno.';

  @override
  String get saved => 'Uloženo.';

  @override
  String get name => 'Název';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get settings => 'Nastavení';

  @override
  String get dismiss => 'Skrýt';

  @override
  String get tryAgain => 'Zkusit znovu';

  @override
  String get cannotBeUndone => 'Tuto akci nelze vrátit zpět.';

  @override
  String get savingPages => 'Ukládání stránek…';

  @override
  String get preparingScanner =>
      'Příprava skeneru…\nPrvní použití: Služby Google Play jej jednorázově stáhnou.';

  @override
  String get scannerUnavailable => 'Skener není k dispozici.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Skener není k dispozici: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Stránky se nepodařilo uložit: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Výběr souborů se nepodařilo otevřít: $error';
  }

  @override
  String get importingPdf => 'Import PDF…';

  @override
  String get importedPdf => 'Importované PDF';

  @override
  String couldNotImport(String error) {
    return 'Import se nezdařil: $error';
  }

  @override
  String get pickTwoPdfs => 'Vyberte alespoň dva soubory PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Slučování souborů PDF ($count)…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Sloučeno $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Sloučení se nezdařilo: $error';
  }

  @override
  String get saveToFolder => 'Uložit do složky';

  @override
  String couldNotSave(String error) {
    return 'Uložení se nezdařilo: $error';
  }

  @override
  String get mergedDocument => 'Sloučený dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count dalších';
  }

  @override
  String get merging => 'Slučování…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazat $count dokumentů?',
      few: 'Smazat $count dokumenty?',
      one: 'Smazat 1 dokument?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Vytváření PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Vytváření PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Vytváření PDF, stránka $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF se nepodařilo vytvořit: $error';
  }

  @override
  String get searchDocuments => 'Hledat dokumenty';

  @override
  String get closeSearch => 'Zavřít hledání';

  @override
  String get search => 'Hledat';

  @override
  String get importPdfAsPages => 'Importovat PDF jako stránky';

  @override
  String get mergePdfFiles => 'Sloučit soubory PDF';

  @override
  String get clearSelection => 'Zrušit výběr';

  @override
  String nSelected(int count) {
    return 'Vybráno: $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Vybráno: $count · sloučení v tomto pořadí';
  }

  @override
  String get mergeIntoOne => 'Sloučit do jednoho dokumentu';

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
  String get shareAsPdf => 'Sdílet jako PDF';

  @override
  String get selectAll => 'Vybrat vše';

  @override
  String get noScansYet => 'Zatím žádné skeny';

  @override
  String get nothingMatches => 'Nic nenalezeno';

  @override
  String get emptyHint =>
      'Klepnutím na Skenovat vyfotografujete dokument. Vše zůstává v tomto telefonu.';

  @override
  String get tryAnotherWord => 'Zkuste jiné slovo.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      few: '$count stránky',
      one: '1 stránka',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Sken $stamp';
  }

  @override
  String get crashTitle => 'Aplikace BRIDGE PHOTO se neočekávaně ukončila';

  @override
  String get crashBody =>
      'Zpráva o chybě byla uložena pouze v tomto telefonu. Její sdílení s vývojářem pomáhá problém opravit. Obsahuje technické údaje, ne vaše dokumenty.';

  @override
  String get reportCopied => 'Zpráva zkopírována.';

  @override
  String get crashReportSubject => 'Zpráva o pádu aplikace BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF uloženo.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF se nepodařilo uložit: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportovat stránky jako obrázky';

  @override
  String get saveToPhotos => 'Uložit do Fotek';

  @override
  String get savingToPhotos => 'Ukládání do Fotek…';

  @override
  String get photosNeedsAndroid10 =>
      'Ukládání do Fotek vyžaduje Android 10 nebo novější. Použijte místo toho Sdílet.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO nemá oprávnění přidávat do Fotek. Povolte to v Nastavení nebo použijte Sdílet.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrázků uloženo do Fotek.',
      few: '$count obrázky uloženy do Fotek.',
      one: '1 obrázek uložen do Fotek.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Export se nezdařil: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Smazat tento dokument?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bude smazáno $count stránek. Tuto akci nelze vrátit zpět.',
      few: 'Budou smazány $count stránky. Tuto akci nelze vrátit zpět.',
      one: 'Bude smazána 1 stránka. Tuto akci nelze vrátit zpět.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Text (OCR)';

  @override
  String get sharePdf => 'Sdílet PDF';

  @override
  String get savePdfToFolder => 'Uložit PDF do složky';

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
  String get exportAsImages => 'Exportovat jako JPEG / PNG';

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
  String get deleteDocument => 'Smazat dokument';

  @override
  String get noPages => 'Žádné stránky. Klepněte na Přidat stránky.';

  @override
  String get addPages => 'Přidat stránky';

  @override
  String get holdToReorder => 'podržením stránky změníte pořadí';

  @override
  String get savePdfDialogTitle => 'Uložit PDF';

  @override
  String get saveDialogTitle => 'Uložit';

  @override
  String couldNotRotate(String error) {
    return 'Otočení se nezdařilo: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Sdílení se nezdařilo: $error';
  }

  @override
  String get noTextOnPage => 'Na této stránce nebyl nalezen žádný text.';

  @override
  String pageNText(int n) {
    return 'Text stránky $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Smazat stránku $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Stránka $n z $total';
  }

  @override
  String get rotateLeft => 'Otočit doleva';

  @override
  String get rotateRight => 'Otočit doprava';

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
  String get undo => 'Zpět';

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
  String get sign => 'Podepsat';

  @override
  String get copyText => 'Kopírovat text';

  @override
  String get shareImage => 'Sdílet obrázek';

  @override
  String get deletePage => 'Smazat stránku';

  @override
  String get signed => 'Podepsáno.';

  @override
  String signPageN(int n) {
    return 'Podepsat stránku $n';
  }

  @override
  String get deleteThisSignature => 'Smazat tento podpis';

  @override
  String get newSignature => 'Nový podpis';

  @override
  String readingPage(int n, int total) {
    return 'Čtení stránky $n / $total';
  }

  @override
  String get ocrFailed => 'Rozpoznávání textu se nezdařilo.';

  @override
  String ocrFailedWith(String error) {
    return 'Rozpoznávání textu se nezdařilo: $error';
  }

  @override
  String get textSaved => 'Text uložen.';

  @override
  String get text => 'Text';

  @override
  String get copyAll => 'Kopírovat vše';

  @override
  String get shareText => 'Sdílet text';

  @override
  String get saveAsTxt => 'Uložit jako .txt';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Přečíst znovu';

  @override
  String get readAsLatin => 'Číst jako angličtinu / latinku';

  @override
  String get readAsDevanagari => 'Číst jako hindštinu / nepálštinu';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'V systému Android stahují textový model jednorázově Služby Google Play. Pokud jde o první použití, počkejte minutu a zkuste to znovu.';

  @override
  String get noTextFound => 'Nebyl nalezen žádný text.';

  @override
  String pageSeparator(int n) {
    return '--- Stránka $n ---';
  }

  @override
  String get scanner => 'Skener';

  @override
  String get scanMode => 'Režim skenování';

  @override
  String get modeFull => 'Úplný: filtry + odstranění skvrn a prstů';

  @override
  String get modeFilter => 'Pouze filtry';

  @override
  String get modeBase => 'Základní: pouze oříznutí a otočení';

  @override
  String get allowGallery => 'Povolit import z galerie';

  @override
  String get allowGalleryHint => 'Zobrazí ve skeneru tlačítko galerie';

  @override
  String get pagesPerScan => 'Stránek na sken';

  @override
  String get iosScannerNote =>
      'Na zařízení iPhone je skenerem vlastní fotoaparát pro dokumenty od společnosti Apple.';

  @override
  String get iosScannerNote2 =>
      'Automatické snímání, detekce okrajů a barevné režimy jsou vestavěné.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Velikost stránky';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Stejný tvar jako sken';

  @override
  String get searchablePdf => 'Prohledávatelné PDF';

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
      'Přidá neviditelnou textovou vrstvu, aby bylo možné v PDF vyhledávat a kopírovat text';

  @override
  String get textRecognition => 'Rozpoznávání textu';

  @override
  String get quality => 'Kvalita';

  @override
  String get qualityBest => 'Nejlepší: plné rozlišení, přečte i drobné písmo';

  @override
  String get qualityFast => 'Rychlá: zmenšená kopie stránky';

  @override
  String get language => 'Jazyk';

  @override
  String get scriptLatin => 'Angličtina a další jazyky psané latinkou';

  @override
  String get scriptDevanagari =>
      'Hindština, nepálština, maráthština (+ latinka)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Čínština (+ latinka)';

  @override
  String get scriptJapanese => 'Japonština (+ latinka)';

  @override
  String get scriptKorean => 'Korejština (+ latinka)';

  @override
  String get readAsChinese => 'Číst jako čínštinu';

  @override
  String get readAsJapanese => 'Číst jako japonštinu';

  @override
  String get readAsKorean => 'Číst jako korejštinu';

  @override
  String get languageAuto => 'Jazyk je rozpoznán automaticky.';

  @override
  String get appearance => 'Vzhled';

  @override
  String get theme => 'Motiv';

  @override
  String get themeSystem => 'Podle telefonu';

  @override
  String get themeLight => 'Světlý';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get about => 'O aplikaci';

  @override
  String get aboutPromise => 'Žádné reklamy. Žádný účet. Žádné sledování.';

  @override
  String get aboutPromiseBody =>
      'Skeny zůstávají v tomto telefonu, pokud je nesdílíte nebo neexportujete. Odinstalováním aplikace se smažou, proto si exportujte vše, co chcete zachovat.';

  @override
  String get openSource => 'Otevřený zdrojový kód (Apache-2.0)';

  @override
  String get privacyPolicy => 'Zásady ochrany soukromí';

  @override
  String get opensInBrowser => 'Otevře se ve vašem prohlížeči';

  @override
  String get aboutTechAndroid =>
      'Skenování a rozpoznávání textu: Google ML Kit (v zařízení). Slučování PDF: PDFBox-Android. Písmo dévanágarí: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Skenování: Apple VisionKit, rozpoznávání textu: Apple Vision (v zařízení). Písmo dévanágarí: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Nepodařilo se otevřít $url';
  }

  @override
  String get scanBusinessCard => 'Skenovat vizitku';

  @override
  String get saveAsContact => 'Uložit jako kontakt';

  @override
  String get saveToContacts => 'Uložit do Kontaktů';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Vizitka';

  @override
  String get contactHint =>
      'Zkontrolujte pole a poté uložte. Otevře se aplikace Kontakty v telefonu s vyplněnými údaji.';

  @override
  String get readingCard => 'Čtení vizitky…';

  @override
  String get nothingRecognised =>
      'Na této vizitce nebyl rozpoznán žádný text. Údaje můžete zadat ručně.';

  @override
  String get contactOpened =>
      'Kontakty byly otevřeny. Klepnutím na Uložit kontakt uchováte.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Nepodařilo se otevřít Kontakty: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Vizitka $stamp';
  }

  @override
  String get fieldCompany => 'Společnost';

  @override
  String get fieldJobTitle => 'Pracovní pozice';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Web';

  @override
  String get fieldAddress => 'Adresa';

  @override
  String get fieldCity => 'Město';

  @override
  String get fieldCountry => 'Země';

  @override
  String get fieldNotes => 'Poznámky';

  @override
  String get drawFirst => 'Nejprve nakreslete svůj podpis.';

  @override
  String get clear => 'Vymazat';

  @override
  String get save => 'Uložit';

  @override
  String get signHint =>
      'Podepište se prstem do rámečku. Otočte telefon na šířku, abyste měli více místa.';

  @override
  String get thin => 'Tenký';

  @override
  String get medium => 'Střední';

  @override
  String get thick => 'Tlustý';

  @override
  String couldNotReadPage(String error) {
    return 'Stránku se nepodařilo přečíst: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Podepsání se nezdařilo: $error';
  }

  @override
  String get placeSignature => 'Umístit podpis';

  @override
  String get apply => 'Použít';

  @override
  String get dragPinchHint =>
      'Tažením přesunete. Sevřením prstů změníte velikost.';

  @override
  String get smaller => 'Menší';

  @override
  String get larger => 'Větší';
}
