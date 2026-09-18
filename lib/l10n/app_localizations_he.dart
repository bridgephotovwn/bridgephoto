// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'סריקה';

  @override
  String get cancel => 'ביטול';

  @override
  String get ok => 'אישור';

  @override
  String get close => 'סגירה';

  @override
  String get delete => 'מחיקה';

  @override
  String get share => 'שיתוף';

  @override
  String get copy => 'העתקה';

  @override
  String get copied => 'הועתק.';

  @override
  String get saved => 'נשמר.';

  @override
  String get name => 'שם';

  @override
  String get rename => 'שינוי שם';

  @override
  String get settings => 'הגדרות';

  @override
  String get dismiss => 'הסתרה';

  @override
  String get tryAgain => 'ניסיון נוסף';

  @override
  String get cannotBeUndone => 'לא ניתן לבטל פעולה זו.';

  @override
  String get savingPages => 'שומר עמודים…';

  @override
  String get preparingScanner =>
      'מכין את הסורק…\nבשימוש הראשון, שירותי Google Play מורידים אותו פעם אחת.';

  @override
  String get scannerUnavailable => 'הסורק אינו זמין.';

  @override
  String scannerUnavailableWith(String error) {
    return 'הסורק אינו זמין: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'לא ניתן היה לשמור את העמודים: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'לא ניתן היה לפתוח את בורר הקבצים: $error';
  }

  @override
  String get importingPdf => 'מייבא PDF…';

  @override
  String get importedPdf => 'PDF מיובא';

  @override
  String couldNotImport(String error) {
    return 'הייבוא נכשל: $error';
  }

  @override
  String get pickTwoPdfs => 'יש לבחור לפחות שני קובצי PDF.';

  @override
  String mergingPdfs(int count) {
    return 'ממזג $count קובצי PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ממוזג $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'המיזוג נכשל: $error';
  }

  @override
  String get saveToFolder => 'שמירה לתיקייה';

  @override
  String couldNotSave(String error) {
    return 'השמירה נכשלה: $error';
  }

  @override
  String get mergedDocument => 'מסמך ממוזג';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count נוספים';
  }

  @override
  String get merging => 'ממזג…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'למחוק $count מסמכים?',
      two: 'למחוק שני מסמכים?',
      one: 'למחוק מסמך אחד?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'בונה PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'בונה PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'בונה PDF, עמוד $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'לא ניתן היה לבנות את ה-PDF: $error';
  }

  @override
  String get searchDocuments => 'חיפוש מסמכים';

  @override
  String get closeSearch => 'סגירת החיפוש';

  @override
  String get search => 'חיפוש';

  @override
  String get importPdfAsPages => 'ייבוא PDF כעמודים';

  @override
  String get mergePdfFiles => 'מיזוג קובצי PDF';

  @override
  String get clearSelection => 'ניקוי הבחירה';

  @override
  String nSelected(int count) {
    return '$count נבחרו';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count נבחרו · מיזוג בסדר הזה';
  }

  @override
  String get mergeIntoOne => 'מיזוג למסמך אחד';

  @override
  String get shareAsPdf => 'שיתוף כ-PDF';

  @override
  String get selectAll => 'בחירת הכול';

  @override
  String get noScansYet => 'אין סריקות עדיין';

  @override
  String get nothingMatches => 'אין תוצאות';

  @override
  String get emptyHint =>
      'הקישו על „סריקה” כדי לצלם מסמך. הכול נשאר בטלפון הזה.';

  @override
  String get tryAnotherWord => 'נסו מילה אחרת.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count עמודים',
      two: 'שני עמודים',
      one: 'עמוד אחד',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'סריקה $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO נסגר באופן בלתי צפוי';

  @override
  String get crashBody =>
      'דוח על מה שהשתבש נשמר בטלפון הזה בלבד. שיתופו עם המפתח עוזר לתקן את הבעיה. הוא מכיל פרטים טכניים, לא את המסמכים שלכם.';

  @override
  String get reportCopied => 'הדוח הועתק.';

  @override
  String get crashReportSubject => 'דוח קריסה של BRIDGE PHOTO';

  @override
  String get pdfSaved => 'ה-PDF נשמר.';

  @override
  String couldNotSavePdf(String error) {
    return 'לא ניתן היה לשמור את ה-PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'ייצוא עמודים כתמונות';

  @override
  String get saveToPhotos => 'שמירה בתמונות';

  @override
  String get savingToPhotos => 'שומר בתמונות…';

  @override
  String get photosNeedsAndroid10 =>
      'שמירה בתמונות דורשת Android 10 ומעלה. השתמשו בשיתוף במקום.';

  @override
  String get photosNotAllowed =>
      'ל-BRIDGE PHOTO אין הרשאה להוסיף לתמונות. אפשרו זאת בהגדרות, או השתמשו בשיתוף.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות נשמרו בתמונות.',
      two: 'שתי תמונות נשמרו בתמונות.',
      one: 'תמונה אחת נשמרה בתמונות.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'הייצוא נכשל: $error';
  }

  @override
  String get deleteDocumentQuestion => 'למחוק את המסמך הזה?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count עמודים יימחקו. לא ניתן לבטל פעולה זו.',
      two: 'שני עמודים יימחקו. לא ניתן לבטל פעולה זו.',
      one: 'עמוד אחד יימחק. לא ניתן לבטל פעולה זו.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'טקסט (OCR)';

  @override
  String get sharePdf => 'שיתוף PDF';

  @override
  String get savePdfToFolder => 'שמירת PDF לתיקייה';

  @override
  String get exportAsImages => 'ייצוא כ-JPEG / PNG';

  @override
  String get deleteDocument => 'מחיקת מסמך';

  @override
  String get noPages => 'אין עמודים. הקישו על „הוספת עמודים”.';

  @override
  String get addPages => 'הוספת עמודים';

  @override
  String get holdToReorder => 'לחיצה ארוכה על עמוד לשינוי הסדר';

  @override
  String get savePdfDialogTitle => 'שמירת PDF';

  @override
  String get saveDialogTitle => 'שמירה';

  @override
  String couldNotRotate(String error) {
    return 'הסיבוב נכשל: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'השיתוף נכשל: $error';
  }

  @override
  String get noTextOnPage => 'לא נמצא טקסט בעמוד זה.';

  @override
  String pageNText(int n) {
    return 'טקסט עמוד $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'למחוק את עמוד $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'עמוד $n מתוך $total';
  }

  @override
  String get rotateLeft => 'סיבוב שמאלה';

  @override
  String get rotateRight => 'סיבוב ימינה';

  @override
  String get sign => 'חתימה';

  @override
  String get copyText => 'העתקת טקסט';

  @override
  String get shareImage => 'שיתוף תמונה';

  @override
  String get deletePage => 'מחיקת עמוד';

  @override
  String get signed => 'נחתם.';

  @override
  String signPageN(int n) {
    return 'חתימה על עמוד $n';
  }

  @override
  String get deleteThisSignature => 'מחיקת חתימה זו';

  @override
  String get newSignature => 'חתימה חדשה';

  @override
  String readingPage(int n, int total) {
    return 'קורא עמוד $n / $total';
  }

  @override
  String get ocrFailed => 'זיהוי הטקסט נכשל.';

  @override
  String ocrFailedWith(String error) {
    return 'זיהוי הטקסט נכשל: $error';
  }

  @override
  String get textSaved => 'הטקסט נשמר.';

  @override
  String get text => 'טקסט';

  @override
  String get copyAll => 'העתקת הכול';

  @override
  String get shareText => 'שיתוף טקסט';

  @override
  String get saveAsTxt => 'שמירה כ-‎.txt';

  @override
  String get readAgain => 'קריאה מחדש';

  @override
  String get readAsLatin => 'קריאה כאנגלית / לטינית';

  @override
  String get readAsDevanagari => 'קריאה כהינדי / נפאלית';

  @override
  String get ocrModelHint =>
      'ב-Android מודל הטקסט מורד פעם אחת על ידי שירותי Google Play. אם זהו השימוש הראשון, המתינו דקה ונסו שוב.';

  @override
  String get noTextFound => 'לא נמצא טקסט.';

  @override
  String pageSeparator(int n) {
    return '--- עמוד $n ---';
  }

  @override
  String get scanner => 'סורק';

  @override
  String get scanMode => 'מצב סריקה';

  @override
  String get modeFull => 'מלא: מסננים + ניקוי כתמים ואצבעות';

  @override
  String get modeFilter => 'מסננים בלבד';

  @override
  String get modeBase => 'בסיסי: חיתוך וסיבוב בלבד';

  @override
  String get allowGallery => 'אפשר ייבוא מהגלריה';

  @override
  String get allowGalleryHint => 'מציג כפתור גלריה בתוך הסורק';

  @override
  String get pagesPerScan => 'עמודים לסריקה';

  @override
  String get iosScannerNote => 'ב-iPhone הסורק הוא מצלמת המסמכים של Apple.';

  @override
  String get iosScannerNote2 =>
      'צילום אוטומטי, זיהוי קצוות ומצבי צבע מובנים בו.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'גודל עמוד';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'באותה צורה כמו הסריקה';

  @override
  String get searchablePdf => 'PDF בר-חיפוש';

  @override
  String get searchablePdfHint =>
      'מוסיף שכבת טקסט בלתי נראית כדי שניתן יהיה לחפש ב-PDF ולהעתיק טקסט';

  @override
  String get textRecognition => 'זיהוי טקסט';

  @override
  String get quality => 'איכות';

  @override
  String get qualityBest => 'מיטבית: רזולוציה מלאה, קוראת אותיות קטנות';

  @override
  String get qualityFast => 'מהירה: עותק קטן יותר של העמוד';

  @override
  String get language => 'שפה';

  @override
  String get scriptLatin => 'אנגלית ושפות אחרות בכתב לטיני';

  @override
  String get scriptDevanagari => 'הינדי, נפאלית, מראטהי (+ לטינית)';

  @override
  String get scriptChinese => 'סינית (+ לטינית)';

  @override
  String get scriptJapanese => 'יפנית (+ לטינית)';

  @override
  String get scriptKorean => 'קוריאנית (+ לטינית)';

  @override
  String get readAsChinese => 'קריאה כסינית';

  @override
  String get readAsJapanese => 'קריאה כיפנית';

  @override
  String get readAsKorean => 'קריאה כקוריאנית';

  @override
  String get languageAuto => 'השפה מזוהה אוטומטית.';

  @override
  String get appearance => 'מראה';

  @override
  String get theme => 'ערכת נושא';

  @override
  String get themeSystem => 'לפי הטלפון';

  @override
  String get themeLight => 'בהיר';

  @override
  String get themeDark => 'כהה';

  @override
  String get about => 'אודות';

  @override
  String get aboutPromise => 'בלי פרסומות. בלי חשבון. בלי מעקב.';

  @override
  String get aboutPromiseBody =>
      'הסריקות נשארות בטלפון הזה אלא אם תשתפו או תייצאו אותן. הסרת האפליקציה מוחקת אותן, לכן ייצאו את מה שתרצו לשמור.';

  @override
  String get openSource => 'קוד פתוח (Apache-2.0)';

  @override
  String get privacyPolicy => 'מדיניות פרטיות';

  @override
  String get opensInBrowser => 'נפתח בדפדפן';

  @override
  String get aboutTechAndroid =>
      'סריקה וזיהוי טקסט באמצעות Google ML Kit (במכשיר). מיזוג PDF באמצעות PDFBox-Android. גופן דוונגרי: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'סריקה באמצעות Apple VisionKit, זיהוי טקסט באמצעות Apple Vision (במכשיר). גופן דוונגרי: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'לא ניתן היה לפתוח את $url';
  }

  @override
  String get drawFirst => 'ציירו קודם את החתימה שלכם.';

  @override
  String get clear => 'ניקוי';

  @override
  String get undo => 'ביטול פעולה';

  @override
  String get save => 'שמירה';

  @override
  String get signHint =>
      'חתמו בתיבה עם האצבע. סובבו את הטלפון לרוחב למקום נוסף.';

  @override
  String get thin => 'דק';

  @override
  String get medium => 'בינוני';

  @override
  String get thick => 'עבה';

  @override
  String couldNotReadPage(String error) {
    return 'לא ניתן היה לקרוא את העמוד: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'החתימה נכשלה: $error';
  }

  @override
  String get placeSignature => 'מיקום החתימה';

  @override
  String get apply => 'החלה';

  @override
  String get dragPinchHint => 'גררו להזזה. צבטו לשינוי גודל.';

  @override
  String get smaller => 'קטן יותר';

  @override
  String get larger => 'גדול יותר';
}
