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
  String get exportAsImages => 'Exportovat jako JPEG / PNG';

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
  String get readAgain => 'Přečíst znovu';

  @override
  String get readAsLatin => 'Číst jako angličtinu / latinku';

  @override
  String get readAsDevanagari => 'Číst jako hindštinu / nepálštinu';

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
  String get drawFirst => 'Nejprve nakreslete svůj podpis.';

  @override
  String get clear => 'Vymazat';

  @override
  String get undo => 'Zpět';

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
