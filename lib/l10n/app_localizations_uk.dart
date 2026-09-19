// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Сканувати';

  @override
  String get cancel => 'Скасувати';

  @override
  String get ok => 'ОК';

  @override
  String get close => 'Закрити';

  @override
  String get delete => 'Видалити';

  @override
  String get share => 'Поділитися';

  @override
  String get copy => 'Копіювати';

  @override
  String get copied => 'Скопійовано.';

  @override
  String get saved => 'Збережено.';

  @override
  String get name => 'Назва';

  @override
  String get rename => 'Перейменувати';

  @override
  String get settings => 'Налаштування';

  @override
  String get dismiss => 'Приховати';

  @override
  String get tryAgain => 'Повторити';

  @override
  String get cannotBeUndone => 'Цю дію не можна скасувати.';

  @override
  String get savingPages => 'Збереження сторінок…';

  @override
  String get preparingScanner =>
      'Підготовка сканера…\nПід час першого запуску сервіси Google Play завантажать його один раз.';

  @override
  String get scannerUnavailable => 'Сканер недоступний.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Сканер недоступний: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Не вдалося зберегти сторінки: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Не вдалося відкрити вибір файлів: $error';
  }

  @override
  String get importingPdf => 'Імпорт PDF…';

  @override
  String get importedPdf => 'Імпортований PDF';

  @override
  String couldNotImport(String error) {
    return 'Не вдалося імпортувати: $error';
  }

  @override
  String get pickTwoPdfs => 'Виберіть щонайменше два PDF-файли.';

  @override
  String mergingPdfs(int count) {
    return 'Об’єднання PDF-файлів ($count)…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Об’єднано $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Не вдалося об’єднати: $error';
  }

  @override
  String get saveToFolder => 'Зберегти в папку';

  @override
  String couldNotSave(String error) {
    return 'Не вдалося зберегти: $error';
  }

  @override
  String get mergedDocument => 'Об’єднаний документ';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + ще $count';
  }

  @override
  String get merging => 'Об’єднання…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалити $count документа?',
      many: 'Видалити $count документів?',
      few: 'Видалити $count документи?',
      one: 'Видалити $count документ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Створення PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Створення PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Створення PDF, сторінка $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Не вдалося створити PDF: $error';
  }

  @override
  String get searchDocuments => 'Пошук документів';

  @override
  String get closeSearch => 'Закрити пошук';

  @override
  String get search => 'Пошук';

  @override
  String get importPdfAsPages => 'Імпортувати PDF як сторінки';

  @override
  String get mergePdfFiles => 'Об’єднати PDF-файли';

  @override
  String get clearSelection => 'Зняти вибір';

  @override
  String nSelected(int count) {
    return 'Вибрано: $count';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return 'Вибрано: $count · об’єднання в цьому порядку';
  }

  @override
  String get mergeIntoOne => 'Об’єднати в один документ';

  @override
  String get shareAsPdf => 'Поділитися як PDF';

  @override
  String get selectAll => 'Вибрати все';

  @override
  String get noScansYet => 'Сканів поки немає';

  @override
  String get nothingMatches => 'Нічого не знайдено';

  @override
  String get emptyHint =>
      'Натисніть «Сканувати», щоб сфотографувати документ. Усе залишається на цьому телефоні.';

  @override
  String get tryAnotherWord => 'Спробуйте інше слово.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сторінки',
      many: '$count сторінок',
      few: '$count сторінки',
      one: '$count сторінка',
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
  String get crashTitle => 'Застосунок BRIDGE PHOTO несподівано закрився';

  @override
  String get crashBody =>
      'Звіт про збій збережено лише на цьому телефоні. Якщо надіслати його розробнику, це допоможе усунути проблему. Він містить технічні дані, а не ваші документи.';

  @override
  String get reportCopied => 'Звіт скопійовано.';

  @override
  String get crashReportSubject => 'Звіт про збій BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF збережено.';

  @override
  String couldNotSavePdf(String error) {
    return 'Не вдалося зберегти PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Експортувати сторінки як зображення';

  @override
  String get saveToPhotos => 'Зберегти у Фото';

  @override
  String get savingToPhotos => 'Збереження у Фото…';

  @override
  String get photosNeedsAndroid10 =>
      'Для збереження у Фото потрібен Android 10 або новіший. Скористайтеся «Поділитися».';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO не має дозволу додавати у Фото. Надайте його в налаштуваннях або скористайтеся «Поділитися».';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count зображення збережено у Фото.',
      many: '$count зображень збережено у Фото.',
      few: '$count зображення збережено у Фото.',
      one: '$count зображення збережено у Фото.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Не вдалося експортувати: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Видалити цей документ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Буде видалено $count сторінки. Цю дію не можна скасувати.',
      many: 'Буде видалено $count сторінок. Цю дію не можна скасувати.',
      few: 'Буде видалено $count сторінки. Цю дію не можна скасувати.',
      one: 'Буде видалено $count сторінку. Цю дію не можна скасувати.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Текст (OCR)';

  @override
  String get sharePdf => 'Поділитися PDF';

  @override
  String get savePdfToFolder => 'Зберегти PDF у папку';

  @override
  String get exportAsImages => 'Експорт у JPEG / PNG';

  @override
  String get deleteDocument => 'Видалити документ';

  @override
  String get noPages => 'Немає сторінок. Натисніть «Додати сторінки».';

  @override
  String get addPages => 'Додати сторінки';

  @override
  String get holdToReorder => 'утримуйте сторінку, щоб змінити порядок';

  @override
  String get savePdfDialogTitle => 'Зберегти PDF';

  @override
  String get saveDialogTitle => 'Зберегти';

  @override
  String couldNotRotate(String error) {
    return 'Не вдалося повернути: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Не вдалося поділитися: $error';
  }

  @override
  String get noTextOnPage => 'На цій сторінці текст не знайдено.';

  @override
  String pageNText(int n) {
    return 'Текст сторінки $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Видалити сторінку $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Сторінка $n з $total';
  }

  @override
  String get rotateLeft => 'Повернути ліворуч';

  @override
  String get rotateRight => 'Повернути праворуч';

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
  String get sign => 'Підписати';

  @override
  String get copyText => 'Копіювати текст';

  @override
  String get shareImage => 'Поділитися зображенням';

  @override
  String get deletePage => 'Видалити сторінку';

  @override
  String get signed => 'Підписано.';

  @override
  String signPageN(int n) {
    return 'Підписати сторінку $n';
  }

  @override
  String get deleteThisSignature => 'Видалити цей підпис';

  @override
  String get newSignature => 'Новий підпис';

  @override
  String readingPage(int n, int total) {
    return 'Розпізнавання сторінки $n / $total';
  }

  @override
  String get ocrFailed => 'Не вдалося розпізнати текст.';

  @override
  String ocrFailedWith(String error) {
    return 'Не вдалося розпізнати текст: $error';
  }

  @override
  String get textSaved => 'Текст збережено.';

  @override
  String get text => 'Текст';

  @override
  String get copyAll => 'Копіювати все';

  @override
  String get shareText => 'Поділитися текстом';

  @override
  String get saveAsTxt => 'Зберегти як .txt';

  @override
  String get readAgain => 'Розпізнати знову';

  @override
  String get readAsLatin => 'Розпізнати як англійську / латиницю';

  @override
  String get readAsDevanagari => 'Розпізнати як гінді / непальську';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'На Android модель розпізнавання тексту один раз завантажують сервіси Google Play. Якщо це перший запуск, зачекайте хвилину та повторіть спробу.';

  @override
  String get noTextFound => 'Текст не знайдено.';

  @override
  String pageSeparator(int n) {
    return '--- Сторінка $n ---';
  }

  @override
  String get scanner => 'Сканер';

  @override
  String get scanMode => 'Режим сканування';

  @override
  String get modeFull => 'Повний: фільтри + очищення плям і пальців';

  @override
  String get modeFilter => 'Лише фільтри';

  @override
  String get modeBase => 'Базовий: лише обрізання та поворот';

  @override
  String get allowGallery => 'Дозволити імпорт із галереї';

  @override
  String get allowGalleryHint => 'Показує кнопку галереї в сканері';

  @override
  String get pagesPerScan => 'Сторінок за одне сканування';

  @override
  String get iosScannerNote =>
      'На iPhone використовується власна камера документів Apple.';

  @override
  String get iosScannerNote2 =>
      'Автоматичне знімання, визначення країв і колірні режими вже вбудовані.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Розмір сторінки';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'За формою скану';

  @override
  String get searchablePdf => 'PDF із пошуком';

  @override
  String get searchablePdfHint =>
      'Додає невидимий текстовий шар, щоб у PDF можна було шукати та копіювати текст';

  @override
  String get textRecognition => 'Розпізнавання тексту';

  @override
  String get quality => 'Якість';

  @override
  String get qualityBest => 'Найкраща: повна роздільність, читає дрібний шрифт';

  @override
  String get qualityFast => 'Швидка: зменшена копія сторінки';

  @override
  String get language => 'Мова';

  @override
  String get scriptLatin => 'Англійська та інші мови на латиниці';

  @override
  String get scriptDevanagari => 'Гінді, непальська, маратхі (+ латиниця)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Китайська (+ латиниця)';

  @override
  String get scriptJapanese => 'Японська (+ латиниця)';

  @override
  String get scriptKorean => 'Корейська (+ латиниця)';

  @override
  String get readAsChinese => 'Розпізнати як китайську';

  @override
  String get readAsJapanese => 'Розпізнати як японську';

  @override
  String get readAsKorean => 'Розпізнати як корейську';

  @override
  String get languageAuto => 'Мова визначається автоматично.';

  @override
  String get appearance => 'Вигляд';

  @override
  String get theme => 'Тема';

  @override
  String get themeSystem => 'Як на телефоні';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get about => 'Про застосунок';

  @override
  String get aboutPromise =>
      'Без реклами. Без облікового запису. Без відстеження.';

  @override
  String get aboutPromiseBody =>
      'Скани залишаються на цьому телефоні, доки ви не поділитеся ними або не експортуєте їх. Видалення застосунку видаляє і їх, тож експортуйте те, що хочете зберегти.';

  @override
  String get openSource => 'Відкритий код (Apache-2.0)';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get opensInBrowser => 'Відкриється у браузері';

  @override
  String get aboutTechAndroid =>
      'Сканування та розпізнавання тексту: Google ML Kit (на пристрої). Об’єднання PDF: PDFBox-Android. Шрифт деванагарі: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Сканування: Apple VisionKit, розпізнавання тексту: Apple Vision (на пристрої). Шрифт деванагарі: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Не вдалося відкрити $url';
  }

  @override
  String get scanBusinessCard => 'Сканувати візитку';

  @override
  String get saveAsContact => 'Зберегти як контакт';

  @override
  String get saveToContacts => 'Зберегти в Контакти';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Візитка';

  @override
  String get contactHint =>
      'Перевірте поля, а потім збережіть. Відкриється застосунок «Контакти» на телефоні з усіма заповненими даними.';

  @override
  String get readingCard => 'Читання візитки…';

  @override
  String get nothingRecognised =>
      'На цій візитці текст не розпізнано. Ви все одно можете ввести дані вручну.';

  @override
  String get contactOpened =>
      'Відкрито застосунок «Контакти». Натисніть там «Зберегти», щоб зберегти контакт.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Не вдалося відкрити Контакти: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Візитка $stamp';
  }

  @override
  String get fieldCompany => 'Компанія';

  @override
  String get fieldJobTitle => 'Посада';

  @override
  String get fieldMobile => 'Мобільний';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldFax => 'Факс';

  @override
  String get fieldEmail => 'Електронна пошта';

  @override
  String get fieldWebsite => 'Вебсайт';

  @override
  String get fieldAddress => 'Адреса';

  @override
  String get fieldCity => 'Місто';

  @override
  String get fieldCountry => 'Країна';

  @override
  String get fieldNotes => 'Нотатки';

  @override
  String get drawFirst => 'Спочатку намалюйте підпис.';

  @override
  String get clear => 'Очистити';

  @override
  String get undo => 'Відмінити';

  @override
  String get save => 'Зберегти';

  @override
  String get signHint =>
      'Поставте підпис у полі пальцем. Поверніть телефон горизонтально, щоб було більше місця.';

  @override
  String get thin => 'Тонка';

  @override
  String get medium => 'Середня';

  @override
  String get thick => 'Товста';

  @override
  String couldNotReadPage(String error) {
    return 'Не вдалося прочитати сторінку: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Не вдалося підписати: $error';
  }

  @override
  String get placeSignature => 'Розмістити підпис';

  @override
  String get apply => 'Застосувати';

  @override
  String get dragPinchHint =>
      'Перетягніть, щоб перемістити. Зведіть або розведіть пальці, щоб змінити розмір.';

  @override
  String get smaller => 'Менше';

  @override
  String get larger => 'Більше';
}
