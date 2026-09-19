// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Сканировать';

  @override
  String get cancel => 'Отмена';

  @override
  String get ok => 'ОК';

  @override
  String get close => 'Закрыть';

  @override
  String get delete => 'Удалить';

  @override
  String get share => 'Поделиться';

  @override
  String get copy => 'Копировать';

  @override
  String get copied => 'Скопировано.';

  @override
  String get saved => 'Сохранено.';

  @override
  String get name => 'Название';

  @override
  String get rename => 'Переименовать';

  @override
  String get settings => 'Настройки';

  @override
  String get dismiss => 'Скрыть';

  @override
  String get tryAgain => 'Повторить';

  @override
  String get cannotBeUndone => 'Это действие нельзя отменить.';

  @override
  String get savingPages => 'Сохранение страниц…';

  @override
  String get preparingScanner =>
      'Подготовка сканера…\nПри первом запуске сервисы Google Play загрузят его один раз.';

  @override
  String get scannerUnavailable => 'Сканер недоступен.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Сканер недоступен: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Не удалось сохранить страницы: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Не удалось открыть выбор файлов: $error';
  }

  @override
  String get importingPdf => 'Импорт PDF…';

  @override
  String get importedPdf => 'Импортированный PDF';

  @override
  String couldNotImport(String error) {
    return 'Не удалось импортировать: $error';
  }

  @override
  String get pickTwoPdfs => 'Выберите не менее двух PDF-файлов.';

  @override
  String mergingPdfs(int count) {
    return 'Объединение PDF-файлов ($count)…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Объединено $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Не удалось объединить: $error';
  }

  @override
  String get saveToFolder => 'Сохранить в папку';

  @override
  String couldNotSave(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get mergedDocument => 'Объединённый документ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + ещё $count';
  }

  @override
  String get merging => 'Объединение…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count документа?',
      many: 'Удалить $count документов?',
      few: 'Удалить $count документа?',
      one: 'Удалить $count документ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Создание PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Создание PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Создание PDF, страница $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Не удалось создать PDF: $error';
  }

  @override
  String get searchDocuments => 'Поиск документов';

  @override
  String get closeSearch => 'Закрыть поиск';

  @override
  String get search => 'Поиск';

  @override
  String get importPdfAsPages => 'Импортировать PDF как страницы';

  @override
  String get mergePdfFiles => 'Объединить PDF-файлы';

  @override
  String get clearSelection => 'Снять выделение';

  @override
  String nSelected(int count) {
    return 'Выбрано: $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Выбрано: $count · объединение в этом порядке';
  }

  @override
  String get mergeIntoOne => 'Объединить в один документ';

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
  String get shareAsPdf => 'Поделиться как PDF';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String get noScansYet => 'Сканов пока нет';

  @override
  String get nothingMatches => 'Ничего не найдено';

  @override
  String get emptyHint =>
      'Нажмите «Сканировать», чтобы сфотографировать документ. Всё остаётся на этом телефоне.';

  @override
  String get tryAnotherWord => 'Попробуйте другое слово.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Скан $stamp';
  }

  @override
  String get crashTitle => 'Приложение BRIDGE PHOTO неожиданно закрылось';

  @override
  String get crashBody =>
      'Отчёт о сбое сохранён только на этом телефоне. Если отправить его разработчику, это поможет устранить проблему. Он содержит технические данные, а не ваши документы.';

  @override
  String get reportCopied => 'Отчёт скопирован.';

  @override
  String get crashReportSubject => 'Отчёт о сбое BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF сохранён.';

  @override
  String couldNotSavePdf(String error) {
    return 'Не удалось сохранить PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Экспортировать страницы как изображения';

  @override
  String get saveToPhotos => 'Сохранить в Фото';

  @override
  String get savingToPhotos => 'Сохранение в Фото…';

  @override
  String get photosNeedsAndroid10 =>
      'Для сохранения в Фото требуется Android 10 или новее. Используйте «Поделиться».';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO не разрешено добавлять в Фото. Разрешите это в настройках или используйте «Поделиться».';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения сохранено в Фото.',
      many: '$count изображений сохранено в Фото.',
      few: '$count изображения сохранены в Фото.',
      one: '$count изображение сохранено в Фото.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Не удалось экспортировать: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Удалить этот документ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Будет удалено $count страницы. Это действие нельзя отменить.',
      many: 'Будет удалено $count страниц. Это действие нельзя отменить.',
      few: 'Будут удалены $count страницы. Это действие нельзя отменить.',
      one: 'Будет удалена $count страница. Это действие нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Текст (OCR)';

  @override
  String get sharePdf => 'Поделиться PDF';

  @override
  String get savePdfToFolder => 'Сохранить PDF в папку';

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
  String get exportAsImages => 'Экспорт в JPEG / PNG';

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
  String get deleteDocument => 'Удалить документ';

  @override
  String get noPages => 'Нет страниц. Нажмите «Добавить страницы».';

  @override
  String get addPages => 'Добавить страницы';

  @override
  String get holdToReorder => 'удерживайте страницу, чтобы изменить порядок';

  @override
  String get savePdfDialogTitle => 'Сохранить PDF';

  @override
  String get saveDialogTitle => 'Сохранить';

  @override
  String couldNotRotate(String error) {
    return 'Не удалось повернуть: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Не удалось поделиться: $error';
  }

  @override
  String get noTextOnPage => 'На этой странице текст не найден.';

  @override
  String pageNText(int n) {
    return 'Текст страницы $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Удалить страницу $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Страница $n из $total';
  }

  @override
  String get rotateLeft => 'Повернуть влево';

  @override
  String get rotateRight => 'Повернуть вправо';

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
  String get undo => 'Отменить';

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
  String get sign => 'Подписать';

  @override
  String get copyText => 'Копировать текст';

  @override
  String get shareImage => 'Поделиться изображением';

  @override
  String get deletePage => 'Удалить страницу';

  @override
  String get signed => 'Подписано.';

  @override
  String signPageN(int n) {
    return 'Подписать страницу $n';
  }

  @override
  String get deleteThisSignature => 'Удалить эту подпись';

  @override
  String get newSignature => 'Новая подпись';

  @override
  String readingPage(int n, int total) {
    return 'Распознавание страницы $n / $total';
  }

  @override
  String get ocrFailed => 'Не удалось распознать текст.';

  @override
  String ocrFailedWith(String error) {
    return 'Не удалось распознать текст: $error';
  }

  @override
  String get textSaved => 'Текст сохранён.';

  @override
  String get text => 'Текст';

  @override
  String get copyAll => 'Копировать всё';

  @override
  String get shareText => 'Поделиться текстом';

  @override
  String get saveAsTxt => 'Сохранить как .txt';

  @override
  String get saveAsWord => 'Save as Word';

  @override
  String get saveAsExcel => 'Save as a spreadsheet';

  @override
  String get readAgain => 'Распознать снова';

  @override
  String get readAsLatin => 'Распознать как английский / латиницу';

  @override
  String get readAsDevanagari => 'Распознать как хинди / непальский';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'На Android модель распознавания текста один раз загружается сервисами Google Play. Если это первый запуск, подождите минуту и повторите попытку.';

  @override
  String get noTextFound => 'Текст не найден.';

  @override
  String pageSeparator(int n) {
    return '--- Страница $n ---';
  }

  @override
  String get scanner => 'Сканер';

  @override
  String get scanMode => 'Режим сканирования';

  @override
  String get modeFull => 'Полный: фильтры + удаление пятен и пальцев';

  @override
  String get modeFilter => 'Только фильтры';

  @override
  String get modeBase => 'Базовый: только обрезка и поворот';

  @override
  String get allowGallery => 'Разрешить импорт из галереи';

  @override
  String get allowGalleryHint => 'Показывает кнопку галереи в сканере';

  @override
  String get pagesPerScan => 'Страниц за одно сканирование';

  @override
  String get iosScannerNote =>
      'На iPhone используется собственная камера документов Apple.';

  @override
  String get iosScannerNote2 =>
      'Автоматическая съёмка, определение краёв и цветовые режимы уже встроены.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Размер страницы';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'По форме скана';

  @override
  String get searchablePdf => 'PDF с поиском';

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
      'Добавляет невидимый текстовый слой, чтобы в PDF можно было искать и копировать текст';

  @override
  String get textRecognition => 'Распознавание текста';

  @override
  String get quality => 'Качество';

  @override
  String get qualityBest => 'Лучшее: полное разрешение, читает мелкий шрифт';

  @override
  String get qualityFast => 'Быстрое: уменьшенная копия страницы';

  @override
  String get language => 'Язык';

  @override
  String get scriptLatin => 'Английский и другие языки на латинице';

  @override
  String get scriptDevanagari => 'Хинди, непальский, маратхи (+ латиница)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Китайский (+ латиница)';

  @override
  String get scriptJapanese => 'Японский (+ латиница)';

  @override
  String get scriptKorean => 'Корейский (+ латиница)';

  @override
  String get readAsChinese => 'Распознать как китайский';

  @override
  String get readAsJapanese => 'Распознать как японский';

  @override
  String get readAsKorean => 'Распознать как корейский';

  @override
  String get languageAuto => 'Язык определяется автоматически.';

  @override
  String get appearance => 'Оформление';

  @override
  String get theme => 'Тема';

  @override
  String get themeSystem => 'Как на телефоне';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get about => 'О приложении';

  @override
  String get aboutPromise => 'Без рекламы. Без аккаунта. Без отслеживания.';

  @override
  String get aboutPromiseBody =>
      'Сканы остаются на этом телефоне, пока вы не поделитесь ими или не экспортируете их. При удалении приложения они удаляются, поэтому экспортируйте то, что хотите сохранить.';

  @override
  String get openSource => 'Открытый исходный код (Apache-2.0)';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get opensInBrowser => 'Откроется в браузере';

  @override
  String get aboutTechAndroid =>
      'Сканирование и распознавание текста: Google ML Kit (на устройстве). Объединение PDF: PDFBox-Android. Шрифт деванагари: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Сканирование: Apple VisionKit, распознавание текста: Apple Vision (на устройстве). Шрифт деванагари: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Не удалось открыть $url';
  }

  @override
  String get scanBusinessCard => 'Сканировать визитку';

  @override
  String get saveAsContact => 'Сохранить как контакт';

  @override
  String get saveToContacts => 'Сохранить в Контакты';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Визитка';

  @override
  String get contactHint =>
      'Проверьте поля, затем сохраните. Откроется приложение «Контакты» на телефоне со всеми заполненными данными.';

  @override
  String get readingCard => 'Чтение визитки…';

  @override
  String get nothingRecognised =>
      'На этой визитке текст не распознан. Вы можете ввести данные вручную.';

  @override
  String get contactOpened =>
      'Открыто приложение «Контакты». Нажмите там «Сохранить», чтобы сохранить контакт.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Не удалось открыть Контакты: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Визитка $stamp';
  }

  @override
  String get fieldCompany => 'Компания';

  @override
  String get fieldJobTitle => 'Должность';

  @override
  String get fieldMobile => 'Мобильный';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldFax => 'Факс';

  @override
  String get fieldEmail => 'Эл. почта';

  @override
  String get fieldWebsite => 'Сайт';

  @override
  String get fieldAddress => 'Адрес';

  @override
  String get fieldCity => 'Город';

  @override
  String get fieldCountry => 'Страна';

  @override
  String get fieldNotes => 'Заметки';

  @override
  String get drawFirst => 'Сначала нарисуйте подпись.';

  @override
  String get clear => 'Очистить';

  @override
  String get save => 'Сохранить';

  @override
  String get signHint =>
      'Распишитесь в поле пальцем. Поверните телефон горизонтально, чтобы было больше места.';

  @override
  String get thin => 'Тонкая';

  @override
  String get medium => 'Средняя';

  @override
  String get thick => 'Толстая';

  @override
  String couldNotReadPage(String error) {
    return 'Не удалось прочитать страницу: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Не удалось подписать: $error';
  }

  @override
  String get placeSignature => 'Разместить подпись';

  @override
  String get apply => 'Применить';

  @override
  String get dragPinchHint =>
      'Перетащите, чтобы переместить. Сведите или разведите пальцы, чтобы изменить размер.';

  @override
  String get smaller => 'Меньше';

  @override
  String get larger => 'Больше';
}
