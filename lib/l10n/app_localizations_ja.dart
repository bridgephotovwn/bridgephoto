// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'スキャン';

  @override
  String get cancel => 'キャンセル';

  @override
  String get ok => 'OK';

  @override
  String get close => '閉じる';

  @override
  String get delete => '削除';

  @override
  String get share => '共有';

  @override
  String get copy => 'コピー';

  @override
  String get copied => 'コピーしました。';

  @override
  String get saved => '保存しました。';

  @override
  String get name => '名前';

  @override
  String get rename => '名前を変更';

  @override
  String get settings => '設定';

  @override
  String get dismiss => '閉じる';

  @override
  String get tryAgain => '再試行';

  @override
  String get cannotBeUndone => 'この操作は元に戻せません。';

  @override
  String get savingPages => 'ページを保存しています…';

  @override
  String get preparingScanner =>
      'スキャナーを準備しています…\n初回のみ、Google Play開発者サービスがダウンロードします。';

  @override
  String get scannerUnavailable => 'スキャナーを利用できません。';

  @override
  String scannerUnavailableWith(String error) {
    return 'スキャナーを利用できません: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'ページを保存できませんでした: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'ファイル選択画面を開けませんでした: $error';
  }

  @override
  String get importingPdf => 'PDFを読み込んでいます…';

  @override
  String get importedPdf => '読み込んだPDF';

  @override
  String couldNotImport(String error) {
    return '読み込めませんでした: $error';
  }

  @override
  String get pickTwoPdfs => 'PDFファイルを2つ以上選択してください。';

  @override
  String mergingPdfs(int count) {
    return '$count個のPDFファイルを結合しています…';
  }

  @override
  String mergedFileName(String stamp) {
    return '結合 $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return '結合できませんでした: $error';
  }

  @override
  String get saveToFolder => 'フォルダに保存';

  @override
  String couldNotSave(String error) {
    return '保存できませんでした: $error';
  }

  @override
  String get mergedDocument => '結合した書類';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + 他$count件';
  }

  @override
  String get merging => '結合しています…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の書類を削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'PDFを作成しています…';

  @override
  String buildingPdfN(int n, int total) {
    return 'PDFを作成しています $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'PDFを作成しています。ページ $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'PDFを作成できませんでした: $error';
  }

  @override
  String get searchDocuments => '書類を検索';

  @override
  String get closeSearch => '検索を閉じる';

  @override
  String get search => '検索';

  @override
  String get importPdfAsPages => 'PDFをページとして読み込む';

  @override
  String get mergePdfFiles => 'PDFファイルを結合';

  @override
  String get clearSelection => '選択を解除';

  @override
  String nSelected(int count) {
    return '$count件を選択中';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count件を選択中 · この順序で結合';
  }

  @override
  String get mergeIntoOne => '1つの書類に結合';

  @override
  String get shareAsPdf => 'PDFとして共有';

  @override
  String get selectAll => 'すべて選択';

  @override
  String get noScansYet => 'スキャンはまだありません';

  @override
  String get nothingMatches => '一致する項目はありません';

  @override
  String get emptyHint => '「スキャン」をタップして書類を撮影します。すべてこのスマートフォン内に保存されます。';

  @override
  String get tryAnotherWord => '別の言葉で試してください。';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページ',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'スキャン $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTOが予期せず終了しました';

  @override
  String get crashBody =>
      '問題のレポートはこのスマートフォンにのみ保存されました。開発者と共有すると、問題の解決に役立ちます。レポートには技術的な情報のみが含まれ、書類は含まれません。';

  @override
  String get reportCopied => 'レポートをコピーしました。';

  @override
  String get crashReportSubject => 'BRIDGE PHOTO クラッシュレポート';

  @override
  String get pdfSaved => 'PDFを保存しました。';

  @override
  String couldNotSavePdf(String error) {
    return 'PDFを保存できませんでした: $error';
  }

  @override
  String get exportPagesAsImages => 'ページを画像として書き出す';

  @override
  String get saveToPhotos => '写真に保存';

  @override
  String get savingToPhotos => '写真に保存しています…';

  @override
  String get photosNeedsAndroid10 =>
      '写真への保存にはAndroid 10以降が必要です。代わりに「共有」を使用してください。';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTOは写真への追加を許可されていません。設定で許可するか、「共有」を使用してください。';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count枚の画像を写真に保存しました。',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return '書き出せませんでした: $error';
  }

  @override
  String get deleteDocumentQuestion => 'この書類を削除しますか？';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページが削除されます。この操作は元に戻せません。',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'テキスト (OCR)';

  @override
  String get sharePdf => 'PDFを共有';

  @override
  String get savePdfToFolder => 'PDFをフォルダに保存';

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
  String get exportAsImages => 'JPEG / PNGとして書き出す';

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
  String get deleteDocument => '書類を削除';

  @override
  String get noPages => 'ページがありません。「ページを追加」をタップしてください。';

  @override
  String get addPages => 'ページを追加';

  @override
  String get holdToReorder => 'ページを長押しして並べ替え';

  @override
  String get savePdfDialogTitle => 'PDFを保存';

  @override
  String get saveDialogTitle => '保存';

  @override
  String couldNotRotate(String error) {
    return '回転できませんでした: $error';
  }

  @override
  String couldNotShare(String error) {
    return '共有できませんでした: $error';
  }

  @override
  String get noTextOnPage => 'このページにテキストは見つかりませんでした。';

  @override
  String pageNText(int n) {
    return 'ページ$nのテキスト';
  }

  @override
  String deletePageQuestion(int n) {
    return 'ページ$nを削除しますか？';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'ページ $n / $total';
  }

  @override
  String get rotateLeft => '左に回転';

  @override
  String get rotateRight => '右に回転';

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
  String get undo => '元に戻す';

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
  String get sign => '署名';

  @override
  String get copyText => 'テキストをコピー';

  @override
  String get shareImage => '画像を共有';

  @override
  String get deletePage => 'ページを削除';

  @override
  String get signed => '署名しました。';

  @override
  String signPageN(int n) {
    return 'ページ$nに署名';
  }

  @override
  String get deleteThisSignature => 'この署名を削除';

  @override
  String get newSignature => '新しい署名';

  @override
  String readingPage(int n, int total) {
    return 'ページを読み取っています $n / $total';
  }

  @override
  String get ocrFailed => 'テキスト認識に失敗しました。';

  @override
  String ocrFailedWith(String error) {
    return 'テキスト認識に失敗しました: $error';
  }

  @override
  String get textSaved => 'テキストを保存しました。';

  @override
  String get text => 'テキスト';

  @override
  String get copyAll => 'すべてコピー';

  @override
  String get shareText => 'テキストを共有';

  @override
  String get saveAsTxt => '.txtとして保存';

  @override
  String get readAgain => '再読み取り';

  @override
  String get readAsLatin => '英語 / ラテン文字として読み取る';

  @override
  String get readAsDevanagari => 'ヒンディー語 / ネパール語として読み取る';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Androidでは、テキストモデルはGoogle Play開発者サービスによって一度だけダウンロードされます。初めて使用する場合は、1分ほど待ってからもう一度お試しください。';

  @override
  String get noTextFound => 'テキストは見つかりませんでした。';

  @override
  String pageSeparator(int n) {
    return '--- ページ $n ---';
  }

  @override
  String get scanner => 'スキャナー';

  @override
  String get scanMode => 'スキャンモード';

  @override
  String get modeFull => 'フル: フィルタ + 汚れや指の除去';

  @override
  String get modeFilter => 'フィルタのみ';

  @override
  String get modeBase => 'ベーシック: 切り抜きと回転のみ';

  @override
  String get allowGallery => 'ギャラリーからの読み込みを許可';

  @override
  String get allowGalleryHint => 'スキャナー内にギャラリーボタンを表示します';

  @override
  String get pagesPerScan => '1回のスキャンあたりのページ数';

  @override
  String get iosScannerNote => 'iPhoneでは、Apple純正の書類カメラがスキャナーとして使われます。';

  @override
  String get iosScannerNote2 => '自動撮影、エッジ検出、カラーモードが内蔵されています。';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'ページサイズ';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'スキャンと同じ形';

  @override
  String get searchablePdf => '検索可能なPDF';

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
  String get searchablePdfHint => '透明なテキストレイヤーを追加して、PDF内の検索とテキストのコピーを可能にします';

  @override
  String get textRecognition => 'テキスト認識';

  @override
  String get quality => '品質';

  @override
  String get qualityBest => '最高: フル解像度、小さな文字も読み取り';

  @override
  String get qualityFast => '高速: ページの縮小コピー';

  @override
  String get language => '言語';

  @override
  String get scriptLatin => '英語とその他のラテン文字の言語';

  @override
  String get scriptDevanagari => 'ヒンディー語、ネパール語、マラーティー語（+ ラテン文字）';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => '中国語（+ ラテン文字）';

  @override
  String get scriptJapanese => '日本語（+ ラテン文字）';

  @override
  String get scriptKorean => '韓国語（+ ラテン文字）';

  @override
  String get readAsChinese => '中国語として読み取る';

  @override
  String get readAsJapanese => '日本語として読み取る';

  @override
  String get readAsKorean => '韓国語として読み取る';

  @override
  String get languageAuto => '言語は自動的に検出されます。';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get themeSystem => 'スマートフォンの設定に従う';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get about => 'このアプリについて';

  @override
  String get aboutPromise => '広告なし。アカウント不要。トラッキングなし。';

  @override
  String get aboutPromiseBody =>
      'スキャンは、共有または書き出さない限りこのスマートフォン内に保存されます。アプリをアンインストールすると削除されるため、残しておきたいものは書き出してください。';

  @override
  String get openSource => 'オープンソース (Apache-2.0)';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get opensInBrowser => 'ブラウザで開きます';

  @override
  String get aboutTechAndroid =>
      'スキャンとテキスト認識: Google ML Kit（端末内で処理）。PDFの結合: PDFBox-Android。デーヴァナーガリー文字のフォント: Noto (OFL)。';

  @override
  String get aboutTechIos =>
      'スキャン: Apple VisionKit、テキスト認識: Apple Vision（端末内で処理）。デーヴァナーガリー文字のフォント: Noto (OFL)。';

  @override
  String couldNotOpenUrl(String url) {
    return '$urlを開けませんでした';
  }

  @override
  String get scanBusinessCard => '名刺をスキャン';

  @override
  String get saveAsContact => '連絡先として保存';

  @override
  String get saveToContacts => '連絡先に保存';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => '名刺';

  @override
  String get contactHint =>
      '各項目を確認してから保存してください。スマートフォンの連絡先アプリが、すべて入力済みの状態で開きます。';

  @override
  String get readingCard => '名刺を読み取っています…';

  @override
  String get nothingRecognised => 'この名刺からテキストを認識できませんでした。詳細を手入力することもできます。';

  @override
  String get contactOpened => '連絡先を開きました。保存するには、そこで「保存」をタップしてください。';

  @override
  String couldNotOpenContacts(String error) {
    return '連絡先を開けませんでした: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return '名刺 $stamp';
  }

  @override
  String get fieldCompany => '会社';

  @override
  String get fieldJobTitle => '役職';

  @override
  String get fieldMobile => '携帯電話';

  @override
  String get fieldPhone => '電話';

  @override
  String get fieldFax => 'FAX';

  @override
  String get fieldEmail => 'メール';

  @override
  String get fieldWebsite => 'ウェブサイト';

  @override
  String get fieldAddress => '住所';

  @override
  String get fieldCity => '市区町村';

  @override
  String get fieldCountry => '国';

  @override
  String get fieldNotes => 'メモ';

  @override
  String get drawFirst => '先に署名を書いてください。';

  @override
  String get clear => '消去';

  @override
  String get save => '保存';

  @override
  String get signHint => '枠内に指で署名してください。スマートフォンを横向きにすると広く使えます。';

  @override
  String get thin => '細';

  @override
  String get medium => '中';

  @override
  String get thick => '太';

  @override
  String couldNotReadPage(String error) {
    return 'ページを読み込めませんでした: $error';
  }

  @override
  String couldNotSign(String error) {
    return '署名できませんでした: $error';
  }

  @override
  String get placeSignature => '署名を配置';

  @override
  String get apply => '適用';

  @override
  String get dragPinchHint => 'ドラッグで移動。ピンチでサイズ変更。';

  @override
  String get smaller => '小さく';

  @override
  String get larger => '大きく';
}
