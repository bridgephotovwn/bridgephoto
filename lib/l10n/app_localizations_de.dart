// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Scannen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Schließen';

  @override
  String get delete => 'Löschen';

  @override
  String get share => 'Teilen';

  @override
  String get copy => 'Kopieren';

  @override
  String get copied => 'Kopiert.';

  @override
  String get saved => 'Gespeichert.';

  @override
  String get name => 'Name';

  @override
  String get rename => 'Umbenennen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get cannotBeUndone => 'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get savingPages => 'Seiten werden gespeichert…';

  @override
  String get preparingScanner =>
      'Scanner wird vorbereitet…\nErste Nutzung: Google Play-Dienste laden ihn einmalig herunter.';

  @override
  String get scannerUnavailable => 'Der Scanner ist nicht verfügbar.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Der Scanner ist nicht verfügbar: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Die Seiten konnten nicht gespeichert werden: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Die Dateiauswahl konnte nicht geöffnet werden: $error';
  }

  @override
  String get importingPdf => 'PDF wird importiert…';

  @override
  String get importedPdf => 'Importiertes PDF';

  @override
  String couldNotImport(String error) {
    return 'Import fehlgeschlagen: $error';
  }

  @override
  String get pickTwoPdfs => 'Wählen Sie mindestens zwei PDF-Dateien aus.';

  @override
  String mergingPdfs(int count) {
    return '$count PDF-Dateien werden zusammengeführt…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Zusammengeführt $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Zusammenführen fehlgeschlagen: $error';
  }

  @override
  String get saveToFolder => 'In einem Ordner speichern';

  @override
  String couldNotSave(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get mergedDocument => 'Zusammengeführtes Dokument';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count weitere';
  }

  @override
  String get merging => 'Wird zusammengeführt…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dokumente löschen?',
      one: '1 Dokument löschen?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF wird erstellt…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF $n / $total wird erstellt…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF wird erstellt, Seite $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Das PDF konnte nicht erstellt werden: $error';
  }

  @override
  String get searchDocuments => 'Dokumente durchsuchen';

  @override
  String get closeSearch => 'Suche schließen';

  @override
  String get search => 'Suchen';

  @override
  String get importPdfAsPages => 'PDF als Seiten importieren';

  @override
  String get mergePdfFiles => 'PDF-Dateien zusammenführen';

  @override
  String get clearSelection => 'Auswahl aufheben';

  @override
  String nSelected(int count) {
    return '$count ausgewählt';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count ausgewählt · Zusammenführung in dieser Reihenfolge';
  }

  @override
  String get mergeIntoOne => 'Zu einem Dokument zusammenführen';

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
  String get shareAsPdf => 'Als PDF teilen';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String get noScansYet => 'Noch keine Scans';

  @override
  String get nothingMatches => 'Keine Treffer';

  @override
  String get emptyHint =>
      'Tippen Sie auf Scannen, um ein Dokument zu fotografieren. Alles bleibt auf diesem Telefon.';

  @override
  String get tryAnotherWord => 'Versuchen Sie es mit einem anderen Wort.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Scan $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO wurde unerwartet beendet';

  @override
  String get crashBody =>
      'Ein Bericht über den Fehler wurde nur auf diesem Telefon gespeichert. Wenn Sie ihn mit dem Entwickler teilen, hilft das, das Problem zu beheben. Er enthält technische Details, nicht Ihre Dokumente.';

  @override
  String get reportCopied => 'Bericht kopiert.';

  @override
  String get crashReportSubject => 'Absturzbericht BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF gespeichert.';

  @override
  String couldNotSavePdf(String error) {
    return 'Das PDF konnte nicht gespeichert werden: $error';
  }

  @override
  String get exportPagesAsImages => 'Seiten als Bilder exportieren';

  @override
  String get saveToPhotos => 'In Fotos speichern';

  @override
  String get savingToPhotos => 'Wird in Fotos gespeichert…';

  @override
  String get photosNeedsAndroid10 =>
      'Zum Speichern in Fotos ist Android 10 oder neuer erforderlich. Verwenden Sie stattdessen Teilen.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO darf nichts zu Fotos hinzufügen. Erlauben Sie dies in den Einstellungen oder verwenden Sie Teilen.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bilder in Fotos gespeichert.',
      one: '1 Bild in Fotos gespeichert.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Dieses Dokument löschen?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Seiten werden gelöscht. Dies kann nicht rückgängig gemacht werden.',
      one: '1 Seite wird gelöscht. Dies kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Text (OCR)';

  @override
  String get sharePdf => 'PDF teilen';

  @override
  String get savePdfToFolder => 'PDF in einem Ordner speichern';

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
  String get exportAsImages => 'Als JPEG / PNG exportieren';

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
  String get deleteDocument => 'Dokument löschen';

  @override
  String get noPages => 'Keine Seiten. Tippen Sie auf Seiten hinzufügen.';

  @override
  String get addPages => 'Seiten hinzufügen';

  @override
  String get holdToReorder => 'Seite gedrückt halten, um sie zu verschieben';

  @override
  String get savePdfDialogTitle => 'PDF speichern';

  @override
  String get saveDialogTitle => 'Speichern';

  @override
  String couldNotRotate(String error) {
    return 'Drehen fehlgeschlagen: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Teilen fehlgeschlagen: $error';
  }

  @override
  String get noTextOnPage => 'Auf dieser Seite wurde kein Text gefunden.';

  @override
  String pageNText(int n) {
    return 'Text von Seite $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Seite $n löschen?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Seite $n von $total';
  }

  @override
  String get rotateLeft => 'Nach links drehen';

  @override
  String get rotateRight => 'Nach rechts drehen';

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
  String get undo => 'Rückgängig';

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
  String get sign => 'Unterschreiben';

  @override
  String get copyText => 'Text kopieren';

  @override
  String get shareImage => 'Bild teilen';

  @override
  String get deletePage => 'Seite löschen';

  @override
  String get signed => 'Unterschrieben.';

  @override
  String signPageN(int n) {
    return 'Seite $n unterschreiben';
  }

  @override
  String get deleteThisSignature => 'Diese Unterschrift löschen';

  @override
  String get newSignature => 'Neue Unterschrift';

  @override
  String readingPage(int n, int total) {
    return 'Seite $n / $total wird gelesen';
  }

  @override
  String get ocrFailed => 'Texterkennung fehlgeschlagen.';

  @override
  String ocrFailedWith(String error) {
    return 'Texterkennung fehlgeschlagen: $error';
  }

  @override
  String get textSaved => 'Text gespeichert.';

  @override
  String get text => 'Text';

  @override
  String get copyAll => 'Alles kopieren';

  @override
  String get shareText => 'Text teilen';

  @override
  String get saveAsTxt => 'Als .txt speichern';

  @override
  String get readAgain => 'Erneut lesen';

  @override
  String get readAsLatin => 'Als Englisch / lateinisch lesen';

  @override
  String get readAsDevanagari => 'Als Hindi / Nepali lesen';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Unter Android wird das Textmodell einmalig von den Google Play-Diensten heruntergeladen. Bei der ersten Nutzung warten Sie bitte eine Minute und versuchen Sie es erneut.';

  @override
  String get noTextFound => 'Es wurde kein Text gefunden.';

  @override
  String pageSeparator(int n) {
    return '--- Seite $n ---';
  }

  @override
  String get scanner => 'Scanner';

  @override
  String get scanMode => 'Scanmodus';

  @override
  String get modeFull =>
      'Vollständig: Filter + Entfernen von Flecken und Fingern';

  @override
  String get modeFilter => 'Nur Filter';

  @override
  String get modeBase => 'Einfach: nur Zuschneiden und Drehen';

  @override
  String get allowGallery => 'Import aus der Galerie erlauben';

  @override
  String get allowGalleryHint =>
      'Zeigt im Scanner eine Galerie-Schaltfläche an';

  @override
  String get pagesPerScan => 'Seiten pro Scan';

  @override
  String get iosScannerNote =>
      'Auf dem iPhone ist der Scanner die Dokumentenkamera von Apple.';

  @override
  String get iosScannerNote2 =>
      'Automatische Aufnahme, Kantenerkennung und Farbmodi sind integriert.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Seitengröße';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Gleiches Format wie der Scan';

  @override
  String get searchablePdf => 'Durchsuchbares PDF';

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
      'Fügt eine unsichtbare Textebene hinzu, damit das PDF durchsucht und Text kopiert werden kann';

  @override
  String get textRecognition => 'Texterkennung';

  @override
  String get quality => 'Qualität';

  @override
  String get qualityBest =>
      'Beste: volle Auflösung, liest auch Kleingedrucktes';

  @override
  String get qualityFast => 'Schnell: verkleinerte Kopie der Seite';

  @override
  String get language => 'Sprache';

  @override
  String get scriptLatin =>
      'Englisch und andere Sprachen mit lateinischer Schrift';

  @override
  String get scriptDevanagari => 'Hindi, Nepali, Marathi (+ lateinisch)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Chinesisch (+ lateinisch)';

  @override
  String get scriptJapanese => 'Japanisch (+ lateinisch)';

  @override
  String get scriptKorean => 'Koreanisch (+ lateinisch)';

  @override
  String get readAsChinese => 'Als Chinesisch lesen';

  @override
  String get readAsJapanese => 'Als Japanisch lesen';

  @override
  String get readAsKorean => 'Als Koreanisch lesen';

  @override
  String get languageAuto => 'Die Sprache wird automatisch erkannt.';

  @override
  String get appearance => 'Darstellung';

  @override
  String get theme => 'Design';

  @override
  String get themeSystem => 'Wie das Telefon';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get about => 'Info';

  @override
  String get aboutPromise => 'Keine Werbung. Kein Konto. Kein Tracking.';

  @override
  String get aboutPromiseBody =>
      'Scans bleiben auf diesem Telefon, sofern Sie sie nicht teilen oder exportieren. Beim Deinstallieren der App werden sie gelöscht – exportieren Sie also, was Sie behalten möchten.';

  @override
  String get openSource => 'Open Source (Apache-2.0)';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get opensInBrowser => 'Wird in Ihrem Browser geöffnet';

  @override
  String get aboutTechAndroid =>
      'Scannen und Texterkennung mit Google ML Kit (auf dem Gerät). PDF-Zusammenführung mit PDFBox-Android. Devanagari-Schrift: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Scannen mit Apple VisionKit, Texterkennung mit Apple Vision (auf dem Gerät). Devanagari-Schrift: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url konnte nicht geöffnet werden';
  }

  @override
  String get scanBusinessCard => 'Visitenkarte scannen';

  @override
  String get saveAsContact => 'Als Kontakt speichern';

  @override
  String get saveToContacts => 'In Kontakte speichern';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Visitenkarte';

  @override
  String get contactHint =>
      'Prüfen Sie die Felder und speichern Sie dann. Die Kontakte-App Ihres Telefons wird mit allen Angaben ausgefüllt geöffnet.';

  @override
  String get readingCard => 'Karte wird gelesen…';

  @override
  String get nothingRecognised =>
      'Auf dieser Karte wurde kein Text erkannt. Sie können die Angaben trotzdem eingeben.';

  @override
  String get contactOpened =>
      'Die Kontakte-App wurde geöffnet. Tippen Sie dort auf Speichern, um den Kontakt zu behalten.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Kontakte konnte nicht geöffnet werden: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Karte $stamp';
  }

  @override
  String get fieldCompany => 'Firma';

  @override
  String get fieldJobTitle => 'Position';

  @override
  String get fieldMobile => 'Mobil';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-Mail';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'Stadt';

  @override
  String get fieldCountry => 'Land';

  @override
  String get fieldNotes => 'Notizen';

  @override
  String get drawFirst => 'Zeichnen Sie zuerst Ihre Unterschrift.';

  @override
  String get clear => 'Alles löschen';

  @override
  String get save => 'Speichern';

  @override
  String get signHint =>
      'Unterschreiben Sie mit dem Finger im Feld. Drehen Sie das Telefon quer, um mehr Platz zu haben.';

  @override
  String get thin => 'Dünn';

  @override
  String get medium => 'Mittel';

  @override
  String get thick => 'Dick';

  @override
  String couldNotReadPage(String error) {
    return 'Die Seite konnte nicht gelesen werden: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Unterschreiben fehlgeschlagen: $error';
  }

  @override
  String get placeSignature => 'Unterschrift platzieren';

  @override
  String get apply => 'Übernehmen';

  @override
  String get dragPinchHint =>
      'Ziehen zum Verschieben. Zwei Finger zum Vergrößern oder Verkleinern.';

  @override
  String get smaller => 'Kleiner';

  @override
  String get larger => 'Größer';
}
