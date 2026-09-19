// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Escanear';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get close => 'Cerrar';

  @override
  String get delete => 'Eliminar';

  @override
  String get share => 'Compartir';

  @override
  String get copy => 'Copiar';

  @override
  String get copied => 'Copiado.';

  @override
  String get saved => 'Guardado.';

  @override
  String get name => 'Nombre';

  @override
  String get rename => 'Cambiar nombre';

  @override
  String get settings => 'Ajustes';

  @override
  String get dismiss => 'Descartar';

  @override
  String get tryAgain => 'Reintentar';

  @override
  String get cannotBeUndone => 'Esta acción no se puede deshacer.';

  @override
  String get savingPages => 'Guardando páginas…';

  @override
  String get preparingScanner =>
      'Preparando el escáner…\nPrimer uso: los servicios de Google Play lo descargan una sola vez.';

  @override
  String get scannerUnavailable => 'El escáner no está disponible.';

  @override
  String scannerUnavailableWith(String error) {
    return 'El escáner no está disponible: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'No se pudieron guardar las páginas: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'No se pudo abrir el selector de archivos: $error';
  }

  @override
  String get importingPdf => 'Importando PDF…';

  @override
  String get importedPdf => 'PDF importado';

  @override
  String couldNotImport(String error) {
    return 'No se pudo importar: $error';
  }

  @override
  String get pickTwoPdfs => 'Seleccione al menos dos archivos PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Combinando $count archivos PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Combinado $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'No se pudo combinar: $error';
  }

  @override
  String get saveToFolder => 'Guardar en una carpeta';

  @override
  String couldNotSave(String error) {
    return 'No se pudo guardar: $error';
  }

  @override
  String get mergedDocument => 'Documento combinado';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count más';
  }

  @override
  String get merging => 'Combinando…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count documentos?',
      one: '¿Eliminar 1 documento?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Generando PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Generando PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Generando PDF, página $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'No se pudo generar el PDF: $error';
  }

  @override
  String get searchDocuments => 'Buscar documentos';

  @override
  String get closeSearch => 'Cerrar búsqueda';

  @override
  String get search => 'Buscar';

  @override
  String get importPdfAsPages => 'Importar PDF como páginas';

  @override
  String get mergePdfFiles => 'Combinar archivos PDF';

  @override
  String get clearSelection => 'Borrar selección';

  @override
  String nSelected(int count) {
    return '$count seleccionados';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count seleccionados · se combinan en este orden';
  }

  @override
  String get mergeIntoOne => 'Combinar en un documento';

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
  String get shareAsPdf => 'Compartir como PDF';

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String get noScansYet => 'Aún no hay escaneos';

  @override
  String get nothingMatches => 'Sin resultados';

  @override
  String get emptyHint =>
      'Toque Escanear para fotografiar un documento. Todo se queda en este teléfono.';

  @override
  String get tryAnotherWord => 'Pruebe con otra palabra.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Escaneo $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO se cerró de forma inesperada';

  @override
  String get crashBody =>
      'Se guardó un informe del error solo en este teléfono. Compartirlo con el desarrollador ayuda a corregir el problema. Contiene detalles técnicos, no sus documentos.';

  @override
  String get reportCopied => 'Informe copiado.';

  @override
  String get crashReportSubject => 'Informe de error de BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF guardado.';

  @override
  String couldNotSavePdf(String error) {
    return 'No se pudo guardar el PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportar páginas como imágenes';

  @override
  String get saveToPhotos => 'Guardar en Fotos';

  @override
  String get savingToPhotos => 'Guardando en Fotos…';

  @override
  String get photosNeedsAndroid10 =>
      'Para guardar en Fotos se necesita Android 10 o posterior. Use Compartir en su lugar.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO no tiene permiso para añadir a Fotos. Permítalo en Ajustes o use Compartir.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imágenes guardadas en Fotos.',
      one: '1 imagen guardada en Fotos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'No se pudo exportar: $error';
  }

  @override
  String get deleteDocumentQuestion => '¿Eliminar este documento?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se eliminarán $count páginas. Esta acción no se puede deshacer.',
      one: 'Se eliminará 1 página. Esta acción no se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Texto (OCR)';

  @override
  String get sharePdf => 'Compartir PDF';

  @override
  String get savePdfToFolder => 'Guardar PDF en una carpeta';

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
  String get exportAsImages => 'Exportar como JPEG / PNG';

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
  String get deleteDocument => 'Eliminar documento';

  @override
  String get noPages => 'No hay páginas. Toque Añadir páginas.';

  @override
  String get addPages => 'Añadir páginas';

  @override
  String get holdToReorder => 'mantenga pulsada una página para reordenar';

  @override
  String get savePdfDialogTitle => 'Guardar PDF';

  @override
  String get saveDialogTitle => 'Guardar';

  @override
  String couldNotRotate(String error) {
    return 'No se pudo girar: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'No se pudo compartir: $error';
  }

  @override
  String get noTextOnPage => 'No se encontró texto en esta página.';

  @override
  String pageNText(int n) {
    return 'Texto de la página $n';
  }

  @override
  String deletePageQuestion(int n) {
    return '¿Eliminar la página $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Página $n de $total';
  }

  @override
  String get rotateLeft => 'Girar a la izquierda';

  @override
  String get rotateRight => 'Girar a la derecha';

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
  String get undo => 'Deshacer';

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
  String get sign => 'Firmar';

  @override
  String get copyText => 'Copiar texto';

  @override
  String get shareImage => 'Compartir imagen';

  @override
  String get deletePage => 'Eliminar página';

  @override
  String get signed => 'Firmado.';

  @override
  String signPageN(int n) {
    return 'Firmar la página $n';
  }

  @override
  String get deleteThisSignature => 'Eliminar esta firma';

  @override
  String get newSignature => 'Nueva firma';

  @override
  String readingPage(int n, int total) {
    return 'Leyendo página $n / $total';
  }

  @override
  String get ocrFailed => 'Falló el reconocimiento de texto.';

  @override
  String ocrFailedWith(String error) {
    return 'Falló el reconocimiento de texto: $error';
  }

  @override
  String get textSaved => 'Texto guardado.';

  @override
  String get text => 'Texto';

  @override
  String get copyAll => 'Copiar todo';

  @override
  String get shareText => 'Compartir texto';

  @override
  String get saveAsTxt => 'Guardar como .txt';

  @override
  String get readAgain => 'Volver a leer';

  @override
  String get readAsLatin => 'Leer como inglés / latino';

  @override
  String get readAsDevanagari => 'Leer como hindi / nepalí';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'En Android, los servicios de Google Play descargan el modelo de texto una sola vez. Si es el primer uso, espere un minuto y vuelva a intentarlo.';

  @override
  String get noTextFound => 'No se encontró texto.';

  @override
  String pageSeparator(int n) {
    return '--- Página $n ---';
  }

  @override
  String get scanner => 'Escáner';

  @override
  String get scanMode => 'Modo de escaneo';

  @override
  String get modeFull => 'Completo: filtros + limpieza de manchas y dedos';

  @override
  String get modeFilter => 'Solo filtros';

  @override
  String get modeBase => 'Básico: solo recortar y girar';

  @override
  String get allowGallery => 'Permitir importar desde la galería';

  @override
  String get allowGalleryHint =>
      'Muestra un botón de galería dentro del escáner';

  @override
  String get pagesPerScan => 'Páginas por escaneo';

  @override
  String get iosScannerNote =>
      'En iPhone, el escáner es la cámara de documentos propia de Apple.';

  @override
  String get iosScannerNote2 =>
      'La captura automática, la detección de bordes y los modos de color están integrados.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Tamaño de página';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Misma forma que el escaneo';

  @override
  String get searchablePdf => 'PDF con búsqueda';

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
      'Añade una capa de texto invisible para poder buscar en el PDF y copiar el texto';

  @override
  String get textRecognition => 'Reconocimiento de texto';

  @override
  String get quality => 'Calidad';

  @override
  String get qualityBest => 'Máxima: resolución completa, lee la letra pequeña';

  @override
  String get qualityFast => 'Rápida: copia reducida de la página';

  @override
  String get language => 'Idioma';

  @override
  String get scriptLatin => 'Inglés y otros idiomas de alfabeto latino';

  @override
  String get scriptDevanagari => 'Hindi, nepalí, maratí (+ latino)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Chino (+ latino)';

  @override
  String get scriptJapanese => 'Japonés (+ latino)';

  @override
  String get scriptKorean => 'Coreano (+ latino)';

  @override
  String get readAsChinese => 'Leer como chino';

  @override
  String get readAsJapanese => 'Leer como japonés';

  @override
  String get readAsKorean => 'Leer como coreano';

  @override
  String get languageAuto => 'El idioma se detecta automáticamente.';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Según el teléfono';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get about => 'Acerca de';

  @override
  String get aboutPromise => 'Sin anuncios. Sin cuenta. Sin rastreo.';

  @override
  String get aboutPromiseBody =>
      'Los escaneos se quedan en este teléfono a menos que los comparta o exporte. Al desinstalar la app se eliminan, así que exporte lo que quiera conservar.';

  @override
  String get openSource => 'Código abierto (Apache-2.0)';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get opensInBrowser => 'Se abre en su navegador';

  @override
  String get aboutTechAndroid =>
      'Escaneo y reconocimiento de texto con Google ML Kit (en el dispositivo). Combinación de PDF con PDFBox-Android. Fuente devanagari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Escaneo con Apple VisionKit, reconocimiento de texto con Apple Vision (en el dispositivo). Fuente devanagari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'No se pudo abrir $url';
  }

  @override
  String get scanBusinessCard => 'Escanear una tarjeta de visita';

  @override
  String get saveAsContact => 'Guardar como contacto';

  @override
  String get saveToContacts => 'Guardar en Contactos';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Tarjeta de visita';

  @override
  String get contactHint =>
      'Revise los campos y luego guarde. La aplicación Contactos de su teléfono se abrirá con todo rellenado.';

  @override
  String get readingCard => 'Leyendo la tarjeta…';

  @override
  String get nothingRecognised =>
      'No se reconoció texto en esta tarjeta. Aun así, puede escribir los datos.';

  @override
  String get contactOpened =>
      'Se abrió Contactos. Toque Guardar allí para conservar el contacto.';

  @override
  String couldNotOpenContacts(String error) {
    return 'No se pudo abrir Contactos: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Tarjeta $stamp';
  }

  @override
  String get fieldCompany => 'Empresa';

  @override
  String get fieldJobTitle => 'Cargo';

  @override
  String get fieldMobile => 'Móvil';

  @override
  String get fieldPhone => 'Teléfono';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'Correo electrónico';

  @override
  String get fieldWebsite => 'Sitio web';

  @override
  String get fieldAddress => 'Dirección';

  @override
  String get fieldCity => 'Ciudad';

  @override
  String get fieldCountry => 'País';

  @override
  String get fieldNotes => 'Notas';

  @override
  String get drawFirst => 'Dibuje primero su firma.';

  @override
  String get clear => 'Borrar';

  @override
  String get save => 'Guardar';

  @override
  String get signHint =>
      'Firme en el recuadro con el dedo. Gire el teléfono en horizontal para tener más espacio.';

  @override
  String get thin => 'Fino';

  @override
  String get medium => 'Medio';

  @override
  String get thick => 'Grueso';

  @override
  String couldNotReadPage(String error) {
    return 'No se pudo leer la página: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'No se pudo firmar: $error';
  }

  @override
  String get placeSignature => 'Colocar firma';

  @override
  String get apply => 'Aplicar';

  @override
  String get dragPinchHint =>
      'Arrastre para mover. Pellizque para cambiar el tamaño.';

  @override
  String get smaller => 'Más pequeña';

  @override
  String get larger => 'Más grande';
}
