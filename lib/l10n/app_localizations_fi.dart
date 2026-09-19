// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Skannaa';

  @override
  String get cancel => 'Peruuta';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Sulje';

  @override
  String get delete => 'Poista';

  @override
  String get share => 'Jaa';

  @override
  String get copy => 'Kopioi';

  @override
  String get copied => 'Kopioitu.';

  @override
  String get saved => 'Tallennettu.';

  @override
  String get name => 'Nimi';

  @override
  String get rename => 'Nimeä uudelleen';

  @override
  String get settings => 'Asetukset';

  @override
  String get dismiss => 'Hylkää';

  @override
  String get tryAgain => 'Yritä uudelleen';

  @override
  String get cannotBeUndone => 'Tätä ei voi kumota.';

  @override
  String get savingPages => 'Tallennetaan sivuja…';

  @override
  String get preparingScanner =>
      'Valmistellaan skanneria…\nEnsimmäinen käyttökerta: Google Play -palvelut lataa sen kerran.';

  @override
  String get scannerUnavailable => 'Skanneri ei ole käytettävissä.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Skanneri ei ole käytettävissä: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Sivujen tallennus epäonnistui: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Tiedostonvalitsinta ei voitu avata: $error';
  }

  @override
  String get importingPdf => 'Tuodaan PDF…';

  @override
  String get importedPdf => 'Tuotu PDF';

  @override
  String couldNotImport(String error) {
    return 'Tuonti epäonnistui: $error';
  }

  @override
  String get pickTwoPdfs => 'Valitse vähintään kaksi PDF-tiedostoa.';

  @override
  String mergingPdfs(int count) {
    return 'Yhdistetään $count PDF-tiedostoa…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Yhdistetty $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Yhdistäminen epäonnistui: $error';
  }

  @override
  String get saveToFolder => 'Tallenna kansioon';

  @override
  String couldNotSave(String error) {
    return 'Tallennus epäonnistui: $error';
  }

  @override
  String get mergedDocument => 'Yhdistetty asiakirja';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count muuta';
  }

  @override
  String get merging => 'Yhdistetään…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistetaanko $count asiakirjaa?',
      one: 'Poistetaanko 1 asiakirja?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Luodaan PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Luodaan PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Luodaan PDF, sivu $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF-tiedoston luonti epäonnistui: $error';
  }

  @override
  String get searchDocuments => 'Hae asiakirjoja';

  @override
  String get closeSearch => 'Sulje haku';

  @override
  String get search => 'Hae';

  @override
  String get importPdfAsPages => 'Tuo PDF sivuina';

  @override
  String get mergePdfFiles => 'Yhdistä PDF-tiedostoja';

  @override
  String get clearSelection => 'Tyhjennä valinta';

  @override
  String nSelected(int count) {
    return '$count valittu';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count valittu · yhdistetään tässä järjestyksessä';
  }

  @override
  String get mergeIntoOne => 'Yhdistä yhdeksi asiakirjaksi';

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
  String get shareAsPdf => 'Jaa PDF-tiedostona';

  @override
  String get selectAll => 'Valitse kaikki';

  @override
  String get noScansYet => 'Ei vielä skannauksia';

  @override
  String get nothingMatches => 'Ei osumia';

  @override
  String get emptyHint =>
      'Napauta Skannaa kuvataksesi asiakirjan. Kaikki pysyy tässä puhelimessa.';

  @override
  String get tryAnotherWord => 'Kokeile toista sanaa.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sivua',
      one: '1 sivu',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Skannaus $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO sulkeutui odottamatta';

  @override
  String get crashBody =>
      'Raportti virheestä tallennettiin vain tähän puhelimeen. Sen jakaminen kehittäjälle auttaa korjaamaan ongelman. Se sisältää teknisiä tietoja, ei asiakirjojasi.';

  @override
  String get reportCopied => 'Raportti kopioitu.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO -kaatumisraportti';

  @override
  String get pdfSaved => 'PDF tallennettu.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF-tiedoston tallennus epäonnistui: $error';
  }

  @override
  String get exportPagesAsImages => 'Vie sivut kuvina';

  @override
  String get saveToPhotos => 'Tallenna Kuviin';

  @override
  String get savingToPhotos => 'Tallennetaan Kuviin…';

  @override
  String get photosNeedsAndroid10 =>
      'Kuviin tallentaminen vaatii Android 10:n tai uudemman. Käytä sen sijaan Jaa-toimintoa.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO ei saa lisätä kuvia Kuviin. Salli se Asetuksissa tai käytä Jaa-toimintoa.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa tallennettu Kuviin.',
      one: '1 kuva tallennettu Kuviin.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Vienti epäonnistui: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Poistetaanko tämä asiakirja?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sivua poistetaan. Tätä ei voi kumota.',
      one: '1 sivu poistetaan. Tätä ei voi kumota.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Teksti (OCR)';

  @override
  String get sharePdf => 'Jaa PDF';

  @override
  String get savePdfToFolder => 'Tallenna PDF kansioon';

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
  String get exportAsImages => 'Vie muodossa JPEG / PNG';

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
  String get deleteDocument => 'Poista asiakirja';

  @override
  String get noPages => 'Ei sivuja. Napauta Lisää sivuja.';

  @override
  String get addPages => 'Lisää sivuja';

  @override
  String get holdToReorder => 'pidä sivua painettuna järjestääksesi';

  @override
  String get savePdfDialogTitle => 'Tallenna PDF';

  @override
  String get saveDialogTitle => 'Tallenna';

  @override
  String couldNotRotate(String error) {
    return 'Kääntäminen epäonnistui: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Jakaminen epäonnistui: $error';
  }

  @override
  String get noTextOnPage => 'Tältä sivulta ei löytynyt tekstiä.';

  @override
  String pageNText(int n) {
    return 'Sivun $n teksti';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Poistetaanko sivu $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Sivu $n / $total';
  }

  @override
  String get rotateLeft => 'Käännä vasemmalle';

  @override
  String get rotateRight => 'Käännä oikealle';

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
  String get undo => 'Kumoa';

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
  String get sign => 'Allekirjoita';

  @override
  String get copyText => 'Kopioi teksti';

  @override
  String get shareImage => 'Jaa kuva';

  @override
  String get deletePage => 'Poista sivu';

  @override
  String get signed => 'Allekirjoitettu.';

  @override
  String signPageN(int n) {
    return 'Allekirjoita sivu $n';
  }

  @override
  String get deleteThisSignature => 'Poista tämä allekirjoitus';

  @override
  String get newSignature => 'Uusi allekirjoitus';

  @override
  String readingPage(int n, int total) {
    return 'Luetaan sivua $n / $total';
  }

  @override
  String get ocrFailed => 'Tekstintunnistus epäonnistui.';

  @override
  String ocrFailedWith(String error) {
    return 'Tekstintunnistus epäonnistui: $error';
  }

  @override
  String get textSaved => 'Teksti tallennettu.';

  @override
  String get text => 'Teksti';

  @override
  String get copyAll => 'Kopioi kaikki';

  @override
  String get shareText => 'Jaa teksti';

  @override
  String get saveAsTxt => 'Tallenna .txt-tiedostona';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Lue uudelleen';

  @override
  String get readAsLatin => 'Lue englantina / latinalaisena';

  @override
  String get readAsDevanagari => 'Lue hindinä / nepalina';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Androidilla Google Play -palvelut lataa tekstimallin kerran. Jos tämä on ensimmäinen käyttökerta, odota minuutti ja yritä uudelleen.';

  @override
  String get noTextFound => 'Tekstiä ei löytynyt.';

  @override
  String pageSeparator(int n) {
    return '--- Sivu $n ---';
  }

  @override
  String get scanner => 'Skanneri';

  @override
  String get scanMode => 'Skannaustila';

  @override
  String get modeFull => 'Täysi: suodattimet + tahrojen ja sormien poisto';

  @override
  String get modeFilter => 'Vain suodattimet';

  @override
  String get modeBase => 'Perus: vain rajaus ja kääntö';

  @override
  String get allowGallery => 'Salli tuonti galleriasta';

  @override
  String get allowGalleryHint => 'Näyttää galleriapainikkeen skannerissa';

  @override
  String get pagesPerScan => 'Sivuja per skannaus';

  @override
  String get iosScannerNote =>
      'iPhonessa skanneri on Applen oma asiakirjakamera.';

  @override
  String get iosScannerNote2 =>
      'Automaattinen kuvaus, reunojen tunnistus ja väritilat ovat sisäänrakennettuja.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Sivukoko';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Sama muoto kuin skannauksella';

  @override
  String get searchablePdf => 'Haettava PDF';

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
      'Lisää näkymättömän tekstikerroksen, jotta PDF-tiedostosta voi hakea ja tekstiä voi kopioida';

  @override
  String get textRecognition => 'Tekstintunnistus';

  @override
  String get quality => 'Laatu';

  @override
  String get qualityBest => 'Paras: täysi tarkkuus, lukee pienenkin tekstin';

  @override
  String get qualityFast => 'Nopea: pienennetty kopio sivusta';

  @override
  String get language => 'Kieli';

  @override
  String get scriptLatin =>
      'Englanti ja muut latinalaista kirjaimistoa käyttävät kielet';

  @override
  String get scriptDevanagari => 'Hindi, nepali, marathi (+ latinalainen)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Kiina (+ latinalainen)';

  @override
  String get scriptJapanese => 'Japani (+ latinalainen)';

  @override
  String get scriptKorean => 'Korea (+ latinalainen)';

  @override
  String get readAsChinese => 'Lue kiinana';

  @override
  String get readAsJapanese => 'Lue japanina';

  @override
  String get readAsKorean => 'Lue koreana';

  @override
  String get languageAuto => 'Kieli tunnistetaan automaattisesti.';

  @override
  String get appearance => 'Ulkoasu';

  @override
  String get theme => 'Teema';

  @override
  String get themeSystem => 'Puhelimen mukaan';

  @override
  String get themeLight => 'Vaalea';

  @override
  String get themeDark => 'Tumma';

  @override
  String get about => 'Tietoja';

  @override
  String get aboutPromise => 'Ei mainoksia. Ei tiliä. Ei seurantaa.';

  @override
  String get aboutPromiseBody =>
      'Skannaukset pysyvät tässä puhelimessa, ellet jaa tai vie niitä. Sovelluksen poistaminen poistaa ne, joten vie se, minkä haluat säilyttää.';

  @override
  String get openSource => 'Avoin lähdekoodi (Apache-2.0)';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get opensInBrowser => 'Avautuu selaimessa';

  @override
  String get aboutTechAndroid =>
      'Skannaus ja tekstintunnistus: Google ML Kit (laitteella). PDF-yhdistäminen: PDFBox-Android. Devanagari-fontti: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Skannaus: Apple VisionKit, tekstintunnistus: Apple Vision (laitteella). Devanagari-fontti: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Osoitetta $url ei voitu avata';
  }

  @override
  String get scanBusinessCard => 'Skannaa käyntikortti';

  @override
  String get saveAsContact => 'Tallenna yhteystiedoksi';

  @override
  String get saveToContacts => 'Tallenna Yhteystietoihin';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Käyntikortti';

  @override
  String get contactHint =>
      'Tarkista kentät ja tallenna sitten. Puhelimen Yhteystiedot-sovellus avautuu tiedot valmiiksi täytettyinä.';

  @override
  String get readingCard => 'Luetaan korttia…';

  @override
  String get nothingRecognised =>
      'Tästä kortista ei tunnistettu tekstiä. Voit silti kirjoittaa tiedot itse.';

  @override
  String get contactOpened =>
      'Yhteystiedot avattiin. Napauta siellä Tallenna, niin yhteystieto säilyy.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Yhteystietoja ei voitu avata: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kortti $stamp';
  }

  @override
  String get fieldCompany => 'Yritys';

  @override
  String get fieldJobTitle => 'Tehtävänimike';

  @override
  String get fieldMobile => 'Matkapuhelin';

  @override
  String get fieldPhone => 'Puhelin';

  @override
  String get fieldFax => 'Faksi';

  @override
  String get fieldEmail => 'Sähköposti';

  @override
  String get fieldWebsite => 'Verkkosivusto';

  @override
  String get fieldAddress => 'Osoite';

  @override
  String get fieldCity => 'Kaupunki';

  @override
  String get fieldCountry => 'Maa';

  @override
  String get fieldNotes => 'Muistiinpanot';

  @override
  String get drawFirst => 'Piirrä ensin allekirjoituksesi.';

  @override
  String get clear => 'Tyhjennä';

  @override
  String get save => 'Tallenna';

  @override
  String get signHint =>
      'Allekirjoita ruutuun sormella. Käännä puhelin vaakasuuntaan saadaksesi enemmän tilaa.';

  @override
  String get thin => 'Ohut';

  @override
  String get medium => 'Keskipaksu';

  @override
  String get thick => 'Paksu';

  @override
  String couldNotReadPage(String error) {
    return 'Sivun lukeminen epäonnistui: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Allekirjoitus epäonnistui: $error';
  }

  @override
  String get placeSignature => 'Sijoita allekirjoitus';

  @override
  String get apply => 'Käytä';

  @override
  String get dragPinchHint => 'Siirrä vetämällä. Muuta kokoa nipistämällä.';

  @override
  String get smaller => 'Pienempi';

  @override
  String get larger => 'Suurempi';
}
