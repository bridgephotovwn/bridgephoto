import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('ar'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'BRIDGE PHOTO'**
  String get appName;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied.'**
  String get copied;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved.'**
  String get saved;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @cannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get cannotBeUndone;

  /// No description provided for @savingPages.
  ///
  /// In en, this message translates to:
  /// **'Saving pages…'**
  String get savingPages;

  /// No description provided for @preparingScanner.
  ///
  /// In en, this message translates to:
  /// **'Preparing the scanner…\nFirst use: Google Play services downloads it once.'**
  String get preparingScanner;

  /// No description provided for @scannerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The scanner is not available.'**
  String get scannerUnavailable;

  /// No description provided for @scannerUnavailableWith.
  ///
  /// In en, this message translates to:
  /// **'The scanner is not available: {error}'**
  String scannerUnavailableWith(String error);

  /// No description provided for @couldNotSavePages.
  ///
  /// In en, this message translates to:
  /// **'Could not save the pages: {error}'**
  String couldNotSavePages(String error);

  /// No description provided for @couldNotOpenPicker.
  ///
  /// In en, this message translates to:
  /// **'Could not open the file picker: {error}'**
  String couldNotOpenPicker(String error);

  /// No description provided for @importingPdf.
  ///
  /// In en, this message translates to:
  /// **'Importing PDF…'**
  String get importingPdf;

  /// No description provided for @importedPdf.
  ///
  /// In en, this message translates to:
  /// **'Imported PDF'**
  String get importedPdf;

  /// No description provided for @couldNotImport.
  ///
  /// In en, this message translates to:
  /// **'Could not import: {error}'**
  String couldNotImport(String error);

  /// No description provided for @pickTwoPdfs.
  ///
  /// In en, this message translates to:
  /// **'Pick at least two PDF files.'**
  String get pickTwoPdfs;

  /// No description provided for @mergingPdfs.
  ///
  /// In en, this message translates to:
  /// **'Merging {count} PDF files…'**
  String mergingPdfs(int count);

  /// No description provided for @mergedFileName.
  ///
  /// In en, this message translates to:
  /// **'Merged {stamp}'**
  String mergedFileName(String stamp);

  /// No description provided for @couldNotMerge.
  ///
  /// In en, this message translates to:
  /// **'Could not merge: {error}'**
  String couldNotMerge(String error);

  /// No description provided for @saveToFolder.
  ///
  /// In en, this message translates to:
  /// **'Save to a folder'**
  String get saveToFolder;

  /// No description provided for @couldNotSave.
  ///
  /// In en, this message translates to:
  /// **'Could not save: {error}'**
  String couldNotSave(String error);

  /// No description provided for @mergedDocument.
  ///
  /// In en, this message translates to:
  /// **'Merged document'**
  String get mergedDocument;

  /// No description provided for @mergedDefaultName.
  ///
  /// In en, this message translates to:
  /// **'{first} + {count} more'**
  String mergedDefaultName(String first, int count);

  /// No description provided for @merging.
  ///
  /// In en, this message translates to:
  /// **'Merging…'**
  String get merging;

  /// No description provided for @deleteDocumentsQuestion.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 document?} other{Delete {count} documents?}}'**
  String deleteDocumentsQuestion(int count);

  /// No description provided for @buildingPdf.
  ///
  /// In en, this message translates to:
  /// **'Building PDF…'**
  String get buildingPdf;

  /// No description provided for @buildingPdfN.
  ///
  /// In en, this message translates to:
  /// **'Building PDF {n} / {total}…'**
  String buildingPdfN(int n, int total);

  /// No description provided for @buildingPdfPage.
  ///
  /// In en, this message translates to:
  /// **'Building PDF, page {n} / {total}'**
  String buildingPdfPage(int n, int total);

  /// No description provided for @couldNotBuildPdf.
  ///
  /// In en, this message translates to:
  /// **'Could not build the PDF: {error}'**
  String couldNotBuildPdf(String error);

  /// No description provided for @searchDocuments.
  ///
  /// In en, this message translates to:
  /// **'Search documents'**
  String get searchDocuments;

  /// No description provided for @closeSearch.
  ///
  /// In en, this message translates to:
  /// **'Close search'**
  String get closeSearch;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @importPdfAsPages.
  ///
  /// In en, this message translates to:
  /// **'Import PDF as pages'**
  String get importPdfAsPages;

  /// No description provided for @mergePdfFiles.
  ///
  /// In en, this message translates to:
  /// **'Merge PDF files'**
  String get mergePdfFiles;

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear selection'**
  String get clearSelection;

  /// No description provided for @nSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String nSelected(int count);

  /// No description provided for @nSelectedMergeOrder.
  ///
  /// In en, this message translates to:
  /// **'{count} selected · merge in this order'**
  String nSelectedMergeOrder(int count);

  /// No description provided for @mergeIntoOne.
  ///
  /// In en, this message translates to:
  /// **'Merge into one document'**
  String get mergeIntoOne;

  /// No description provided for @shareAsPdf.
  ///
  /// In en, this message translates to:
  /// **'Share as PDF'**
  String get shareAsPdf;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @noScansYet.
  ///
  /// In en, this message translates to:
  /// **'No scans yet'**
  String get noScansYet;

  /// No description provided for @nothingMatches.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches'**
  String get nothingMatches;

  /// No description provided for @emptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap Scan to photograph a document. Everything stays on this phone.'**
  String get emptyHint;

  /// No description provided for @tryAnotherWord.
  ///
  /// In en, this message translates to:
  /// **'Try another word.'**
  String get tryAnotherWord;

  /// No description provided for @nPages.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String nPages(int count);

  /// No description provided for @pagesAndDate.
  ///
  /// In en, this message translates to:
  /// **'{pages} · {date}'**
  String pagesAndDate(String pages, String date);

  /// No description provided for @scanDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Scan {stamp}'**
  String scanDefaultName(String stamp);

  /// No description provided for @crashTitle.
  ///
  /// In en, this message translates to:
  /// **'BRIDGE PHOTO closed unexpectedly'**
  String get crashTitle;

  /// No description provided for @crashBody.
  ///
  /// In en, this message translates to:
  /// **'A report of what went wrong was saved on this phone only. Sharing it with the developer helps fix the problem. It contains technical details, not your documents.'**
  String get crashBody;

  /// No description provided for @reportCopied.
  ///
  /// In en, this message translates to:
  /// **'Report copied.'**
  String get reportCopied;

  /// No description provided for @crashReportSubject.
  ///
  /// In en, this message translates to:
  /// **'BRIDGE PHOTO crash report'**
  String get crashReportSubject;

  /// No description provided for @pdfSaved.
  ///
  /// In en, this message translates to:
  /// **'PDF saved.'**
  String get pdfSaved;

  /// No description provided for @couldNotSavePdf.
  ///
  /// In en, this message translates to:
  /// **'Could not save the PDF: {error}'**
  String couldNotSavePdf(String error);

  /// No description provided for @exportPagesAsImages.
  ///
  /// In en, this message translates to:
  /// **'Export pages as images'**
  String get exportPagesAsImages;

  /// No description provided for @saveToPhotos.
  ///
  /// In en, this message translates to:
  /// **'Save to Photos'**
  String get saveToPhotos;

  /// No description provided for @savingToPhotos.
  ///
  /// In en, this message translates to:
  /// **'Saving to Photos…'**
  String get savingToPhotos;

  /// No description provided for @photosNeedsAndroid10.
  ///
  /// In en, this message translates to:
  /// **'Saving to Photos needs Android 10 or newer. Use Share instead.'**
  String get photosNeedsAndroid10;

  /// No description provided for @photosNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'BRIDGE PHOTO is not allowed to add to Photos. Allow it in Settings, or use Share.'**
  String get photosNotAllowed;

  /// No description provided for @imagesSavedToPhotos.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 image saved to Photos.} other{{count} images saved to Photos.}}'**
  String imagesSavedToPhotos(int count);

  /// No description provided for @couldNotExport.
  ///
  /// In en, this message translates to:
  /// **'Could not export: {error}'**
  String couldNotExport(String error);

  /// No description provided for @deleteDocumentQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this document?'**
  String get deleteDocumentQuestion;

  /// No description provided for @deleteDocumentBody.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page will be deleted. This cannot be undone.} other{{count} pages will be deleted. This cannot be undone.}}'**
  String deleteDocumentBody(int count);

  /// No description provided for @textOcr.
  ///
  /// In en, this message translates to:
  /// **'Text (OCR)'**
  String get textOcr;

  /// No description provided for @sharePdf.
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get sharePdf;

  /// No description provided for @savePdfToFolder.
  ///
  /// In en, this message translates to:
  /// **'Save PDF to a folder'**
  String get savePdfToFolder;

  /// No description provided for @exportAsImages.
  ///
  /// In en, this message translates to:
  /// **'Export as JPEG / PNG'**
  String get exportAsImages;

  /// No description provided for @deleteDocument.
  ///
  /// In en, this message translates to:
  /// **'Delete document'**
  String get deleteDocument;

  /// No description provided for @noPages.
  ///
  /// In en, this message translates to:
  /// **'No pages. Tap Add pages.'**
  String get noPages;

  /// No description provided for @addPages.
  ///
  /// In en, this message translates to:
  /// **'Add pages'**
  String get addPages;

  /// No description provided for @holdToReorder.
  ///
  /// In en, this message translates to:
  /// **'hold a page to reorder'**
  String get holdToReorder;

  /// No description provided for @savePdfDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get savePdfDialogTitle;

  /// No description provided for @saveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveDialogTitle;

  /// No description provided for @couldNotRotate.
  ///
  /// In en, this message translates to:
  /// **'Could not rotate: {error}'**
  String couldNotRotate(String error);

  /// No description provided for @couldNotShare.
  ///
  /// In en, this message translates to:
  /// **'Could not share: {error}'**
  String couldNotShare(String error);

  /// No description provided for @noTextOnPage.
  ///
  /// In en, this message translates to:
  /// **'No text found on this page.'**
  String get noTextOnPage;

  /// No description provided for @pageNText.
  ///
  /// In en, this message translates to:
  /// **'Page {n} text'**
  String pageNText(int n);

  /// No description provided for @deletePageQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete page {n}?'**
  String deletePageQuestion(int n);

  /// No description provided for @pageNOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Page {n} of {total}'**
  String pageNOfTotal(int n, int total);

  /// No description provided for @rotateLeft.
  ///
  /// In en, this message translates to:
  /// **'Rotate left'**
  String get rotateLeft;

  /// No description provided for @rotateRight.
  ///
  /// In en, this message translates to:
  /// **'Rotate right'**
  String get rotateRight;

  /// No description provided for @sign.
  ///
  /// In en, this message translates to:
  /// **'Sign'**
  String get sign;

  /// No description provided for @copyText.
  ///
  /// In en, this message translates to:
  /// **'Copy text'**
  String get copyText;

  /// No description provided for @shareImage.
  ///
  /// In en, this message translates to:
  /// **'Share image'**
  String get shareImage;

  /// No description provided for @deletePage.
  ///
  /// In en, this message translates to:
  /// **'Delete page'**
  String get deletePage;

  /// No description provided for @signed.
  ///
  /// In en, this message translates to:
  /// **'Signed.'**
  String get signed;

  /// No description provided for @signPageN.
  ///
  /// In en, this message translates to:
  /// **'Sign page {n}'**
  String signPageN(int n);

  /// No description provided for @deleteThisSignature.
  ///
  /// In en, this message translates to:
  /// **'Delete this signature'**
  String get deleteThisSignature;

  /// No description provided for @newSignature.
  ///
  /// In en, this message translates to:
  /// **'New signature'**
  String get newSignature;

  /// No description provided for @readingPage.
  ///
  /// In en, this message translates to:
  /// **'Reading page {n} / {total}'**
  String readingPage(int n, int total);

  /// No description provided for @ocrFailed.
  ///
  /// In en, this message translates to:
  /// **'Text recognition failed.'**
  String get ocrFailed;

  /// No description provided for @ocrFailedWith.
  ///
  /// In en, this message translates to:
  /// **'Text recognition failed: {error}'**
  String ocrFailedWith(String error);

  /// No description provided for @textSaved.
  ///
  /// In en, this message translates to:
  /// **'Text saved.'**
  String get textSaved;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @copyAll.
  ///
  /// In en, this message translates to:
  /// **'Copy all'**
  String get copyAll;

  /// No description provided for @shareText.
  ///
  /// In en, this message translates to:
  /// **'Share text'**
  String get shareText;

  /// No description provided for @saveAsTxt.
  ///
  /// In en, this message translates to:
  /// **'Save as .txt'**
  String get saveAsTxt;

  /// No description provided for @readAgain.
  ///
  /// In en, this message translates to:
  /// **'Read again'**
  String get readAgain;

  /// No description provided for @readAsLatin.
  ///
  /// In en, this message translates to:
  /// **'Read as English / Latin'**
  String get readAsLatin;

  /// No description provided for @readAsDevanagari.
  ///
  /// In en, this message translates to:
  /// **'Read as Hindi / Nepali'**
  String get readAsDevanagari;

  /// No description provided for @ocrModelHint.
  ///
  /// In en, this message translates to:
  /// **'On Android the text model is downloaded once by Google Play services. If this is the first use, wait a minute and try again.'**
  String get ocrModelHint;

  /// No description provided for @noTextFound.
  ///
  /// In en, this message translates to:
  /// **'No text was found.'**
  String get noTextFound;

  /// No description provided for @pageSeparator.
  ///
  /// In en, this message translates to:
  /// **'--- Page {n} ---'**
  String pageSeparator(int n);

  /// No description provided for @scanner.
  ///
  /// In en, this message translates to:
  /// **'Scanner'**
  String get scanner;

  /// No description provided for @scanMode.
  ///
  /// In en, this message translates to:
  /// **'Scan mode'**
  String get scanMode;

  /// No description provided for @modeFull.
  ///
  /// In en, this message translates to:
  /// **'Full: filters + clean stains and fingers'**
  String get modeFull;

  /// No description provided for @modeFilter.
  ///
  /// In en, this message translates to:
  /// **'Filters only'**
  String get modeFilter;

  /// No description provided for @modeBase.
  ///
  /// In en, this message translates to:
  /// **'Basic: crop and rotate only'**
  String get modeBase;

  /// No description provided for @allowGallery.
  ///
  /// In en, this message translates to:
  /// **'Allow import from gallery'**
  String get allowGallery;

  /// No description provided for @allowGalleryHint.
  ///
  /// In en, this message translates to:
  /// **'Shows a gallery button inside the scanner'**
  String get allowGalleryHint;

  /// No description provided for @pagesPerScan.
  ///
  /// In en, this message translates to:
  /// **'Pages per scan'**
  String get pagesPerScan;

  /// No description provided for @iosScannerNote.
  ///
  /// In en, this message translates to:
  /// **'On iPhone the scanner is Apple\'s own document camera.'**
  String get iosScannerNote;

  /// No description provided for @iosScannerNote2.
  ///
  /// In en, this message translates to:
  /// **'Automatic capture, edge detection and colour modes are built in.'**
  String get iosScannerNote2;

  /// No description provided for @pdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// No description provided for @pageSize.
  ///
  /// In en, this message translates to:
  /// **'Page size'**
  String get pageSize;

  /// No description provided for @usLetter.
  ///
  /// In en, this message translates to:
  /// **'US Letter'**
  String get usLetter;

  /// No description provided for @fitScan.
  ///
  /// In en, this message translates to:
  /// **'Same shape as the scan'**
  String get fitScan;

  /// No description provided for @searchablePdf.
  ///
  /// In en, this message translates to:
  /// **'Searchable PDF'**
  String get searchablePdf;

  /// No description provided for @searchablePdfHint.
  ///
  /// In en, this message translates to:
  /// **'Adds an invisible text layer so the PDF can be searched and text copied'**
  String get searchablePdfHint;

  /// No description provided for @textRecognition.
  ///
  /// In en, this message translates to:
  /// **'Text recognition'**
  String get textRecognition;

  /// No description provided for @quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// No description provided for @qualityBest.
  ///
  /// In en, this message translates to:
  /// **'Best: full resolution, reads small print'**
  String get qualityBest;

  /// No description provided for @qualityFast.
  ///
  /// In en, this message translates to:
  /// **'Fast: smaller copy of the page'**
  String get qualityFast;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @scriptLatin.
  ///
  /// In en, this message translates to:
  /// **'English and other Latin-script languages'**
  String get scriptLatin;

  /// No description provided for @scriptDevanagari.
  ///
  /// In en, this message translates to:
  /// **'Hindi, Nepali, Marathi (+ Latin)'**
  String get scriptDevanagari;

  /// No description provided for @scriptChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese (+ Latin)'**
  String get scriptChinese;

  /// No description provided for @scriptJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese (+ Latin)'**
  String get scriptJapanese;

  /// No description provided for @scriptKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean (+ Latin)'**
  String get scriptKorean;

  /// No description provided for @readAsChinese.
  ///
  /// In en, this message translates to:
  /// **'Read as Chinese'**
  String get readAsChinese;

  /// No description provided for @readAsJapanese.
  ///
  /// In en, this message translates to:
  /// **'Read as Japanese'**
  String get readAsJapanese;

  /// No description provided for @readAsKorean.
  ///
  /// In en, this message translates to:
  /// **'Read as Korean'**
  String get readAsKorean;

  /// No description provided for @languageAuto.
  ///
  /// In en, this message translates to:
  /// **'The language is detected automatically.'**
  String get languageAuto;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow the phone'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutPromise.
  ///
  /// In en, this message translates to:
  /// **'No ads. No account. No tracking.'**
  String get aboutPromise;

  /// No description provided for @aboutPromiseBody.
  ///
  /// In en, this message translates to:
  /// **'Scans stay on this phone unless you share or export them. Uninstalling the app deletes them, so export what you want to keep.'**
  String get aboutPromiseBody;

  /// No description provided for @openSource.
  ///
  /// In en, this message translates to:
  /// **'Open source (Apache-2.0)'**
  String get openSource;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @opensInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Opens in your browser'**
  String get opensInBrowser;

  /// No description provided for @aboutTechAndroid.
  ///
  /// In en, this message translates to:
  /// **'Scanning and text recognition by Google ML Kit (on device). PDF merge by PDFBox-Android. Devanagari font: Noto (OFL).'**
  String get aboutTechAndroid;

  /// No description provided for @aboutTechIos.
  ///
  /// In en, this message translates to:
  /// **'Scanning by Apple VisionKit, text recognition by Apple Vision (on device). Devanagari font: Noto (OFL).'**
  String get aboutTechIos;

  /// No description provided for @couldNotOpenUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not open {url}'**
  String couldNotOpenUrl(String url);

  /// No description provided for @scanBusinessCard.
  ///
  /// In en, this message translates to:
  /// **'Scan a business card'**
  String get scanBusinessCard;

  /// No description provided for @saveAsContact.
  ///
  /// In en, this message translates to:
  /// **'Save as contact'**
  String get saveAsContact;

  /// No description provided for @saveToContacts.
  ///
  /// In en, this message translates to:
  /// **'Save to Contacts'**
  String get saveToContacts;

  /// Tick box on the business-card screen. On by default: the picture of the card goes to the contact. Someone short of space can turn it off.
  ///
  /// In en, this message translates to:
  /// **'Add the card photo'**
  String get includeCardPhoto;

  /// No description provided for @contactReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Business card'**
  String get contactReviewTitle;

  /// No description provided for @contactHint.
  ///
  /// In en, this message translates to:
  /// **'Check the fields, then save. Your phone\'s Contacts app opens with everything filled in.'**
  String get contactHint;

  /// No description provided for @readingCard.
  ///
  /// In en, this message translates to:
  /// **'Reading the card…'**
  String get readingCard;

  /// No description provided for @nothingRecognised.
  ///
  /// In en, this message translates to:
  /// **'No text was recognised on this card. You can still type the details.'**
  String get nothingRecognised;

  /// No description provided for @contactOpened.
  ///
  /// In en, this message translates to:
  /// **'Contacts opened. Tap Save there to keep it.'**
  String get contactOpened;

  /// No description provided for @couldNotOpenContacts.
  ///
  /// In en, this message translates to:
  /// **'Could not open Contacts: {error}'**
  String couldNotOpenContacts(String error);

  /// No description provided for @cardDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Card {stamp}'**
  String cardDefaultName(String stamp);

  /// No description provided for @fieldCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get fieldCompany;

  /// No description provided for @fieldJobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get fieldJobTitle;

  /// No description provided for @fieldMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get fieldMobile;

  /// No description provided for @fieldPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get fieldPhone;

  /// No description provided for @fieldFax.
  ///
  /// In en, this message translates to:
  /// **'Fax'**
  String get fieldFax;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get fieldWebsite;

  /// No description provided for @fieldAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get fieldAddress;

  /// No description provided for @fieldCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get fieldCity;

  /// No description provided for @fieldCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get fieldCountry;

  /// No description provided for @fieldNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get fieldNotes;

  /// No description provided for @drawFirst.
  ///
  /// In en, this message translates to:
  /// **'Draw your signature first.'**
  String get drawFirst;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @signHint.
  ///
  /// In en, this message translates to:
  /// **'Sign in the box with your finger. Turn the phone sideways for more room.'**
  String get signHint;

  /// No description provided for @thin.
  ///
  /// In en, this message translates to:
  /// **'Thin'**
  String get thin;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @thick.
  ///
  /// In en, this message translates to:
  /// **'Thick'**
  String get thick;

  /// No description provided for @couldNotReadPage.
  ///
  /// In en, this message translates to:
  /// **'Could not read the page: {error}'**
  String couldNotReadPage(String error);

  /// No description provided for @couldNotSign.
  ///
  /// In en, this message translates to:
  /// **'Could not sign: {error}'**
  String couldNotSign(String error);

  /// No description provided for @placeSignature.
  ///
  /// In en, this message translates to:
  /// **'Place signature'**
  String get placeSignature;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @dragPinchHint.
  ///
  /// In en, this message translates to:
  /// **'Drag to move. Pinch to resize.'**
  String get dragPinchHint;

  /// No description provided for @smaller.
  ///
  /// In en, this message translates to:
  /// **'Smaller'**
  String get smaller;

  /// No description provided for @larger.
  ///
  /// In en, this message translates to:
  /// **'Larger'**
  String get larger;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'am',
        'ar',
        'bn',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'es',
        'fa',
        'fi',
        'fil',
        'fr',
        'gu',
        'he',
        'hi',
        'hu',
        'id',
        'it',
        'ja',
        'kn',
        'ko',
        'ml',
        'mr',
        'ms',
        'nb',
        'ne',
        'nl',
        'pa',
        'pl',
        'pt',
        'ro',
        'ru',
        'si',
        'sv',
        'sw',
        'ta',
        'te',
        'th',
        'tr',
        'uk',
        'ur',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'ne':
      return AppLocalizationsNe();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'si':
      return AppLocalizationsSi();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
