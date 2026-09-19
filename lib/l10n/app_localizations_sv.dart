// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Skanna';

  @override
  String get cancel => 'Avbryt';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Stäng';

  @override
  String get delete => 'Radera';

  @override
  String get share => 'Dela';

  @override
  String get copy => 'Kopiera';

  @override
  String get copied => 'Kopierat.';

  @override
  String get saved => 'Sparat.';

  @override
  String get name => 'Namn';

  @override
  String get rename => 'Byt namn';

  @override
  String get settings => 'Inställningar';

  @override
  String get dismiss => 'Avfärda';

  @override
  String get tryAgain => 'Försök igen';

  @override
  String get cannotBeUndone => 'Det här går inte att ångra.';

  @override
  String get savingPages => 'Sparar sidor…';

  @override
  String get preparingScanner =>
      'Förbereder skannern…\nFörsta gången: Google Play-tjänster laddar ner den en gång.';

  @override
  String get scannerUnavailable => 'Skannern är inte tillgänglig.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Skannern är inte tillgänglig: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Det gick inte att spara sidorna: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Det gick inte att öppna filväljaren: $error';
  }

  @override
  String get importingPdf => 'Importerar PDF…';

  @override
  String get importedPdf => 'Importerad PDF';

  @override
  String couldNotImport(String error) {
    return 'Det gick inte att importera: $error';
  }

  @override
  String get pickTwoPdfs => 'Välj minst två PDF-filer.';

  @override
  String mergingPdfs(int count) {
    return 'Slår ihop $count PDF-filer…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Sammanslagen $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Det gick inte att slå ihop: $error';
  }

  @override
  String get saveToFolder => 'Spara i en mapp';

  @override
  String couldNotSave(String error) {
    return 'Det gick inte att spara: $error';
  }

  @override
  String get mergedDocument => 'Sammanslaget dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count till';
  }

  @override
  String get merging => 'Slår ihop…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Radera $count dokument?',
      one: 'Radera 1 dokument?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Skapar PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Skapar PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Skapar PDF, sida $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Det gick inte att skapa PDF-filen: $error';
  }

  @override
  String get searchDocuments => 'Sök dokument';

  @override
  String get closeSearch => 'Stäng sökningen';

  @override
  String get search => 'Sök';

  @override
  String get importPdfAsPages => 'Importera PDF som sidor';

  @override
  String get mergePdfFiles => 'Slå ihop PDF-filer';

  @override
  String get clearSelection => 'Rensa markering';

  @override
  String nSelected(int count) {
    return '$count markerade';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count markerade · slås ihop i den här ordningen';
  }

  @override
  String get mergeIntoOne => 'Slå ihop till ett dokument';

  @override
  String get shareAsPdf => 'Dela som PDF';

  @override
  String get selectAll => 'Markera alla';

  @override
  String get noScansYet => 'Inga skanningar än';

  @override
  String get nothingMatches => 'Inga träffar';

  @override
  String get emptyHint =>
      'Tryck på Skanna för att fotografera ett dokument. Allt stannar på den här telefonen.';

  @override
  String get tryAnotherWord => 'Prova ett annat ord.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '1 sida',
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
  String get crashTitle => 'BRIDGE PHOTO avslutades oväntat';

  @override
  String get crashBody =>
      'En rapport om vad som gick fel har sparats enbart på den här telefonen. Att dela den med utvecklaren hjälper till att åtgärda problemet. Den innehåller tekniska detaljer, inte dina dokument.';

  @override
  String get reportCopied => 'Rapporten kopierad.';

  @override
  String get crashReportSubject => 'Kraschrapport från BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF sparad.';

  @override
  String couldNotSavePdf(String error) {
    return 'Det gick inte att spara PDF-filen: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportera sidor som bilder';

  @override
  String get saveToPhotos => 'Spara i Bilder';

  @override
  String get savingToPhotos => 'Sparar i Bilder…';

  @override
  String get photosNeedsAndroid10 =>
      'Att spara i Bilder kräver Android 10 eller senare. Använd Dela i stället.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO får inte lägga till i Bilder. Tillåt det i Inställningar eller använd Dela.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder sparade i Bilder.',
      one: '1 bild sparad i Bilder.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Det gick inte att exportera: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Radera det här dokumentet?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor raderas. Det här går inte att ångra.',
      one: '1 sida raderas. Det här går inte att ångra.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Text (OCR)';

  @override
  String get sharePdf => 'Dela PDF';

  @override
  String get savePdfToFolder => 'Spara PDF i en mapp';

  @override
  String get exportAsImages => 'Exportera som JPEG / PNG';

  @override
  String get oneSheetTitle => 'Pages on one sheet';

  @override
  String get oneSheetHint =>
      'Tap the pages in the order you want them — front, then back. They go on one printable sheet, and the pages you picked are kept.';

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
  String get deleteDocument => 'Radera dokument';

  @override
  String get noPages => 'Inga sidor. Tryck på Lägg till sidor.';

  @override
  String get addPages => 'Lägg till sidor';

  @override
  String get holdToReorder => 'håll på en sida för att ändra ordning';

  @override
  String get savePdfDialogTitle => 'Spara PDF';

  @override
  String get saveDialogTitle => 'Spara';

  @override
  String couldNotRotate(String error) {
    return 'Det gick inte att rotera: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Det gick inte att dela: $error';
  }

  @override
  String get noTextOnPage => 'Ingen text hittades på den här sidan.';

  @override
  String pageNText(int n) {
    return 'Text på sida $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Radera sida $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Sida $n av $total';
  }

  @override
  String get rotateLeft => 'Rotera åt vänster';

  @override
  String get rotateRight => 'Rotera åt höger';

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
  String get sign => 'Signera';

  @override
  String get copyText => 'Kopiera text';

  @override
  String get shareImage => 'Dela bild';

  @override
  String get deletePage => 'Radera sida';

  @override
  String get signed => 'Signerad.';

  @override
  String signPageN(int n) {
    return 'Signera sida $n';
  }

  @override
  String get deleteThisSignature => 'Radera den här signaturen';

  @override
  String get newSignature => 'Ny signatur';

  @override
  String readingPage(int n, int total) {
    return 'Läser sida $n / $total';
  }

  @override
  String get ocrFailed => 'Textigenkänningen misslyckades.';

  @override
  String ocrFailedWith(String error) {
    return 'Textigenkänningen misslyckades: $error';
  }

  @override
  String get textSaved => 'Text sparad.';

  @override
  String get text => 'Text';

  @override
  String get copyAll => 'Kopiera allt';

  @override
  String get shareText => 'Dela text';

  @override
  String get saveAsTxt => 'Spara som .txt';

  @override
  String get readAgain => 'Läs igen';

  @override
  String get readAsLatin => 'Läs som engelska / latinsk skrift';

  @override
  String get readAsDevanagari => 'Läs som hindi / nepalesiska';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'På Android laddas textmodellen ner en gång av Google Play-tjänster. Om det är första gången, vänta en minut och försök igen.';

  @override
  String get noTextFound => 'Ingen text hittades.';

  @override
  String pageSeparator(int n) {
    return '--- Sida $n ---';
  }

  @override
  String get scanner => 'Skanner';

  @override
  String get scanMode => 'Skanningsläge';

  @override
  String get modeFull => 'Fullständigt: filter + rensar fläckar och fingrar';

  @override
  String get modeFilter => 'Endast filter';

  @override
  String get modeBase => 'Enkelt: endast beskär och rotera';

  @override
  String get allowGallery => 'Tillåt import från galleriet';

  @override
  String get allowGalleryHint => 'Visar en galleriknapp i skannern';

  @override
  String get pagesPerScan => 'Sidor per skanning';

  @override
  String get iosScannerNote =>
      'På iPhone är skannern Apples egen dokumentkamera.';

  @override
  String get iosScannerNote2 =>
      'Automatisk bildtagning, kantavkänning och färglägen är inbyggda.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Sidstorlek';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Samma form som skanningen';

  @override
  String get searchablePdf => 'Sökbar PDF';

  @override
  String get searchablePdfHint =>
      'Lägger till ett osynligt textlager så att PDF-filen kan sökas i och text kopieras';

  @override
  String get textRecognition => 'Textigenkänning';

  @override
  String get quality => 'Kvalitet';

  @override
  String get qualityBest => 'Bästa: full upplösning, läser finstilt text';

  @override
  String get qualityFast => 'Snabb: förminskad kopia av sidan';

  @override
  String get language => 'Språk';

  @override
  String get scriptLatin => 'Engelska och andra språk med latinsk skrift';

  @override
  String get scriptDevanagari => 'Hindi, nepalesiska, marathi (+ latinsk)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Kinesiska (+ latinsk)';

  @override
  String get scriptJapanese => 'Japanska (+ latinsk)';

  @override
  String get scriptKorean => 'Koreanska (+ latinsk)';

  @override
  String get readAsChinese => 'Läs som kinesiska';

  @override
  String get readAsJapanese => 'Läs som japanska';

  @override
  String get readAsKorean => 'Läs som koreanska';

  @override
  String get languageAuto => 'Språket identifieras automatiskt.';

  @override
  String get appearance => 'Utseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Följ telefonen';

  @override
  String get themeLight => 'Ljust';

  @override
  String get themeDark => 'Mörkt';

  @override
  String get about => 'Om';

  @override
  String get aboutPromise => 'Inga annonser. Inget konto. Ingen spårning.';

  @override
  String get aboutPromiseBody =>
      'Skanningar stannar på den här telefonen om du inte delar eller exporterar dem. Om appen avinstalleras raderas de, så exportera det du vill behålla.';

  @override
  String get openSource => 'Öppen källkod (Apache-2.0)';

  @override
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get opensInBrowser => 'Öppnas i din webbläsare';

  @override
  String get aboutTechAndroid =>
      'Skanning och textigenkänning av Google ML Kit (på enheten). PDF-sammanslagning av PDFBox-Android. Devanagari-typsnitt: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Skanning av Apple VisionKit, textigenkänning av Apple Vision (på enheten). Devanagari-typsnitt: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Det gick inte att öppna $url';
  }

  @override
  String get scanBusinessCard => 'Skanna ett visitkort';

  @override
  String get saveAsContact => 'Spara som kontakt';

  @override
  String get saveToContacts => 'Spara i Kontakter';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Visitkort';

  @override
  String get contactHint =>
      'Kontrollera fälten och spara sedan. Telefonens app Kontakter öppnas med allt ifyllt.';

  @override
  String get readingCard => 'Läser kortet…';

  @override
  String get nothingRecognised =>
      'Ingen text kändes igen på det här kortet. Du kan ändå skriva in uppgifterna.';

  @override
  String get contactOpened =>
      'Kontakter har öppnats. Tryck på Spara där för att behålla kontakten.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Det gick inte att öppna Kontakter: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Kort $stamp';
  }

  @override
  String get fieldCompany => 'Företag';

  @override
  String get fieldJobTitle => 'Befattning';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-post';

  @override
  String get fieldWebsite => 'Webbplats';

  @override
  String get fieldAddress => 'Adress';

  @override
  String get fieldCity => 'Ort';

  @override
  String get fieldCountry => 'Land';

  @override
  String get fieldNotes => 'Anteckningar';

  @override
  String get drawFirst => 'Rita din signatur först.';

  @override
  String get clear => 'Rensa';

  @override
  String get undo => 'Ångra';

  @override
  String get save => 'Spara';

  @override
  String get signHint =>
      'Signera i rutan med fingret. Vänd telefonen på sidan för mer plats.';

  @override
  String get thin => 'Tunn';

  @override
  String get medium => 'Medel';

  @override
  String get thick => 'Tjock';

  @override
  String couldNotReadPage(String error) {
    return 'Det gick inte att läsa sidan: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Det gick inte att signera: $error';
  }

  @override
  String get placeSignature => 'Placera signatur';

  @override
  String get apply => 'Använd';

  @override
  String get dragPinchHint => 'Dra för att flytta. Nyp för att ändra storlek.';

  @override
  String get smaller => 'Mindre';

  @override
  String get larger => 'Större';
}
