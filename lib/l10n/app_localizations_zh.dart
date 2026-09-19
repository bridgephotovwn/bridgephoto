// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => '扫描';

  @override
  String get cancel => '取消';

  @override
  String get ok => '确定';

  @override
  String get close => '关闭';

  @override
  String get delete => '删除';

  @override
  String get share => '分享';

  @override
  String get copy => '复制';

  @override
  String get copied => '已复制。';

  @override
  String get saved => '已保存。';

  @override
  String get name => '名称';

  @override
  String get rename => '重命名';

  @override
  String get settings => '设置';

  @override
  String get dismiss => '关闭';

  @override
  String get tryAgain => '重试';

  @override
  String get cannotBeUndone => '此操作无法撤销。';

  @override
  String get savingPages => '正在保存页面…';

  @override
  String get preparingScanner => '正在准备扫描器…\n首次使用时，Google Play 服务会下载一次。';

  @override
  String get scannerUnavailable => '扫描器不可用。';

  @override
  String scannerUnavailableWith(String error) {
    return '扫描器不可用：$error';
  }

  @override
  String couldNotSavePages(String error) {
    return '无法保存页面：$error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return '无法打开文件选择器：$error';
  }

  @override
  String get importingPdf => '正在导入 PDF…';

  @override
  String get importedPdf => '已导入的 PDF';

  @override
  String couldNotImport(String error) {
    return '无法导入：$error';
  }

  @override
  String get pickTwoPdfs => '请至少选择两个 PDF 文件。';

  @override
  String mergingPdfs(int count) {
    return '正在合并 $count 个 PDF 文件…';
  }

  @override
  String mergedFileName(String stamp) {
    return '合并 $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return '无法合并：$error';
  }

  @override
  String get saveToFolder => '保存到文件夹';

  @override
  String couldNotSave(String error) {
    return '无法保存：$error';
  }

  @override
  String get mergedDocument => '合并的文档';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + 另外 $count 个';
  }

  @override
  String get merging => '正在合并…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '要删除 $count 个文档吗？',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => '正在生成 PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return '正在生成 PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return '正在生成 PDF，第 $n / $total 页';
  }

  @override
  String couldNotBuildPdf(String error) {
    return '无法生成 PDF：$error';
  }

  @override
  String get searchDocuments => '搜索文档';

  @override
  String get closeSearch => '关闭搜索';

  @override
  String get search => '搜索';

  @override
  String get importPdfAsPages => '将 PDF 导入为页面';

  @override
  String get mergePdfFiles => '合并 PDF 文件';

  @override
  String get clearSelection => '清除选择';

  @override
  String nSelected(int count) {
    return '已选择 $count 项';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '已选择 $count 项 · 按此顺序合并';
  }

  @override
  String get mergeIntoOne => '合并为一个文档';

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
  String get shareAsPdf => '以 PDF 形式分享';

  @override
  String get selectAll => '全选';

  @override
  String get noScansYet => '暂无扫描件';

  @override
  String get nothingMatches => '没有匹配的结果';

  @override
  String get emptyHint => '点按“扫描”即可拍摄文档。所有内容都只保存在这部手机上。';

  @override
  String get tryAnotherWord => '请尝试其他词语。';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 页',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return '扫描 $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO 意外关闭';

  @override
  String get crashBody => '问题报告仅保存在这部手机上。将其分享给开发者有助于修复问题。报告只包含技术详情，不包含您的文档。';

  @override
  String get reportCopied => '报告已复制。';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO 崩溃报告';

  @override
  String get pdfSaved => 'PDF 已保存。';

  @override
  String couldNotSavePdf(String error) {
    return '无法保存 PDF：$error';
  }

  @override
  String get exportPagesAsImages => '将页面导出为图片';

  @override
  String get saveToPhotos => '保存到照片';

  @override
  String get savingToPhotos => '正在保存到照片…';

  @override
  String get photosNeedsAndroid10 => '保存到照片需要 Android 10 或更高版本。请改用“分享”。';

  @override
  String get photosNotAllowed => 'BRIDGE PHOTO 无权添加到照片。请在“设置”中允许，或改用“分享”。';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 张图片保存到照片。',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return '无法导出：$error';
  }

  @override
  String get deleteDocumentQuestion => '要删除此文档吗？';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将删除 $count 页。此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => '文字 (OCR)';

  @override
  String get sharePdf => '分享 PDF';

  @override
  String get savePdfToFolder => '将 PDF 保存到文件夹';

  @override
  String get tidyPagesTitle => 'Find blank and repeated pages';

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
  String get exportAsImages => '导出为 JPEG / PNG';

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
  String get deleteDocument => '删除文档';

  @override
  String get noPages => '没有页面。请点按“添加页面”。';

  @override
  String get addPages => '添加页面';

  @override
  String get holdToReorder => '长按页面可调整顺序';

  @override
  String get savePdfDialogTitle => '保存 PDF';

  @override
  String get saveDialogTitle => '保存';

  @override
  String couldNotRotate(String error) {
    return '无法旋转：$error';
  }

  @override
  String couldNotShare(String error) {
    return '无法分享：$error';
  }

  @override
  String get noTextOnPage => '此页面上未找到文字。';

  @override
  String pageNText(int n) {
    return '第 $n 页文字';
  }

  @override
  String deletePageQuestion(int n) {
    return '要删除第 $n 页吗？';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '第 $n 页，共 $total 页';
  }

  @override
  String get rotateLeft => '向左旋转';

  @override
  String get rotateRight => '向右旋转';

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
  String get undo => '撤销';

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
  String get sign => '签名';

  @override
  String get copyText => '复制文字';

  @override
  String get shareImage => '分享图片';

  @override
  String get deletePage => '删除页面';

  @override
  String get signed => '已签名。';

  @override
  String signPageN(int n) {
    return '在第 $n 页签名';
  }

  @override
  String get deleteThisSignature => '删除此签名';

  @override
  String get newSignature => '新签名';

  @override
  String readingPage(int n, int total) {
    return '正在识别第 $n / $total 页';
  }

  @override
  String get ocrFailed => '文字识别失败。';

  @override
  String ocrFailedWith(String error) {
    return '文字识别失败：$error';
  }

  @override
  String get textSaved => '文字已保存。';

  @override
  String get text => '文字';

  @override
  String get copyAll => '全部复制';

  @override
  String get shareText => '分享文字';

  @override
  String get saveAsTxt => '保存为 .txt';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => '重新识别';

  @override
  String get readAsLatin => '按英语 / 拉丁文识别';

  @override
  String get readAsDevanagari => '按印地语 / 尼泊尔语识别';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      '在 Android 上，文字模型由 Google Play 服务下载一次。如果是首次使用，请稍等一分钟后重试。';

  @override
  String get noTextFound => '未找到文字。';

  @override
  String pageSeparator(int n) {
    return '--- 第 $n 页 ---';
  }

  @override
  String get scanner => '扫描器';

  @override
  String get scanMode => '扫描模式';

  @override
  String get modeFull => '完整：滤镜 + 清除污渍和手指';

  @override
  String get modeFilter => '仅滤镜';

  @override
  String get modeBase => '基本：仅裁剪和旋转';

  @override
  String get allowGallery => '允许从图库导入';

  @override
  String get allowGalleryHint => '在扫描器中显示图库按钮';

  @override
  String get pagesPerScan => '每次扫描的页数';

  @override
  String get iosScannerNote => '在 iPhone 上，扫描器是 Apple 自带的文档相机。';

  @override
  String get iosScannerNote2 => '自动拍摄、边缘检测和颜色模式均已内置。';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => '页面大小';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => '与扫描件形状相同';

  @override
  String get searchablePdf => '可搜索的 PDF';

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
  String get searchablePdfHint => '添加不可见的文字图层，以便在 PDF 中搜索和复制文字';

  @override
  String get textRecognition => '文字识别';

  @override
  String get quality => '质量';

  @override
  String get qualityBest => '最佳：完整分辨率，可识别小字';

  @override
  String get qualityFast => '快速：页面的缩小副本';

  @override
  String get language => '语言';

  @override
  String get scriptLatin => '英语及其他拉丁文字语言';

  @override
  String get scriptDevanagari => '印地语、尼泊尔语、马拉地语（+ 拉丁文）';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => '中文（+ 拉丁文）';

  @override
  String get scriptJapanese => '日语（+ 拉丁文）';

  @override
  String get scriptKorean => '韩语（+ 拉丁文）';

  @override
  String get readAsChinese => '按中文识别';

  @override
  String get readAsJapanese => '按日语识别';

  @override
  String get readAsKorean => '按韩语识别';

  @override
  String get languageAuto => '系统会自动检测语言。';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get themeSystem => '跟随手机';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get about => '关于';

  @override
  String get aboutPromise => '无广告。无需账号。无跟踪。';

  @override
  String get aboutPromiseBody =>
      '除非您分享或导出，否则扫描件只保存在这部手机上。卸载应用会删除这些扫描件，请先导出您想保留的内容。';

  @override
  String get openSource => '开源 (Apache-2.0)';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get opensInBrowser => '在浏览器中打开';

  @override
  String get aboutTechAndroid =>
      '扫描和文字识别由 Google ML Kit 提供（在设备上完成）。PDF 合并由 PDFBox-Android 提供。天城文字体：Noto (OFL)。';

  @override
  String get aboutTechIos =>
      '扫描由 Apple VisionKit 提供，文字识别由 Apple Vision 提供（在设备上完成）。天城文字体：Noto (OFL)。';

  @override
  String couldNotOpenUrl(String url) {
    return '无法打开 $url';
  }

  @override
  String get scanBusinessCard => '扫描名片';

  @override
  String get saveAsContact => '保存为联系人';

  @override
  String get saveToContacts => '保存到通讯录';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => '名片';

  @override
  String get contactHint => '请核对各项信息，然后保存。手机的“通讯录”应用将打开，并已填好所有内容。';

  @override
  String get readingCard => '正在识别名片…';

  @override
  String get nothingRecognised => '未能在这张名片上识别出文字。您仍可手动输入信息。';

  @override
  String get contactOpened => '已打开通讯录。请在那里点按“保存”以保留联系人。';

  @override
  String couldNotOpenContacts(String error) {
    return '无法打开通讯录：$error';
  }

  @override
  String cardDefaultName(String stamp) {
    return '名片 $stamp';
  }

  @override
  String get fieldCompany => '公司';

  @override
  String get fieldJobTitle => '职位';

  @override
  String get fieldMobile => '手机';

  @override
  String get fieldPhone => '电话';

  @override
  String get fieldFax => '传真';

  @override
  String get fieldEmail => '电子邮件';

  @override
  String get fieldWebsite => '网站';

  @override
  String get fieldAddress => '地址';

  @override
  String get fieldCity => '城市';

  @override
  String get fieldCountry => '国家/地区';

  @override
  String get fieldNotes => '备注';

  @override
  String get drawFirst => '请先绘制您的签名。';

  @override
  String get clear => '清除';

  @override
  String get save => '保存';

  @override
  String get signHint => '用手指在框内签名。将手机横过来可获得更大空间。';

  @override
  String get thin => '细';

  @override
  String get medium => '中';

  @override
  String get thick => '粗';

  @override
  String couldNotReadPage(String error) {
    return '无法读取页面：$error';
  }

  @override
  String couldNotSign(String error) {
    return '无法签名：$error';
  }

  @override
  String get placeSignature => '放置签名';

  @override
  String get apply => '应用';

  @override
  String get dragPinchHint => '拖动可移动。双指捏合可调整大小。';

  @override
  String get smaller => '缩小';

  @override
  String get larger => '放大';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => '掃描';

  @override
  String get cancel => '取消';

  @override
  String get ok => '確定';

  @override
  String get close => '關閉';

  @override
  String get delete => '刪除';

  @override
  String get share => '分享';

  @override
  String get copy => '複製';

  @override
  String get copied => '已複製。';

  @override
  String get saved => '已儲存。';

  @override
  String get name => '名稱';

  @override
  String get rename => '重新命名';

  @override
  String get settings => '設定';

  @override
  String get dismiss => '關閉';

  @override
  String get tryAgain => '再試一次';

  @override
  String get cannotBeUndone => '此操作無法復原。';

  @override
  String get savingPages => '正在儲存頁面…';

  @override
  String get preparingScanner => '正在準備掃描器…\n首次使用時，Google Play 服務會下載一次。';

  @override
  String get scannerUnavailable => '掃描器無法使用。';

  @override
  String scannerUnavailableWith(String error) {
    return '掃描器無法使用：$error';
  }

  @override
  String couldNotSavePages(String error) {
    return '無法儲存頁面：$error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return '無法開啟檔案選擇器：$error';
  }

  @override
  String get importingPdf => '正在匯入 PDF…';

  @override
  String get importedPdf => '已匯入的 PDF';

  @override
  String couldNotImport(String error) {
    return '無法匯入：$error';
  }

  @override
  String get pickTwoPdfs => '請至少選擇兩個 PDF 檔案。';

  @override
  String mergingPdfs(int count) {
    return '正在合併 $count 個 PDF 檔案…';
  }

  @override
  String mergedFileName(String stamp) {
    return '合併 $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return '無法合併：$error';
  }

  @override
  String get saveToFolder => '儲存到資料夾';

  @override
  String couldNotSave(String error) {
    return '無法儲存：$error';
  }

  @override
  String get mergedDocument => '合併的文件';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + 另外 $count 個';
  }

  @override
  String get merging => '正在合併…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '要刪除 $count 個文件嗎？',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => '正在建立 PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return '正在建立 PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return '正在建立 PDF，第 $n / $total 頁';
  }

  @override
  String couldNotBuildPdf(String error) {
    return '無法建立 PDF：$error';
  }

  @override
  String get searchDocuments => '搜尋文件';

  @override
  String get closeSearch => '關閉搜尋';

  @override
  String get search => '搜尋';

  @override
  String get importPdfAsPages => '將 PDF 匯入為頁面';

  @override
  String get mergePdfFiles => '合併 PDF 檔案';

  @override
  String get clearSelection => '清除選取';

  @override
  String nSelected(int count) {
    return '已選取 $count 項';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '已選取 $count 項 · 依此順序合併';
  }

  @override
  String get mergeIntoOne => '合併為一個文件';

  @override
  String get shareAsPdf => '以 PDF 分享';

  @override
  String get selectAll => '全選';

  @override
  String get noScansYet => '尚無掃描檔';

  @override
  String get nothingMatches => '沒有相符的結果';

  @override
  String get emptyHint => '點一下「掃描」即可拍攝文件。所有內容都只會保留在這支手機上。';

  @override
  String get tryAnotherWord => '請試試其他字詞。';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 頁',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return '掃描 $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO 意外關閉';

  @override
  String get crashBody => '問題報告只儲存在這支手機上。與開發者分享有助於修正問題。報告只包含技術細節，不包含您的文件。';

  @override
  String get reportCopied => '報告已複製。';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO 當機報告';

  @override
  String get pdfSaved => 'PDF 已儲存。';

  @override
  String couldNotSavePdf(String error) {
    return '無法儲存 PDF：$error';
  }

  @override
  String get exportPagesAsImages => '將頁面匯出為圖片';

  @override
  String get saveToPhotos => '儲存到照片';

  @override
  String get savingToPhotos => '正在儲存到照片…';

  @override
  String get photosNeedsAndroid10 => '儲存到照片需要 Android 10 以上版本。請改用「分享」。';

  @override
  String get photosNotAllowed => 'BRIDGE PHOTO 沒有新增至照片的權限。請在「設定」中允許，或改用「分享」。';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 張圖片儲存到照片。',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return '無法匯出：$error';
  }

  @override
  String get deleteDocumentQuestion => '要刪除這份文件嗎？';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '將刪除 $count 頁。此操作無法復原。',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => '文字 (OCR)';

  @override
  String get sharePdf => '分享 PDF';

  @override
  String get savePdfToFolder => '將 PDF 儲存到資料夾';

  @override
  String get exportAsImages => '匯出為 JPEG / PNG';

  @override
  String get deleteDocument => '刪除文件';

  @override
  String get noPages => '沒有頁面。請點一下「新增頁面」。';

  @override
  String get addPages => '新增頁面';

  @override
  String get holdToReorder => '長按頁面即可調整順序';

  @override
  String get savePdfDialogTitle => '儲存 PDF';

  @override
  String get saveDialogTitle => '儲存';

  @override
  String couldNotRotate(String error) {
    return '無法旋轉：$error';
  }

  @override
  String couldNotShare(String error) {
    return '無法分享：$error';
  }

  @override
  String get noTextOnPage => '這一頁找不到文字。';

  @override
  String pageNText(int n) {
    return '第 $n 頁文字';
  }

  @override
  String deletePageQuestion(int n) {
    return '要刪除第 $n 頁嗎？';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return '第 $n 頁，共 $total 頁';
  }

  @override
  String get rotateLeft => '向左旋轉';

  @override
  String get rotateRight => '向右旋轉';

  @override
  String get undo => '復原';

  @override
  String get sign => '簽名';

  @override
  String get copyText => '複製文字';

  @override
  String get shareImage => '分享圖片';

  @override
  String get deletePage => '刪除頁面';

  @override
  String get signed => '已簽名。';

  @override
  String signPageN(int n) {
    return '在第 $n 頁簽名';
  }

  @override
  String get deleteThisSignature => '刪除此簽名';

  @override
  String get newSignature => '新簽名';

  @override
  String readingPage(int n, int total) {
    return '正在辨識第 $n / $total 頁';
  }

  @override
  String get ocrFailed => '文字辨識失敗。';

  @override
  String ocrFailedWith(String error) {
    return '文字辨識失敗：$error';
  }

  @override
  String get textSaved => '文字已儲存。';

  @override
  String get text => '文字';

  @override
  String get copyAll => '全部複製';

  @override
  String get shareText => '分享文字';

  @override
  String get saveAsTxt => '儲存為 .txt';

  @override
  String get readAgain => '重新辨識';

  @override
  String get readAsLatin => '以英文 / 拉丁文辨識';

  @override
  String get readAsDevanagari => '以印地文 / 尼泊爾文辨識';

  @override
  String get ocrModelHint =>
      '在 Android 上，文字模型會由 Google Play 服務下載一次。如果是首次使用，請稍候一分鐘再試一次。';

  @override
  String get noTextFound => '找不到文字。';

  @override
  String pageSeparator(int n) {
    return '--- 第 $n 頁 ---';
  }

  @override
  String get scanner => '掃描器';

  @override
  String get scanMode => '掃描模式';

  @override
  String get modeFull => '完整：濾鏡 + 清除污漬和手指';

  @override
  String get modeFilter => '僅濾鏡';

  @override
  String get modeBase => '基本：僅裁切和旋轉';

  @override
  String get allowGallery => '允許從圖庫匯入';

  @override
  String get allowGalleryHint => '在掃描器中顯示圖庫按鈕';

  @override
  String get pagesPerScan => '每次掃描的頁數';

  @override
  String get iosScannerNote => '在 iPhone 上，掃描器是 Apple 內建的文件相機。';

  @override
  String get iosScannerNote2 => '自動拍攝、邊緣偵測和色彩模式皆已內建。';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => '頁面大小';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => '與掃描檔形狀相同';

  @override
  String get searchablePdf => '可搜尋的 PDF';

  @override
  String get searchablePdfHint => '加入隱形文字圖層，讓 PDF 可以搜尋並複製文字';

  @override
  String get textRecognition => '文字辨識';

  @override
  String get quality => '品質';

  @override
  String get qualityBest => '最佳：完整解析度，可辨識小字';

  @override
  String get qualityFast => '快速：頁面的縮小版本';

  @override
  String get language => '語言';

  @override
  String get scriptLatin => '英文及其他拉丁字母語言';

  @override
  String get scriptDevanagari => '印地文、尼泊爾文、馬拉地文（+ 拉丁文）';

  @override
  String get scriptChinese => '中文（+ 拉丁文）';

  @override
  String get scriptJapanese => '日文（+ 拉丁文）';

  @override
  String get scriptKorean => '韓文（+ 拉丁文）';

  @override
  String get readAsChinese => '以中文辨識';

  @override
  String get readAsJapanese => '以日文辨識';

  @override
  String get readAsKorean => '以韓文辨識';

  @override
  String get languageAuto => '系統會自動偵測語言。';

  @override
  String get appearance => '外觀';

  @override
  String get theme => '主題';

  @override
  String get themeSystem => '跟隨手機';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '深色';

  @override
  String get about => '關於';

  @override
  String get aboutPromise => '沒有廣告。不需帳號。不會追蹤。';

  @override
  String get aboutPromiseBody =>
      '除非您分享或匯出，否則掃描檔只會保留在這支手機上。解除安裝應用程式會一併刪除，請先匯出您想保留的內容。';

  @override
  String get openSource => '開放原始碼 (Apache-2.0)';

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get opensInBrowser => '在瀏覽器中開啟';

  @override
  String get aboutTechAndroid =>
      '掃描和文字辨識由 Google ML Kit 提供（於裝置上執行）。PDF 合併由 PDFBox-Android 提供。天城文字型：Noto (OFL)。';

  @override
  String get aboutTechIos =>
      '掃描由 Apple VisionKit 提供，文字辨識由 Apple Vision 提供（於裝置上執行）。天城文字型：Noto (OFL)。';

  @override
  String couldNotOpenUrl(String url) {
    return '無法開啟 $url';
  }

  @override
  String get scanBusinessCard => '掃描名片';

  @override
  String get saveAsContact => '儲存為聯絡人';

  @override
  String get saveToContacts => '儲存到聯絡人';

  @override
  String get contactReviewTitle => '名片';

  @override
  String get contactHint => '請確認各欄位，然後儲存。手機的「聯絡人」App 會開啟，且所有內容都已填好。';

  @override
  String get readingCard => '正在辨識名片…';

  @override
  String get nothingRecognised => '無法在這張名片上辨識出文字。您仍可手動輸入資料。';

  @override
  String get contactOpened => '已開啟「聯絡人」。請在該處點一下「儲存」以保留聯絡人。';

  @override
  String couldNotOpenContacts(String error) {
    return '無法開啟聯絡人：$error';
  }

  @override
  String cardDefaultName(String stamp) {
    return '名片 $stamp';
  }

  @override
  String get fieldCompany => '公司';

  @override
  String get fieldJobTitle => '職稱';

  @override
  String get fieldMobile => '手機';

  @override
  String get fieldPhone => '電話';

  @override
  String get fieldFax => '傳真';

  @override
  String get fieldEmail => '電子郵件';

  @override
  String get fieldWebsite => '網站';

  @override
  String get fieldAddress => '地址';

  @override
  String get fieldCity => '城市';

  @override
  String get fieldCountry => '國家/地區';

  @override
  String get fieldNotes => '備註';

  @override
  String get drawFirst => '請先繪製您的簽名。';

  @override
  String get clear => '清除';

  @override
  String get save => '儲存';

  @override
  String get signHint => '用手指在框內簽名。將手機橫放可獲得更多空間。';

  @override
  String get thin => '細';

  @override
  String get medium => '中';

  @override
  String get thick => '粗';

  @override
  String couldNotReadPage(String error) {
    return '無法讀取頁面：$error';
  }

  @override
  String couldNotSign(String error) {
    return '無法簽名：$error';
  }

  @override
  String get placeSignature => '放置簽名';

  @override
  String get apply => '套用';

  @override
  String get dragPinchHint => '拖曳即可移動。兩指縮放即可調整大小。';

  @override
  String get smaller => '縮小';

  @override
  String get larger => '放大';
}
