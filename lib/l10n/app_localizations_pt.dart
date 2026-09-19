// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Digitalizar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Fechar';

  @override
  String get delete => 'Eliminar';

  @override
  String get share => 'Partilhar';

  @override
  String get copy => 'Copiar';

  @override
  String get copied => 'Copiado.';

  @override
  String get saved => 'Guardado.';

  @override
  String get name => 'Nome';

  @override
  String get rename => 'Mudar o nome';

  @override
  String get settings => 'Definições';

  @override
  String get dismiss => 'Ignorar';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get cannotBeUndone => 'Esta ação não pode ser anulada.';

  @override
  String get savingPages => 'A guardar páginas…';

  @override
  String get preparingScanner =>
      'A preparar o digitalizador…\nPrimeira utilização: os serviços do Google Play transferem-no uma única vez.';

  @override
  String get scannerUnavailable => 'O digitalizador não está disponível.';

  @override
  String scannerUnavailableWith(String error) {
    return 'O digitalizador não está disponível: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Não foi possível guardar as páginas: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Não foi possível abrir o seletor de ficheiros: $error';
  }

  @override
  String get importingPdf => 'A importar PDF…';

  @override
  String get importedPdf => 'PDF importado';

  @override
  String couldNotImport(String error) {
    return 'Não foi possível importar: $error';
  }

  @override
  String get pickTwoPdfs => 'Escolha pelo menos dois ficheiros PDF.';

  @override
  String mergingPdfs(int count) {
    return 'A combinar $count ficheiros PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Combinado $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Não foi possível combinar: $error';
  }

  @override
  String get saveToFolder => 'Guardar numa pasta';

  @override
  String couldNotSave(String error) {
    return 'Não foi possível guardar: $error';
  }

  @override
  String get mergedDocument => 'Documento combinado';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count mais';
  }

  @override
  String get merging => 'A combinar…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count documentos?',
      one: 'Eliminar 1 documento?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'A criar PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'A criar PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'A criar PDF, página $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Não foi possível criar o PDF: $error';
  }

  @override
  String get searchDocuments => 'Pesquisar documentos';

  @override
  String get closeSearch => 'Fechar pesquisa';

  @override
  String get search => 'Pesquisar';

  @override
  String get importPdfAsPages => 'Importar PDF como páginas';

  @override
  String get mergePdfFiles => 'Combinar ficheiros PDF';

  @override
  String get clearSelection => 'Limpar seleção';

  @override
  String nSelected(int count) {
    return '$count selecionados';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count selecionados · combinar por esta ordem';
  }

  @override
  String get mergeIntoOne => 'Combinar num único documento';

  @override
  String get shareAsPdf => 'Partilhar como PDF';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get noScansYet => 'Ainda não há digitalizações';

  @override
  String get nothingMatches => 'Sem resultados';

  @override
  String get emptyHint =>
      'Toque em Digitalizar para fotografar um documento. Tudo fica neste telemóvel.';

  @override
  String get tryAnotherWord => 'Experimente outra palavra.';

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
    return 'Digitalização $stamp';
  }

  @override
  String get crashTitle => 'O BRIDGE PHOTO fechou inesperadamente';

  @override
  String get crashBody =>
      'Foi guardado um relatório do erro apenas neste telemóvel. Partilhá-lo com o programador ajuda a corrigir o problema. Contém detalhes técnicos, não os seus documentos.';

  @override
  String get reportCopied => 'Relatório copiado.';

  @override
  String get crashReportSubject => 'Relatório de falha do BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF guardado.';

  @override
  String couldNotSavePdf(String error) {
    return 'Não foi possível guardar o PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportar páginas como imagens';

  @override
  String get saveToPhotos => 'Guardar em Fotos';

  @override
  String get savingToPhotos => 'A guardar em Fotos…';

  @override
  String get photosNeedsAndroid10 =>
      'Guardar em Fotos requer o Android 10 ou mais recente. Em alternativa, use Partilhar.';

  @override
  String get photosNotAllowed =>
      'O BRIDGE PHOTO não tem permissão para adicionar a Fotos. Permita-o nas Definições ou use Partilhar.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imagens guardadas em Fotos.',
      one: '1 imagem guardada em Fotos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Não foi possível exportar: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Eliminar este documento?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas serão eliminadas. Esta ação não pode ser anulada.',
      one: '1 página será eliminada. Esta ação não pode ser anulada.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Texto (OCR)';

  @override
  String get sharePdf => 'Partilhar PDF';

  @override
  String get savePdfToFolder => 'Guardar PDF numa pasta';

  @override
  String get exportAsImages => 'Exportar como JPEG / PNG';

  @override
  String get deleteDocument => 'Eliminar documento';

  @override
  String get noPages => 'Sem páginas. Toque em Adicionar páginas.';

  @override
  String get addPages => 'Adicionar páginas';

  @override
  String get holdToReorder => 'mantenha uma página premida para reordenar';

  @override
  String get savePdfDialogTitle => 'Guardar PDF';

  @override
  String get saveDialogTitle => 'Guardar';

  @override
  String couldNotRotate(String error) {
    return 'Não foi possível rodar: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Não foi possível partilhar: $error';
  }

  @override
  String get noTextOnPage => 'Não foi encontrado texto nesta página.';

  @override
  String pageNText(int n) {
    return 'Texto da página $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Eliminar a página $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Página $n de $total';
  }

  @override
  String get rotateLeft => 'Rodar para a esquerda';

  @override
  String get rotateRight => 'Rodar para a direita';

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
  String get sign => 'Assinar';

  @override
  String get copyText => 'Copiar texto';

  @override
  String get shareImage => 'Partilhar imagem';

  @override
  String get deletePage => 'Eliminar página';

  @override
  String get signed => 'Assinado.';

  @override
  String signPageN(int n) {
    return 'Assinar a página $n';
  }

  @override
  String get deleteThisSignature => 'Eliminar esta assinatura';

  @override
  String get newSignature => 'Nova assinatura';

  @override
  String readingPage(int n, int total) {
    return 'A ler a página $n / $total';
  }

  @override
  String get ocrFailed => 'O reconhecimento de texto falhou.';

  @override
  String ocrFailedWith(String error) {
    return 'O reconhecimento de texto falhou: $error';
  }

  @override
  String get textSaved => 'Texto guardado.';

  @override
  String get text => 'Texto';

  @override
  String get copyAll => 'Copiar tudo';

  @override
  String get shareText => 'Partilhar texto';

  @override
  String get saveAsTxt => 'Guardar como .txt';

  @override
  String get readAgain => 'Ler novamente';

  @override
  String get readAsLatin => 'Ler como inglês / latino';

  @override
  String get readAsDevanagari => 'Ler como hindi / nepalês';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'No Android, o modelo de texto é transferido uma única vez pelos serviços do Google Play. Se for a primeira utilização, aguarde um minuto e tente novamente.';

  @override
  String get noTextFound => 'Não foi encontrado texto.';

  @override
  String pageSeparator(int n) {
    return '--- Página $n ---';
  }

  @override
  String get scanner => 'Digitalizador';

  @override
  String get scanMode => 'Modo de digitalização';

  @override
  String get modeFull => 'Completo: filtros + limpeza de manchas e dedos';

  @override
  String get modeFilter => 'Apenas filtros';

  @override
  String get modeBase => 'Básico: apenas recortar e rodar';

  @override
  String get allowGallery => 'Permitir importar da galeria';

  @override
  String get allowGalleryHint =>
      'Mostra um botão de galeria dentro do digitalizador';

  @override
  String get pagesPerScan => 'Páginas por digitalização';

  @override
  String get iosScannerNote =>
      'No iPhone, o digitalizador é a câmara de documentos da própria Apple.';

  @override
  String get iosScannerNote2 =>
      'A captura automática, a deteção de contornos e os modos de cor estão integrados.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Tamanho da página';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Mesma forma da digitalização';

  @override
  String get searchablePdf => 'PDF pesquisável';

  @override
  String get searchablePdfHint =>
      'Adiciona uma camada de texto invisível para poder pesquisar no PDF e copiar o texto';

  @override
  String get textRecognition => 'Reconhecimento de texto';

  @override
  String get quality => 'Qualidade';

  @override
  String get qualityBest => 'Máxima: resolução total, lê letras pequenas';

  @override
  String get qualityFast => 'Rápida: cópia reduzida da página';

  @override
  String get language => 'Idioma';

  @override
  String get scriptLatin => 'Inglês e outros idiomas de alfabeto latino';

  @override
  String get scriptDevanagari => 'Hindi, nepalês, marata (+ latino)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Chinês (+ latino)';

  @override
  String get scriptJapanese => 'Japonês (+ latino)';

  @override
  String get scriptKorean => 'Coreano (+ latino)';

  @override
  String get readAsChinese => 'Ler como chinês';

  @override
  String get readAsJapanese => 'Ler como japonês';

  @override
  String get readAsKorean => 'Ler como coreano';

  @override
  String get languageAuto => 'O idioma é detetado automaticamente.';

  @override
  String get appearance => 'Aspeto';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Igual ao telemóvel';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get about => 'Acerca de';

  @override
  String get aboutPromise => 'Sem anúncios. Sem conta. Sem rastreio.';

  @override
  String get aboutPromiseBody =>
      'As digitalizações ficam neste telemóvel, a menos que as partilhe ou exporte. Desinstalar a app elimina-as, por isso exporte o que quiser manter.';

  @override
  String get openSource => 'Código aberto (Apache-2.0)';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get opensInBrowser => 'Abre no seu navegador';

  @override
  String get aboutTechAndroid =>
      'Digitalização e reconhecimento de texto pelo Google ML Kit (no dispositivo). Combinação de PDF pelo PDFBox-Android. Tipo de letra devanágari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Digitalização pelo Apple VisionKit, reconhecimento de texto pelo Apple Vision (no dispositivo). Tipo de letra devanágari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Não foi possível abrir $url';
  }

  @override
  String get scanBusinessCard => 'Digitalizar um cartão de visita';

  @override
  String get saveAsContact => 'Guardar como contacto';

  @override
  String get saveToContacts => 'Guardar nos Contactos';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Cartão de visita';

  @override
  String get contactHint =>
      'Verifique os campos e depois guarde. A app Contactos do seu telemóvel abre com tudo preenchido.';

  @override
  String get readingCard => 'A ler o cartão…';

  @override
  String get nothingRecognised =>
      'Não foi reconhecido texto neste cartão. Pode, ainda assim, escrever os dados.';

  @override
  String get contactOpened =>
      'Os Contactos foram abertos. Toque em Guardar aí para manter o contacto.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Não foi possível abrir os Contactos: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Cartão $stamp';
  }

  @override
  String get fieldCompany => 'Empresa';

  @override
  String get fieldJobTitle => 'Cargo';

  @override
  String get fieldMobile => 'Telemóvel';

  @override
  String get fieldPhone => 'Telefone';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Website';

  @override
  String get fieldAddress => 'Morada';

  @override
  String get fieldCity => 'Cidade';

  @override
  String get fieldCountry => 'País';

  @override
  String get fieldNotes => 'Notas';

  @override
  String get drawFirst => 'Desenhe primeiro a sua assinatura.';

  @override
  String get clear => 'Limpar';

  @override
  String get undo => 'Anular';

  @override
  String get save => 'Guardar';

  @override
  String get signHint =>
      'Assine na caixa com o dedo. Rode o telemóvel para a horizontal para ter mais espaço.';

  @override
  String get thin => 'Fino';

  @override
  String get medium => 'Médio';

  @override
  String get thick => 'Grosso';

  @override
  String couldNotReadPage(String error) {
    return 'Não foi possível ler a página: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Não foi possível assinar: $error';
  }

  @override
  String get placeSignature => 'Posicionar assinatura';

  @override
  String get apply => 'Aplicar';

  @override
  String get dragPinchHint =>
      'Arraste para mover. Junte ou afaste os dedos para redimensionar.';

  @override
  String get smaller => 'Mais pequena';

  @override
  String get larger => 'Maior';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Digitalizar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Fechar';

  @override
  String get delete => 'Excluir';

  @override
  String get share => 'Compartilhar';

  @override
  String get copy => 'Copiar';

  @override
  String get copied => 'Copiado.';

  @override
  String get saved => 'Salvo.';

  @override
  String get name => 'Nome';

  @override
  String get rename => 'Renomear';

  @override
  String get settings => 'Configurações';

  @override
  String get dismiss => 'Dispensar';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get cannotBeUndone => 'Esta ação não pode ser desfeita.';

  @override
  String get savingPages => 'Salvando páginas…';

  @override
  String get preparingScanner =>
      'Preparando o escâner…\nPrimeiro uso: os serviços do Google Play fazem o download apenas uma vez.';

  @override
  String get scannerUnavailable => 'O escâner não está disponível.';

  @override
  String scannerUnavailableWith(String error) {
    return 'O escâner não está disponível: $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Não foi possível salvar as páginas: $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Não foi possível abrir o seletor de arquivos: $error';
  }

  @override
  String get importingPdf => 'Importando PDF…';

  @override
  String get importedPdf => 'PDF importado';

  @override
  String couldNotImport(String error) {
    return 'Não foi possível importar: $error';
  }

  @override
  String get pickTwoPdfs => 'Escolha pelo menos dois arquivos PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Mesclando $count arquivos PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Mesclado $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Não foi possível mesclar: $error';
  }

  @override
  String get saveToFolder => 'Salvar em uma pasta';

  @override
  String couldNotSave(String error) {
    return 'Não foi possível salvar: $error';
  }

  @override
  String get mergedDocument => 'Documento mesclado';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count mais';
  }

  @override
  String get merging => 'Mesclando…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count documentos?',
      one: 'Excluir 1 documento?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Gerando PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Gerando PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Gerando PDF, página $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Não foi possível gerar o PDF: $error';
  }

  @override
  String get searchDocuments => 'Pesquisar documentos';

  @override
  String get closeSearch => 'Fechar pesquisa';

  @override
  String get search => 'Pesquisar';

  @override
  String get importPdfAsPages => 'Importar PDF como páginas';

  @override
  String get mergePdfFiles => 'Mesclar arquivos PDF';

  @override
  String get clearSelection => 'Limpar seleção';

  @override
  String nSelected(int count) {
    return '$count selecionados';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count selecionados · mesclar nesta ordem';
  }

  @override
  String get mergeIntoOne => 'Mesclar em um único documento';

  @override
  String get shareAsPdf => 'Compartilhar como PDF';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get noScansYet => 'Nenhuma digitalização ainda';

  @override
  String get nothingMatches => 'Nenhum resultado';

  @override
  String get emptyHint =>
      'Toque em Digitalizar para fotografar um documento. Tudo fica neste celular.';

  @override
  String get tryAnotherWord => 'Tente outra palavra.';

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
    return 'Digitalização $stamp';
  }

  @override
  String get crashTitle => 'O BRIDGE PHOTO fechou inesperadamente';

  @override
  String get crashBody =>
      'Um relatório do erro foi salvo apenas neste celular. Compartilhá-lo com o desenvolvedor ajuda a corrigir o problema. Ele contém detalhes técnicos, não os seus documentos.';

  @override
  String get reportCopied => 'Relatório copiado.';

  @override
  String get crashReportSubject => 'Relatório de falha do BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF salvo.';

  @override
  String couldNotSavePdf(String error) {
    return 'Não foi possível salvar o PDF: $error';
  }

  @override
  String get exportPagesAsImages => 'Exportar páginas como imagens';

  @override
  String get saveToPhotos => 'Salvar em Fotos';

  @override
  String get savingToPhotos => 'Salvando em Fotos…';

  @override
  String get photosNeedsAndroid10 =>
      'Salvar em Fotos requer o Android 10 ou mais recente. Use Compartilhar em vez disso.';

  @override
  String get photosNotAllowed =>
      'O BRIDGE PHOTO não tem permissão para adicionar a Fotos. Permita nas Configurações ou use Compartilhar.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imagens salvas em Fotos.',
      one: '1 imagem salva em Fotos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Não foi possível exportar: $error';
  }

  @override
  String get deleteDocumentQuestion => 'Excluir este documento?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas serão excluídas. Esta ação não pode ser desfeita.',
      one: '1 página será excluída. Esta ação não pode ser desfeita.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Texto (OCR)';

  @override
  String get sharePdf => 'Compartilhar PDF';

  @override
  String get savePdfToFolder => 'Salvar PDF em uma pasta';

  @override
  String get exportAsImages => 'Exportar como JPEG / PNG';

  @override
  String get deleteDocument => 'Excluir documento';

  @override
  String get noPages => 'Nenhuma página. Toque em Adicionar páginas.';

  @override
  String get addPages => 'Adicionar páginas';

  @override
  String get holdToReorder => 'toque e segure uma página para reordenar';

  @override
  String get savePdfDialogTitle => 'Salvar PDF';

  @override
  String get saveDialogTitle => 'Salvar';

  @override
  String couldNotRotate(String error) {
    return 'Não foi possível girar: $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Não foi possível compartilhar: $error';
  }

  @override
  String get noTextOnPage => 'Nenhum texto encontrado nesta página.';

  @override
  String pageNText(int n) {
    return 'Texto da página $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Excluir a página $n?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Página $n de $total';
  }

  @override
  String get rotateLeft => 'Girar para a esquerda';

  @override
  String get rotateRight => 'Girar para a direita';

  @override
  String get sign => 'Assinar';

  @override
  String get copyText => 'Copiar texto';

  @override
  String get shareImage => 'Compartilhar imagem';

  @override
  String get deletePage => 'Excluir página';

  @override
  String get signed => 'Assinado.';

  @override
  String signPageN(int n) {
    return 'Assinar a página $n';
  }

  @override
  String get deleteThisSignature => 'Excluir esta assinatura';

  @override
  String get newSignature => 'Nova assinatura';

  @override
  String readingPage(int n, int total) {
    return 'Lendo página $n / $total';
  }

  @override
  String get ocrFailed => 'O reconhecimento de texto falhou.';

  @override
  String ocrFailedWith(String error) {
    return 'O reconhecimento de texto falhou: $error';
  }

  @override
  String get textSaved => 'Texto salvo.';

  @override
  String get text => 'Texto';

  @override
  String get copyAll => 'Copiar tudo';

  @override
  String get shareText => 'Compartilhar texto';

  @override
  String get saveAsTxt => 'Salvar como .txt';

  @override
  String get readAgain => 'Ler novamente';

  @override
  String get readAsLatin => 'Ler como inglês / latino';

  @override
  String get readAsDevanagari => 'Ler como hindi / nepalês';

  @override
  String get ocrModelHint =>
      'No Android, o modelo de texto é baixado uma única vez pelos serviços do Google Play. Se este for o primeiro uso, aguarde um minuto e tente novamente.';

  @override
  String get noTextFound => 'Nenhum texto encontrado.';

  @override
  String pageSeparator(int n) {
    return '--- Página $n ---';
  }

  @override
  String get scanner => 'Escâner';

  @override
  String get scanMode => 'Modo de digitalização';

  @override
  String get modeFull => 'Completo: filtros + limpeza de manchas e dedos';

  @override
  String get modeFilter => 'Somente filtros';

  @override
  String get modeBase => 'Básico: somente cortar e girar';

  @override
  String get allowGallery => 'Permitir importar da galeria';

  @override
  String get allowGalleryHint => 'Mostra um botão de galeria dentro do escâner';

  @override
  String get pagesPerScan => 'Páginas por digitalização';

  @override
  String get iosScannerNote =>
      'No iPhone, o escâner é a câmera de documentos da própria Apple.';

  @override
  String get iosScannerNote2 =>
      'Captura automática, detecção de bordas e modos de cor já vêm integrados.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Tamanho da página';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Mesmo formato da digitalização';

  @override
  String get searchablePdf => 'PDF pesquisável';

  @override
  String get searchablePdfHint =>
      'Adiciona uma camada de texto invisível para permitir pesquisar no PDF e copiar o texto';

  @override
  String get textRecognition => 'Reconhecimento de texto';

  @override
  String get quality => 'Qualidade';

  @override
  String get qualityBest => 'Máxima: resolução total, lê letras pequenas';

  @override
  String get qualityFast => 'Rápida: cópia reduzida da página';

  @override
  String get language => 'Idioma';

  @override
  String get scriptLatin => 'Inglês e outros idiomas de alfabeto latino';

  @override
  String get scriptDevanagari => 'Hindi, nepalês, marata (+ latino)';

  @override
  String get scriptChinese => 'Chinês (+ latino)';

  @override
  String get scriptJapanese => 'Japonês (+ latino)';

  @override
  String get scriptKorean => 'Coreano (+ latino)';

  @override
  String get readAsChinese => 'Ler como chinês';

  @override
  String get readAsJapanese => 'Ler como japonês';

  @override
  String get readAsKorean => 'Ler como coreano';

  @override
  String get languageAuto => 'O idioma é detectado automaticamente.';

  @override
  String get appearance => 'Aparência';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Igual ao celular';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get about => 'Sobre';

  @override
  String get aboutPromise => 'Sem anúncios. Sem conta. Sem rastreamento.';

  @override
  String get aboutPromiseBody =>
      'As digitalizações ficam neste celular, a menos que você as compartilhe ou exporte. Desinstalar o app as exclui, então exporte o que quiser manter.';

  @override
  String get openSource => 'Código aberto (Apache-2.0)';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get opensInBrowser => 'Abre no seu navegador';

  @override
  String get aboutTechAndroid =>
      'Digitalização e reconhecimento de texto pelo Google ML Kit (no dispositivo). Mesclagem de PDF pelo PDFBox-Android. Fonte devanágari: Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Digitalização pelo Apple VisionKit, reconhecimento de texto pelo Apple Vision (no dispositivo). Fonte devanágari: Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Não foi possível abrir $url';
  }

  @override
  String get scanBusinessCard => 'Digitalizar um cartão de visita';

  @override
  String get saveAsContact => 'Salvar como contato';

  @override
  String get saveToContacts => 'Salvar nos Contatos';

  @override
  String get contactReviewTitle => 'Cartão de visita';

  @override
  String get contactHint =>
      'Confira os campos e depois salve. O app Contatos do seu celular abre com tudo preenchido.';

  @override
  String get readingCard => 'Lendo o cartão…';

  @override
  String get nothingRecognised =>
      'Nenhum texto foi reconhecido neste cartão. Você ainda pode digitar os dados.';

  @override
  String get contactOpened =>
      'Contatos aberto. Toque em Salvar lá para manter o contato.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Não foi possível abrir os Contatos: $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Cartão $stamp';
  }

  @override
  String get fieldCompany => 'Empresa';

  @override
  String get fieldJobTitle => 'Cargo';

  @override
  String get fieldMobile => 'Celular';

  @override
  String get fieldPhone => 'Telefone';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Site';

  @override
  String get fieldAddress => 'Endereço';

  @override
  String get fieldCity => 'Cidade';

  @override
  String get fieldCountry => 'País';

  @override
  String get fieldNotes => 'Observações';

  @override
  String get drawFirst => 'Desenhe sua assinatura primeiro.';

  @override
  String get clear => 'Limpar';

  @override
  String get undo => 'Desfazer';

  @override
  String get save => 'Salvar';

  @override
  String get signHint =>
      'Assine na caixa com o dedo. Vire o celular de lado para ter mais espaço.';

  @override
  String get thin => 'Fino';

  @override
  String get medium => 'Médio';

  @override
  String get thick => 'Grosso';

  @override
  String couldNotReadPage(String error) {
    return 'Não foi possível ler a página: $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Não foi possível assinar: $error';
  }

  @override
  String get placeSignature => 'Posicionar assinatura';

  @override
  String get apply => 'Aplicar';

  @override
  String get dragPinchHint =>
      'Arraste para mover. Faça pinça para redimensionar.';

  @override
  String get smaller => 'Menor';

  @override
  String get larger => 'Maior';
}
