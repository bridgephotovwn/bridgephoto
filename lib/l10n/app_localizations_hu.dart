// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Szkennelés';

  @override
  String get cancel => 'Mégse';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Bezárás';

  @override
  String get delete => 'Törlés';

  @override
  String get share => 'Megosztás';

  @override
  String get copy => 'Másolás';

  @override
  String get copied => 'Másolva.';

  @override
  String get saved => 'Mentve.';

  @override
  String get name => 'Név';

  @override
  String get rename => 'Átnevezés';

  @override
  String get settings => 'Beállítások';

  @override
  String get dismiss => 'Elvetés';

  @override
  String get tryAgain => 'Újra';

  @override
  String get cannotBeUndone => 'Ez a művelet nem vonható vissza.';

  @override
  String get savingPages => 'Oldalak mentése…';

  @override
  String get preparingScanner =>
      'A szkenner előkészítése…\nElső használat: a Google Play-szolgáltatások egyszer letöltik.';

  @override
  String get scannerUnavailable => 'A szkenner nem érhető el.';

  @override
  String scannerUnavailableWith(String error) {
    return 'A szkenner nem érhető el: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Nem sikerült menteni az oldalakat: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Nem sikerült megnyitni a fájlválasztót: $error';
  }

  @override
  String get importingPdf => 'PDF importálása…';

  @override
  String get importedPdf => 'Importált PDF';

  @override
  String couldNotImport(String error) {
    return 'Nem sikerült importálni: $error';
  }

  @override
  String get pickTwoPdfs => 'Válasszon ki legalább két PDF-fájlt.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF-fájl egyesítése…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Egyesített $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Nem sikerült egyesíteni: $error';
  }

  @override
  String get saveToFolder => 'Mentés mappába';

  @override
  String couldNotSave(String error) {
    return 'Nem sikerült menteni: $error';
  }

  @override
  String get mergedDocument => 'Egyesített dokumentum';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count további';
  }

  @override
  String get merging => 'Egyesítés…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dokumentum törlése?',
      one: '1 dokumentum törlése?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF készítése…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF készítése: $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF készítése, $n. oldal / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Nem sikerült elkészíteni a PDF-et: $error';
  }

  @override
  String get searchDocuments => 'Keresés a dokumentumokban';

  @override
  String get closeSearch => 'Keresés bezárása';

  @override
  String get search => 'Keresés';

  @override
  String get importPdfAsPages => 'PDF importálása oldalakként';

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
  String get mergePdfFiles => 'PDF-fájlok egyesítése';

  @override
  String get clearSelection => 'Kijelölés törlése';

  @override
  String nSelected(int count) {
    return '$count kijelölve';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count kijelölve · egyesítés ebben a sorrendben';
  }

  @override
  String get mergeIntoOne => 'Egyesítés egy dokumentumba';

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
  String get shareAsPdf => 'Megosztás PDF-ként';

  @override
  String get selectAll => 'Összes kijelölése';

  @override
  String get noScansYet => 'Még nincs szkennelés';

  @override
  String get nothingMatches => 'Nincs találat';

  @override
  String get emptyHint =>
      'Koppintson a Szkennelés gombra egy dokumentum lefotózásához. Minden ezen a telefonon marad.';

  @override
  String get tryAnotherWord => 'Próbáljon másik szót.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '1 oldal',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Szkennelés $stamp';
  }

  @override
  String get crashTitle => 'A BRIDGE PHOTO váratlanul bezárult';

  @override
  String get crashBody =>
      'A hibáról készült jelentés csak ezen a telefonon lett mentve. Ha megosztja a fejlesztővel, segít a hiba javításában. Technikai részleteket tartalmaz, nem az Ön dokumentumait.';

  @override
  String get reportCopied => 'Jelentés másolva.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO összeomlási jelentés';

  @override
  String get pdfSaved => 'PDF mentve.';

  @override
  String couldNotSavePdf(String error) {
    return 'Nem sikerült menteni a PDF-et: $error';
  }

  @override
  String get exportPagesAsImages => 'Oldalak exportálása képként';

  @override
  String get saveToPhotos => 'Mentés a Fotókba';

  @override
  String get savingToPhotos => 'Mentés a Fotókba…';

  @override
  String get photosNeedsAndroid10 =>
      'A Fotókba mentéshez Android 10 vagy újabb szükséges. Használja helyette a Megosztás lehetőséget.';

  @override
  String get photosNotAllowed =>
      'A BRIDGE PHOTO nem adhat hozzá elemeket a Fotókhoz. Engedélyezze a Beállításokban, vagy használja a Megosztás lehetőséget.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kép mentve a Fotókba.',
      one: '1 kép mentve a Fotókba.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Nem sikerült exportálni: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Törli ezt a dokumentumot?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal törlődik. Ez a művelet nem vonható vissza.',
      one: '1 oldal törlődik. Ez a művelet nem vonható vissza.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Szöveg (OCR)';

  @override
  String get sharePdf => 'PDF megosztása';

  @override
  String get savePdfToFolder => 'PDF mentése mappába';

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
  String get exportAsImages => 'Exportálás JPEG / PNG formátumban';

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
  String get deleteDocument => 'Dokumentum törlése';

  @override
  String get noPages =>
      'Nincsenek oldalak. Koppintson az Oldalak hozzáadása gombra.';

  @override
  String get addPages => 'Oldalak hozzáadása';

  @override
  String get holdToReorder => 'az átrendezéshez tartson nyomva egy oldalt';

  @override
  String get savePdfDialogTitle => 'PDF mentése';

  @override
  String get saveDialogTitle => 'Mentés';

  @override
  String couldNotRotate(String error) {
    return 'Nem sikerült elforgatni: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Nem sikerült megosztani: $error';
  }

  @override
  String get noTextOnPage => 'Ezen az oldalon nem található szöveg.';

  @override
  String pageNText(int n) {
    return '$n. oldal szövege';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Törli a(z) $n. oldalt?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$n. oldal / $total';
  }

  @override
  String get rotateLeft => 'Forgatás balra';

  @override
  String get rotateRight => 'Forgatás jobbra';

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
  String get undo => 'Visszavonás';

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
  String get sign => 'Aláírás';

  @override
  String get copyText => 'Szöveg másolása';

  @override
  String get shareImage => 'Kép megosztása';

  @override
  String get deletePage => 'Oldal törlése';

  @override
  String get signed => 'Aláírva.';

  @override
  String signPageN(int n) {
    return '$n. oldal aláírása';
  }

  @override
  String get deleteThisSignature => 'Aláírás törlése';

  @override
  String get newSignature => 'Új aláírás';

  @override
  String readingPage(int n, int total) {
    return '$n. oldal olvasása / $total';
  }

  @override
  String get ocrFailed => 'A szövegfelismerés nem sikerült.';

  @override
  String ocrFailedWith(String error) {
    return 'A szövegfelismerés nem sikerült: $error';
  }

  @override
  String get textSaved => 'Szöveg mentve.';

  @override
  String get text => 'Szöveg';

  @override
  String get copyAll => 'Összes másolása';

  @override
  String get shareText => 'Szöveg megosztása';

  @override
  String get saveAsTxt => 'Mentés .txt formátumban';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Újraolvasás';

  @override
  String get readAsLatin => 'Olvasás angolként / latin betűsként';

  @override
  String get readAsDevanagari => 'Olvasás hindiként / nepáliként';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Androidon a szövegmodellt a Google Play-szolgáltatások egyszer töltik le. Ha ez az első használat, várjon egy percet, és próbálja újra.';

  @override
  String get noTextFound => 'Nem található szöveg.';

  @override
  String pageSeparator(int n) {
    return '--- $n. oldal ---';
  }

  @override
  String get scanner => 'Szkenner';

  @override
  String get scanMode => 'Szkennelési mód';

  @override
  String get modeFull => 'Teljes: szűrők + foltok és ujjak eltávolítása';

  @override
  String get modeFilter => 'Csak szűrők';

  @override
  String get modeBase => 'Alap: csak vágás és forgatás';

  @override
  String get allowGallery => 'Importálás engedélyezése a galériából';

  @override
  String get allowGalleryHint => 'Galéria gombot jelenít meg a szkennerben';

  @override
  String get pagesPerScan => 'Oldalak száma szkennelésenként';

  @override
  String get iosScannerNote =>
      'iPhone készüléken a szkenner az Apple saját dokumentumkamerája.';

  @override
  String get iosScannerNote2 =>
      'Az automatikus rögzítés, az élérzékelés és a színmódok beépítettek.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Oldalméret';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'A szkennelés alakja szerint';

  @override
  String get searchablePdf => 'Kereshető PDF';

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
      'Láthatatlan szövegréteget ad hozzá, így a PDF kereshető és a szöveg másolható';

  @override
  String get textRecognition => 'Szövegfelismerés';

  @override
  String get quality => 'Minőség';

  @override
  String get qualityBest =>
      'Legjobb: teljes felbontás, az apró betűket is olvassa';

  @override
  String get qualityFast => 'Gyors: az oldal kicsinyített másolata';

  @override
  String get language => 'Nyelv';

  @override
  String get scriptLatin => 'Angol és más latin betűs nyelvek';

  @override
  String get scriptDevanagari => 'Hindi, nepáli, maráthi (+ latin)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Kínai (+ latin)';

  @override
  String get scriptJapanese => 'Japán (+ latin)';

  @override
  String get scriptKorean => 'Koreai (+ latin)';

  @override
  String get readAsChinese => 'Olvasás kínaiként';

  @override
  String get readAsJapanese => 'Olvasás japánként';

  @override
  String get readAsKorean => 'Olvasás koreaiként';

  @override
  String get languageAuto => 'A nyelv felismerése automatikus.';

  @override
  String get appearance => 'Megjelenés';

  @override
  String get theme => 'Téma';

  @override
  String get themeSystem => 'A telefon szerint';

  @override
  String get themeLight => 'Világos';

  @override
  String get themeDark => 'Sötét';

  @override
  String get about => 'Névjegy';

  @override
  String get aboutPromise => 'Nincs reklám. Nincs fiók. Nincs követés.';

  @override
  String get aboutPromiseBody =>
      'A szkennelések ezen a telefonon maradnak, hacsak nem osztja meg vagy exportálja őket. Az app eltávolításakor törlődnek, ezért exportálja, amit meg szeretne tartani.';

  @override
  String get openSource => 'Nyílt forráskódú (Apache-2.0)';

  @override
  String get privacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get opensInBrowser => 'A böngészőben nyílik meg';

  @override
  String get aboutTechAndroid =>
      'Szkennelés és szövegfelismerés: Google ML Kit (az eszközön). PDF-egyesítés: PDFBox-Android. Dévanágari betűtípus: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Szkennelés: Apple VisionKit, szövegfelismerés: Apple Vision (az eszközön). Dévanágari betűtípus: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Nem sikerült megnyitni: $url';
  }

  @override
  String get scanBusinessCard => 'Névjegykártya szkennelése';

  @override
  String get saveAsContact => 'Mentés névjegyként';

  @override
  String get saveToContacts => 'Mentés a Névjegyekbe';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Névjegykártya';

  @override
  String get contactHint =>
      'Ellenőrizze a mezőket, majd mentse. A telefon Névjegyek alkalmazása minden adattal kitöltve nyílik meg.';

  @override
  String get readingCard => 'A kártya olvasása…';

  @override
  String get nothingRecognised =>
      'Ezen a kártyán nem sikerült szöveget felismerni. Az adatokat így is beírhatja.';

  @override
  String get contactOpened =>
      'Megnyílt a Névjegyek. A megtartáshoz koppintson ott a Mentés gombra.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Nem sikerült megnyitni a Névjegyeket: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kártya $stamp';
  }

  @override
  String get fieldCompany => 'Cég';

  @override
  String get fieldJobTitle => 'Beosztás';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Webhely';

  @override
  String get fieldAddress => 'Cím';

  @override
  String get fieldCity => 'Város';

  @override
  String get fieldCountry => 'Ország';

  @override
  String get fieldNotes => 'Jegyzetek';

  @override
  String get drawFirst => 'Először rajzolja meg az aláírását.';

  @override
  String get clear => 'Törlés';

  @override
  String get save => 'Mentés';

  @override
  String get signHint =>
      'Írjon alá ujjal a keretben. Fordítsa a telefont fekvő helyzetbe, hogy több hely legyen.';

  @override
  String get thin => 'Vékony';

  @override
  String get medium => 'Közepes';

  @override
  String get thick => 'Vastag';

  @override
  String couldNotReadPage(String error) {
    return 'Nem sikerült beolvasni az oldalt: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Nem sikerült aláírni: $error';
  }

  @override
  String get placeSignature => 'Aláírás elhelyezése';

  @override
  String get apply => 'Alkalmaz';

  @override
  String get dragPinchHint =>
      'Húzza a mozgatáshoz. Csippentse az átméretezéshez.';

  @override
  String get smaller => 'Kisebb';

  @override
  String get larger => 'Nagyobb';
}
