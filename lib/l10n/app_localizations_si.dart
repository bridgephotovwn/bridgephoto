// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'ස්කෑන්';

  @override
  String get cancel => 'අවලංගු කරන්න';

  @override
  String get ok => 'හරි';

  @override
  String get close => 'වසන්න';

  @override
  String get delete => 'මකන්න';

  @override
  String get share => 'බෙදාගන්න';

  @override
  String get copy => 'පිටපත් කරන්න';

  @override
  String get copied => 'පිටපත් කළා.';

  @override
  String get saved => 'සුරැකුණා.';

  @override
  String get name => 'නම';

  @override
  String get rename => 'නම වෙනස් කරන්න';

  @override
  String get settings => 'සැකසුම්';

  @override
  String get dismiss => 'නොසලකා හරින්න';

  @override
  String get tryAgain => 'නැවත උත්සාහ කරන්න';

  @override
  String get cannotBeUndone => 'මෙය අහෝසි කළ නොහැක.';

  @override
  String get savingPages => 'පිටු සුරකිමින්…';

  @override
  String get preparingScanner =>
      'ස්කෑනරය සූදානම් කරමින්…\nපළමු වර: Google Play සේවා එය එක් වරක් බාගත කරයි.';

  @override
  String get scannerUnavailable => 'ස්කෑනරය නොමැත.';

  @override
  String scannerUnavailableWith(String error) {
    return 'ස්කෑනරය නොමැත: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'පිටු සුරැකීමට නොහැකි විය: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ගොනු තෝරකය විවෘත කිරීමට නොහැකි විය: $error';
  }

  @override
  String get importingPdf => 'PDF ආයාත කරමින්…';

  @override
  String get importedPdf => 'ආයාත කළ PDF';

  @override
  String couldNotImport(String error) {
    return 'ආයාත කිරීමට නොහැකි විය: $error';
  }

  @override
  String get pickTwoPdfs => 'අවම වශයෙන් PDF ගොනු දෙකක් තෝරන්න.';

  @override
  String mergingPdfs(int count) {
    return 'PDF ගොනු $countක් ඒකාබද්ධ කරමින්…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'ඒකාබද්ධ $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'ඒකාබද්ධ කිරීමට නොහැකි විය: $error';
  }

  @override
  String get saveToFolder => 'ෆෝල්ඩරයකට සුරකින්න';

  @override
  String couldNotSave(String error) {
    return 'සුරැකීමට නොහැකි විය: $error';
  }

  @override
  String get mergedDocument => 'ඒකාබද්ධ කළ ලේඛනය';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + තවත් $count';
  }

  @override
  String get merging => 'ඒකාබද්ධ කරමින්…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ලේඛන $countක් මකන්නද?',
      one: 'ලේඛන 1ක් මකන්නද?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF සාදමින්…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF සාදමින් $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF සාදමින්, පිටුව $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF සෑදීමට නොහැකි විය: $error';
  }

  @override
  String get searchDocuments => 'ලේඛන සොයන්න';

  @override
  String get closeSearch => 'සෙවීම වසන්න';

  @override
  String get search => 'සොයන්න';

  @override
  String get importPdfAsPages => 'PDF පිටු ලෙස ආයාත කරන්න';

  @override
  String get mergePdfFiles => 'PDF ගොනු ඒකාබද්ධ කරන්න';

  @override
  String get clearSelection => 'තේරීම ඉවත් කරන්න';

  @override
  String nSelected(int count) {
    return '$countක් තෝරා ඇත';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$countක් තෝරා ඇත · මෙම අනුපිළිවෙළින් ඒකාබද්ධ වේ';
  }

  @override
  String get mergeIntoOne => 'එක් ලේඛනයකට ඒකාබද්ධ කරන්න';

  @override
  String get shareAsPdf => 'PDF ලෙස බෙදාගන්න';

  @override
  String get selectAll => 'සියල්ල තෝරන්න';

  @override
  String get noScansYet => 'තවම ස්කෑන් නැත';

  @override
  String get nothingMatches => 'කිසිවක් ගැළපෙන්නේ නැත';

  @override
  String get emptyHint =>
      'ලේඛනයක ඡායාරූපයක් ගැනීමට ස්කෑන් තට්ටු කරන්න. සියල්ල මෙම දුරකථනයේම පවතී.';

  @override
  String get tryAnotherWord => 'වෙනත් වචනයක් උත්සාහ කරන්න.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පිටු $count',
      one: 'පිටු 1',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'ස්කෑන් $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO අනපේක්ෂිතව වැසුණා';

  @override
  String get crashBody =>
      'වැරදුණේ කුමක්ද යන්න පිළිබඳ වාර්තාවක් මෙම දුරකථනයේ පමණක් සුරැකුණා. එය සංවර්ධකයා සමඟ බෙදාගැනීම ගැටලුව විසඳීමට උපකාරී වේ. එහි ඇත්තේ තාක්ෂණික විස්තර පමණි, ඔබේ ලේඛන නොවේ.';

  @override
  String get reportCopied => 'වාර්තාව පිටපත් කළා.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO බිඳවැටීම් වාර්තාව';

  @override
  String get pdfSaved => 'PDF සුරැකුණා.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF සුරැකීමට නොහැකි විය: $error';
  }

  @override
  String get exportPagesAsImages => 'පිටු රූප ලෙස නිර්යාත කරන්න';

  @override
  String get saveToPhotos => 'ඡායාරූප වෙත සුරකින්න';

  @override
  String get savingToPhotos => 'ඡායාරූප වෙත සුරකිමින්…';

  @override
  String get photosNeedsAndroid10 =>
      'ඡායාරූප වෙත සුරැකීමට Android 10 හෝ ඊට අලුත් අවශ්‍යයි. ඒ වෙනුවට බෙදාගන්න භාවිතා කරන්න.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO හට ඡායාරූප වෙත එක් කිරීමට අවසර නැත. සැකසුම් තුළ අවසර දෙන්න, නැතහොත් බෙදාගන්න භාවිතා කරන්න.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'රූප $countක් ඡායාරූප වෙත සුරැකුණා.',
      one: 'රූප 1ක් ඡායාරූප වෙත සුරැකුණා.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'නිර්යාත කිරීමට නොහැකි විය: $error';
  }

  @override
  String get deleteDocumentQuestion => 'මෙම ලේඛනය මකන්නද?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පිටු $countක් මැකෙනු ඇත. මෙය අහෝසි කළ නොහැක.',
      one: 'පිටු 1ක් මැකෙනු ඇත. මෙය අහෝසි කළ නොහැක.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'පෙළ (OCR)';

  @override
  String get sharePdf => 'PDF බෙදාගන්න';

  @override
  String get savePdfToFolder => 'PDF ෆෝල්ඩරයකට සුරකින්න';

  @override
  String get exportAsImages => 'JPEG / PNG ලෙස නිර්යාත කරන්න';

  @override
  String get deleteDocument => 'ලේඛනය මකන්න';

  @override
  String get noPages => 'පිටු නැත. පිටු එක් කරන්න තට්ටු කරන්න.';

  @override
  String get addPages => 'පිටු එක් කරන්න';

  @override
  String get holdToReorder =>
      'අනුපිළිවෙළ වෙනස් කිරීමට පිටුවක් අල්ලාගෙන සිටින්න';

  @override
  String get savePdfDialogTitle => 'PDF සුරකින්න';

  @override
  String get saveDialogTitle => 'සුරකින්න';

  @override
  String couldNotRotate(String error) {
    return 'කරකැවීමට නොහැකි විය: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'බෙදාගැනීමට නොහැකි විය: $error';
  }

  @override
  String get noTextOnPage => 'මෙම පිටුවේ පෙළක් හමු නොවීය.';

  @override
  String pageNText(int n) {
    return 'පිටුව $n පෙළ';
  }

  @override
  String deletePageQuestion(int n) {
    return 'පිටුව $n මකන්නද?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$totalන් පිටුව $n';
  }

  @override
  String get rotateLeft => 'වමට කරකවන්න';

  @override
  String get rotateRight => 'දකුණට කරකවන්න';

  @override
  String get sign => 'අත්සන';

  @override
  String get copyText => 'පෙළ පිටපත් කරන්න';

  @override
  String get shareImage => 'රූපය බෙදාගන්න';

  @override
  String get deletePage => 'පිටුව මකන්න';

  @override
  String get signed => 'අත්සන් කළා.';

  @override
  String signPageN(int n) {
    return 'පිටුව $n අත්සන් කරන්න';
  }

  @override
  String get deleteThisSignature => 'මෙම අත්සන මකන්න';

  @override
  String get newSignature => 'නව අත්සන';

  @override
  String readingPage(int n, int total) {
    return 'පිටුව $n / $total කියවමින්';
  }

  @override
  String get ocrFailed => 'පෙළ හඳුනාගැනීම අසාර්ථක විය.';

  @override
  String ocrFailedWith(String error) {
    return 'පෙළ හඳුනාගැනීම අසාර්ථක විය: $error';
  }

  @override
  String get textSaved => 'පෙළ සුරැකුණා.';

  @override
  String get text => 'පෙළ';

  @override
  String get copyAll => 'සියල්ල පිටපත් කරන්න';

  @override
  String get shareText => 'පෙළ බෙදාගන්න';

  @override
  String get saveAsTxt => '.txt ලෙස සුරකින්න';

  @override
  String get readAgain => 'නැවත කියවන්න';

  @override
  String get readAsLatin => 'ඉංග්‍රීසි / ලතින් ලෙස කියවන්න';

  @override
  String get readAsDevanagari => 'හින්දි / නේපාලි ලෙස කියවන්න';

  @override
  String get ocrModelHint =>
      'Android හි පෙළ ආකෘතිය Google Play සේවා විසින් එක් වරක් බාගත කෙරේ. මෙය පළමු භාවිතය නම්, විනාඩියක් රැඳී සිට නැවත උත්සාහ කරන්න.';

  @override
  String get noTextFound => 'පෙළක් හමු නොවීය.';

  @override
  String pageSeparator(int n) {
    return '--- පිටුව $n ---';
  }

  @override
  String get scanner => 'ස්කෑනරය';

  @override
  String get scanMode => 'ස්කෑන් ප්‍රකාරය';

  @override
  String get modeFull => 'සම්පූර්ණ: පෙරහන් + පැල්ලම් සහ ඇඟිලි ඉවත් කිරීම';

  @override
  String get modeFilter => 'පෙරහන් පමණි';

  @override
  String get modeBase => 'මූලික: කප්පාදු සහ කරකැවීම පමණි';

  @override
  String get allowGallery => 'ගැලරියෙන් ආයාත කිරීමට ඉඩ දෙන්න';

  @override
  String get allowGalleryHint => 'ස්කෑනරය තුළ ගැලරි බොත්තමක් පෙන්වයි';

  @override
  String get pagesPerScan => 'එක් ස්කෑනයකට පිටු';

  @override
  String get iosScannerNote =>
      'iPhone හි ස්කෑනරය යනු Apple හි ම ලේඛන කැමරාවයි.';

  @override
  String get iosScannerNote2 =>
      'ස්වයංක්‍රීය ග්‍රහණය, දාර හඳුනාගැනීම සහ වර්ණ ප්‍රකාර එහි ඇතුළත් වේ.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'පිටු ප්‍රමාණය';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'ස්කෑනයේ හැඩයම';

  @override
  String get searchablePdf => 'සෙවිය හැකි PDF';

  @override
  String get searchablePdfHint =>
      'PDF තුළ සෙවීමට සහ පෙළ පිටපත් කිරීමට නොපෙනෙන පෙළ ස්තරයක් එක් කරයි';

  @override
  String get textRecognition => 'පෙළ හඳුනාගැනීම';

  @override
  String get quality => 'ගුණත්වය';

  @override
  String get qualityBest => 'හොඳම: සම්පූර්ණ විභේදනය, කුඩා අකුරු ද කියවයි';

  @override
  String get qualityFast => 'වේගවත්: පිටුවේ කුඩා පිටපතක්';

  @override
  String get language => 'භාෂාව';

  @override
  String get scriptLatin => 'ඉංග්‍රීසි සහ අනෙකුත් ලතින් අකුරු භාෂා';

  @override
  String get scriptDevanagari => 'හින්දි, නේපාලි, මරාති (+ ලතින්)';

  @override
  String get scriptChinese => 'චීන (+ ලතින්)';

  @override
  String get scriptJapanese => 'ජපන් (+ ලතින්)';

  @override
  String get scriptKorean => 'කොරියානු (+ ලතින්)';

  @override
  String get readAsChinese => 'චීන ලෙස කියවන්න';

  @override
  String get readAsJapanese => 'ජපන් ලෙස කියවන්න';

  @override
  String get readAsKorean => 'කොරියානු ලෙස කියවන්න';

  @override
  String get languageAuto => 'භාෂාව ස්වයංක්‍රීයව හඳුනාගැනේ.';

  @override
  String get appearance => 'පෙනුම';

  @override
  String get theme => 'තේමාව';

  @override
  String get themeSystem => 'දුරකථනය අනුව';

  @override
  String get themeLight => 'ලා';

  @override
  String get themeDark => 'අඳුරු';

  @override
  String get about => 'පිළිබඳව';

  @override
  String get aboutPromise => 'දැන්වීම් නැත. ගිණුමක් නැත. ලුහුබැඳීමක් නැත.';

  @override
  String get aboutPromiseBody =>
      'ඔබ බෙදාගන්නා හෝ නිර්යාත කරන තුරු ස්කෑන් මෙම දුරකථනයේම පවතී. යෙදුම අස්ථාපනය කිරීමෙන් ඒවා මැකේ, එබැවින් තබාගැනීමට අවශ්‍ය දේ නිර්යාත කරන්න.';

  @override
  String get openSource => 'විවෘත මූලාශ්‍ර (Apache-2.0)';

  @override
  String get privacyPolicy => 'රහස්‍යතා ප්‍රතිපත්තිය';

  @override
  String get opensInBrowser => 'ඔබේ බ්‍රව්සරයේ විවෘත වේ';

  @override
  String get aboutTechAndroid =>
      'ස්කෑන් කිරීම සහ පෙළ හඳුනාගැනීම Google ML Kit මගින් (උපාංගයේම). PDF ඒකාබද්ධ කිරීම PDFBox-Android මගින්. දේවනාගරී අකුරු: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'ස්කෑන් කිරීම Apple VisionKit මගින්, පෙළ හඳුනාගැනීම Apple Vision මගින් (උපාංගයේම). දේවනාගරී අකුරු: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url විවෘත කිරීමට නොහැකි විය';
  }

  @override
  String get scanBusinessCard => 'ව්‍යාපාරික කාඩ්පතක් ස්කෑන් කරන්න';

  @override
  String get saveAsContact => 'සම්බන්ධතාවක් ලෙස සුරකින්න';

  @override
  String get saveToContacts => 'සම්බන්ධතා වෙත සුරකින්න';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'ව්‍යාපාරික කාඩ්පත';

  @override
  String get contactHint =>
      'ක්ෂේත්‍ර පරීක්ෂා කර, පසුව සුරකින්න. ඔබේ දුරකථනයේ සම්බන්ධතා යෙදුම සියල්ල පුරවා විවෘත වේ.';

  @override
  String get readingCard => 'කාඩ්පත කියවමින්…';

  @override
  String get nothingRecognised =>
      'මෙම කාඩ්පතේ පෙළක් හඳුනා නොගැනිණි. ඔබට තවමත් විස්තර ටයිප් කළ හැකිය.';

  @override
  String get contactOpened =>
      'සම්බන්ධතා විවෘත විය. තබා ගැනීමට එහි සුරකින්න තට්ටු කරන්න.';

  @override
  String couldNotOpenContacts(String error) {
    return 'සම්බන්ධතා විවෘත කිරීමට නොහැකි විය: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'කාඩ්පත $stamp';
  }

  @override
  String get fieldCompany => 'සමාගම';

  @override
  String get fieldJobTitle => 'තනතුර';

  @override
  String get fieldMobile => 'ජංගම';

  @override
  String get fieldPhone => 'දුරකථනය';

  @override
  String get fieldFax => 'ෆැක්ස්';

  @override
  String get fieldEmail => 'ඊමේල්';

  @override
  String get fieldWebsite => 'වෙබ් අඩවිය';

  @override
  String get fieldAddress => 'ලිපිනය';

  @override
  String get fieldCity => 'නගරය';

  @override
  String get fieldCountry => 'රට';

  @override
  String get fieldNotes => 'සටහන්';

  @override
  String get drawFirst => 'පළමුව ඔබේ අත්සන අඳින්න.';

  @override
  String get clear => 'හිස් කරන්න';

  @override
  String get undo => 'අහෝසි කරන්න';

  @override
  String get save => 'සුරකින්න';

  @override
  String get signHint =>
      'කොටුව තුළ ඇඟිල්ලෙන් අත්සන් කරන්න. වැඩි ඉඩක් සඳහා දුරකථනය පැත්තට හරවන්න.';

  @override
  String get thin => 'සිහින්';

  @override
  String get medium => 'මධ්‍යම';

  @override
  String get thick => 'ඝන';

  @override
  String couldNotReadPage(String error) {
    return 'පිටුව කියවීමට නොහැකි විය: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'අත්සන් කිරීමට නොහැකි විය: $error';
  }

  @override
  String get placeSignature => 'අත්සන තබන්න';

  @override
  String get apply => 'යොදන්න';

  @override
  String get dragPinchHint =>
      'ගෙනයාමට අදින්න. ප්‍රමාණය වෙනස් කිරීමට ඇඟිලි දෙකෙන් අදින්න.';

  @override
  String get smaller => 'කුඩා';

  @override
  String get larger => 'විශාල';
}
