// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => '스캔';

  @override
  String get cancel => '취소';

  @override
  String get ok => '확인';

  @override
  String get close => '닫기';

  @override
  String get delete => '삭제';

  @override
  String get share => '공유';

  @override
  String get copy => '복사';

  @override
  String get copied => '복사했습니다.';

  @override
  String get saved => '저장했습니다.';

  @override
  String get name => '이름';

  @override
  String get rename => '이름 변경';

  @override
  String get settings => '설정';

  @override
  String get dismiss => '닫기';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get cannotBeUndone => '이 작업은 실행취소할 수 없습니다.';

  @override
  String get savingPages => '페이지 저장 중…';

  @override
  String get preparingScanner =>
      '스캐너 준비 중…\n처음 사용 시 Google Play 서비스가 한 번 다운로드합니다.';

  @override
  String get scannerUnavailable => '스캐너를 사용할 수 없습니다.';

  @override
  String scannerUnavailableWith(String error) {
    return '스캐너를 사용할 수 없습니다: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return '페이지를 저장할 수 없습니다: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return '파일 선택기를 열 수 없습니다: $error';
  }

  @override
  String get importingPdf => 'PDF 가져오는 중…';

  @override
  String get importedPdf => '가져온 PDF';

  @override
  String couldNotImport(String error) {
    return '가져올 수 없습니다: $error';
  }

  @override
  String get pickTwoPdfs => 'PDF 파일을 2개 이상 선택하세요.';

  @override
  String mergingPdfs(int count) {
    return 'PDF 파일 $count개 병합 중…';
  }

  @override
  String mergedFileName(String stamp) {
    return '병합 $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return '병합할 수 없습니다: $error';
  }

  @override
  String get saveToFolder => '폴더에 저장';

  @override
  String couldNotSave(String error) {
    return '저장할 수 없습니다: $error';
  }

  @override
  String get mergedDocument => '병합된 문서';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first 외 $count개';
  }

  @override
  String get merging => '병합 중…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '문서 $count개를 삭제할까요?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDF 생성 중…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDF 생성 중 $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDF 생성 중, $n / $total 페이지';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDF를 생성할 수 없습니다: $error';
  }

  @override
  String get searchDocuments => '문서 검색';

  @override
  String get closeSearch => '검색 닫기';

  @override
  String get search => '검색';

  @override
  String get importPdfAsPages => 'PDF를 페이지로 가져오기';

  @override
  String get mergePdfFiles => 'PDF 파일 병합';

  @override
  String get clearSelection => '선택 해제';

  @override
  String nSelected(int count) {
    return '$count개 선택됨';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count개 선택됨 · 이 순서로 병합';
  }

  @override
  String get mergeIntoOne => '하나의 문서로 병합';

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
  String get shareAsPdf => 'PDF로 공유';

  @override
  String get selectAll => '전체 선택';

  @override
  String get noScansYet => '아직 스캔이 없습니다';

  @override
  String get nothingMatches => '일치하는 항목이 없습니다';

  @override
  String get emptyHint => '스캔을 탭하여 문서를 촬영하세요. 모든 내용은 이 휴대전화에만 저장됩니다.';

  @override
  String get tryAnotherWord => '다른 단어로 검색해 보세요.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count페이지',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return '스캔 $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO가 예기치 않게 종료되었습니다';

  @override
  String get crashBody =>
      '문제 보고서는 이 휴대전화에만 저장되었습니다. 개발자와 공유하면 문제 해결에 도움이 됩니다. 보고서에는 기술 정보만 포함되며 문서는 포함되지 않습니다.';

  @override
  String get reportCopied => '보고서를 복사했습니다.';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO 비정상 종료 보고서';

  @override
  String get pdfSaved => 'PDF를 저장했습니다.';

  @override
  String couldNotSavePdf(String error) {
    return 'PDF를 저장할 수 없습니다: $error';
  }

  @override
  String get exportPagesAsImages => '페이지를 이미지로 내보내기';

  @override
  String get saveToPhotos => '사진에 저장';

  @override
  String get savingToPhotos => '사진에 저장 중…';

  @override
  String get photosNeedsAndroid10 =>
      '사진에 저장하려면 Android 10 이상이 필요합니다. 대신 공유를 사용하세요.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO에 사진 추가 권한이 없습니다. 설정에서 허용하거나 공유를 사용하세요.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이미지 $count개를 사진에 저장했습니다.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return '내보낼 수 없습니다: $error';
  }

  @override
  String get deleteDocumentQuestion => '이 문서를 삭제할까요?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count페이지가 삭제됩니다. 이 작업은 실행취소할 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => '텍스트 (OCR)';

  @override
  String get sharePdf => 'PDF 공유';

  @override
  String get savePdfToFolder => 'PDF를 폴더에 저장';

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
  String get exportAsImages => 'JPEG / PNG로 내보내기';

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
  String get deleteDocument => '문서 삭제';

  @override
  String get noPages => '페이지가 없습니다. 페이지 추가를 탭하세요.';

  @override
  String get addPages => '페이지 추가';

  @override
  String get holdToReorder => '페이지를 길게 눌러 순서 변경';

  @override
  String get savePdfDialogTitle => 'PDF 저장';

  @override
  String get saveDialogTitle => '저장';

  @override
  String couldNotRotate(String error) {
    return '회전할 수 없습니다: $error';
  }

  @override
  String couldNotShare(String error) {
    return '공유할 수 없습니다: $error';
  }

  @override
  String get noTextOnPage => '이 페이지에서 텍스트를 찾을 수 없습니다.';

  @override
  String pageNText(int n) {
    return '$n페이지 텍스트';
  }

  @override
  String deletePageQuestion(int n) {
    return '$n페이지를 삭제할까요?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '$n / $total 페이지';
  }

  @override
  String get rotateLeft => '왼쪽으로 회전';

  @override
  String get rotateRight => '오른쪽으로 회전';

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
  String get undo => '실행취소';

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
  String get sign => '서명';

  @override
  String get copyText => '텍스트 복사';

  @override
  String get shareImage => '이미지 공유';

  @override
  String get deletePage => '페이지 삭제';

  @override
  String get signed => '서명했습니다.';

  @override
  String signPageN(int n) {
    return '$n페이지에 서명';
  }

  @override
  String get deleteThisSignature => '이 서명 삭제';

  @override
  String get newSignature => '새 서명';

  @override
  String readingPage(int n, int total) {
    return '페이지 인식 중 $n / $total';
  }

  @override
  String get ocrFailed => '텍스트 인식에 실패했습니다.';

  @override
  String ocrFailedWith(String error) {
    return '텍스트 인식에 실패했습니다: $error';
  }

  @override
  String get textSaved => '텍스트를 저장했습니다.';

  @override
  String get text => '텍스트';

  @override
  String get copyAll => '모두 복사';

  @override
  String get shareText => '텍스트 공유';

  @override
  String get saveAsTxt => '.txt로 저장';

  @override
  String get readAgain => '다시 인식';

  @override
  String get readAsLatin => '영어 / 라틴 문자로 인식';

  @override
  String get readAsDevanagari => '힌디어 / 네팔어로 인식';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Android에서는 Google Play 서비스가 텍스트 모델을 한 번 다운로드합니다. 처음 사용하는 경우 1분 정도 기다린 후 다시 시도하세요.';

  @override
  String get noTextFound => '텍스트를 찾을 수 없습니다.';

  @override
  String pageSeparator(int n) {
    return '--- $n페이지 ---';
  }

  @override
  String get scanner => '스캐너';

  @override
  String get scanMode => '스캔 모드';

  @override
  String get modeFull => '전체: 필터 + 얼룩 및 손가락 제거';

  @override
  String get modeFilter => '필터만';

  @override
  String get modeBase => '기본: 자르기 및 회전만';

  @override
  String get allowGallery => '갤러리에서 가져오기 허용';

  @override
  String get allowGalleryHint => '스캐너 안에 갤러리 버튼을 표시합니다';

  @override
  String get pagesPerScan => '스캔당 페이지 수';

  @override
  String get iosScannerNote => 'iPhone에서는 Apple의 자체 문서 카메라가 스캐너로 사용됩니다.';

  @override
  String get iosScannerNote2 => '자동 촬영, 가장자리 감지, 색상 모드가 기본 제공됩니다.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => '페이지 크기';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => '스캔과 같은 모양';

  @override
  String get searchablePdf => '검색 가능한 PDF';

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
      '보이지 않는 텍스트 레이어를 추가하여 PDF에서 검색하고 텍스트를 복사할 수 있게 합니다';

  @override
  String get textRecognition => '텍스트 인식';

  @override
  String get quality => '품질';

  @override
  String get qualityBest => '최고: 전체 해상도, 작은 글씨도 인식';

  @override
  String get qualityFast => '빠름: 페이지의 축소 사본';

  @override
  String get language => '언어';

  @override
  String get scriptLatin => '영어 및 기타 라틴 문자 언어';

  @override
  String get scriptDevanagari => '힌디어, 네팔어, 마라티어 (+ 라틴 문자)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => '중국어 (+ 라틴 문자)';

  @override
  String get scriptJapanese => '일본어 (+ 라틴 문자)';

  @override
  String get scriptKorean => '한국어 (+ 라틴 문자)';

  @override
  String get readAsChinese => '중국어로 인식';

  @override
  String get readAsJapanese => '일본어로 인식';

  @override
  String get readAsKorean => '한국어로 인식';

  @override
  String get languageAuto => '언어가 자동으로 감지됩니다.';

  @override
  String get appearance => '화면 모드';

  @override
  String get theme => '테마';

  @override
  String get themeSystem => '휴대전화 설정 따르기';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get about => '정보';

  @override
  String get aboutPromise => '광고 없음. 계정 불필요. 추적 없음.';

  @override
  String get aboutPromiseBody =>
      '스캔은 공유하거나 내보내지 않는 한 이 휴대전화에만 저장됩니다. 앱을 삭제하면 스캔도 삭제되므로 보관할 항목은 내보내세요.';

  @override
  String get openSource => '오픈소스 (Apache-2.0)';

  @override
  String get privacyPolicy => '개인정보처리방침';

  @override
  String get opensInBrowser => '브라우저에서 열립니다';

  @override
  String get aboutTechAndroid =>
      '스캔 및 텍스트 인식: Google ML Kit (기기에서 처리). PDF 병합: PDFBox-Android. 데바나가리 글꼴: Noto (OFL).';

  @override
  String get aboutTechIos =>
      '스캔: Apple VisionKit, 텍스트 인식: Apple Vision (기기에서 처리). 데바나가리 글꼴: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return '$url을(를) 열 수 없습니다';
  }

  @override
  String get scanBusinessCard => '명함 스캔';

  @override
  String get saveAsContact => '연락처로 저장';

  @override
  String get saveToContacts => '연락처에 저장';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => '명함';

  @override
  String get contactHint =>
      '항목을 확인한 후 저장하세요. 휴대전화의 연락처 앱이 모든 정보가 입력된 상태로 열립니다.';

  @override
  String get readingCard => '명함 인식 중…';

  @override
  String get nothingRecognised => '이 명함에서 텍스트를 인식하지 못했습니다. 직접 입력할 수도 있습니다.';

  @override
  String get contactOpened => '연락처가 열렸습니다. 유지하려면 거기에서 저장을 탭하세요.';

  @override
  String couldNotOpenContacts(String error) {
    return '연락처를 열 수 없습니다: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return '명함 $stamp';
  }

  @override
  String get fieldCompany => '회사';

  @override
  String get fieldJobTitle => '직책';

  @override
  String get fieldMobile => '휴대전화';

  @override
  String get fieldPhone => '전화';

  @override
  String get fieldFax => '팩스';

  @override
  String get fieldEmail => '이메일';

  @override
  String get fieldWebsite => '웹사이트';

  @override
  String get fieldAddress => '주소';

  @override
  String get fieldCity => '도시';

  @override
  String get fieldCountry => '국가';

  @override
  String get fieldNotes => '메모';

  @override
  String get drawFirst => '먼저 서명을 그리세요.';

  @override
  String get clear => '지우기';

  @override
  String get save => '저장';

  @override
  String get signHint => '손가락으로 상자 안에 서명하세요. 휴대전화를 가로로 돌리면 공간이 넓어집니다.';

  @override
  String get thin => '얇게';

  @override
  String get medium => '보통';

  @override
  String get thick => '굵게';

  @override
  String couldNotReadPage(String error) {
    return '페이지를 읽을 수 없습니다: $error';
  }

  @override
  String couldNotSign(String error) {
    return '서명할 수 없습니다: $error';
  }

  @override
  String get placeSignature => '서명 배치';

  @override
  String get apply => '적용';

  @override
  String get dragPinchHint => '드래그하여 이동. 두 손가락으로 크기 조절.';

  @override
  String get smaller => '작게';

  @override
  String get larger => '크게';
}
