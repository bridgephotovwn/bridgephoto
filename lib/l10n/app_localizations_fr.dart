// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'BRIDGE PHOTO';

  @override
  String get scan => 'Numériser';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Fermer';

  @override
  String get delete => 'Supprimer';

  @override
  String get share => 'Partager';

  @override
  String get copy => 'Copier';

  @override
  String get copied => 'Copié.';

  @override
  String get saved => 'Enregistré.';

  @override
  String get name => 'Nom';

  @override
  String get rename => 'Renommer';

  @override
  String get settings => 'Réglages';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get cannotBeUndone => 'Cette action est irréversible.';

  @override
  String get savingPages => 'Enregistrement des pages…';

  @override
  String get preparingScanner =>
      'Préparation du scanner…\nPremière utilisation : les services Google Play le téléchargent une seule fois.';

  @override
  String get scannerUnavailable => 'Le scanner n\'est pas disponible.';

  @override
  String scannerUnavailableWith(String error) {
    return 'Le scanner n\'est pas disponible : $error';
  }

  @override
  String couldNotSavePages(String error) {
    return 'Impossible d\'enregistrer les pages : $error';
  }

  @override
  String couldNotOpenPicker(String error) {
    return 'Impossible d\'ouvrir le sélecteur de fichiers : $error';
  }

  @override
  String get importingPdf => 'Importation du PDF…';

  @override
  String get importedPdf => 'PDF importé';

  @override
  String couldNotImport(String error) {
    return 'Impossible d\'importer : $error';
  }

  @override
  String get pickTwoPdfs => 'Choisissez au moins deux fichiers PDF.';

  @override
  String mergingPdfs(int count) {
    return 'Fusion de $count fichiers PDF…';
  }

  @override
  String mergedFileName(String stamp) {
    return 'Fusion $stamp';
  }

  @override
  String couldNotMerge(String error) {
    return 'Impossible de fusionner : $error';
  }

  @override
  String get saveToFolder => 'Enregistrer dans un dossier';

  @override
  String couldNotSave(String error) {
    return 'Impossible d\'enregistrer : $error';
  }

  @override
  String get mergedDocument => 'Document fusionné';

  @override
  String mergedDefaultName(String first, int count) {
    return '$first + $count autres';
  }

  @override
  String get merging => 'Fusion en cours…';

  @override
  String deleteDocumentsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count documents ?',
      one: 'Supprimer 1 document ?',
    );
    return '$_temp0';
  }

  @override
  String get buildingPdf => 'Création du PDF…';

  @override
  String buildingPdfN(int n, int total) {
    return 'Création du PDF $n / $total…';
  }

  @override
  String buildingPdfPage(int n, int total) {
    return 'Création du PDF, page $n / $total';
  }

  @override
  String couldNotBuildPdf(String error) {
    return 'Impossible de créer le PDF : $error';
  }

  @override
  String get searchDocuments => 'Rechercher des documents';

  @override
  String get closeSearch => 'Fermer la recherche';

  @override
  String get search => 'Rechercher';

  @override
  String get importPdfAsPages => 'Importer un PDF comme pages';

  @override
  String get mergePdfFiles => 'Fusionner des fichiers PDF';

  @override
  String get clearSelection => 'Effacer la sélection';

  @override
  String nSelected(int count) {
    return '$count sélectionnés';
  }

  @override
  String nSelectedMergeOrder(int count) {
    return '$count sélectionnés · fusion dans cet ordre';
  }

  @override
  String get mergeIntoOne => 'Fusionner en un seul document';

  @override
  String get shareAsPdf => 'Partager en PDF';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get noScansYet => 'Aucune numérisation pour le moment';

  @override
  String get nothingMatches => 'Aucun résultat';

  @override
  String get emptyHint =>
      'Touchez Numériser pour photographier un document. Tout reste sur ce téléphone.';

  @override
  String get tryAnotherWord => 'Essayez un autre mot.';

  @override
  String nPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String pagesAndDate(String pages, String date) {
    return '$pages · $date';
  }

  @override
  String scanDefaultName(String stamp) {
    return 'Numérisation $stamp';
  }

  @override
  String get crashTitle => 'BRIDGE PHOTO s\'est fermé de façon inattendue';

  @override
  String get crashBody =>
      'Un rapport de l\'incident a été enregistré sur ce téléphone uniquement. Le partager avec le développeur aide à corriger le problème. Il contient des détails techniques, pas vos documents.';

  @override
  String get reportCopied => 'Rapport copié.';

  @override
  String get crashReportSubject => 'Rapport de plantage BRIDGE PHOTO';

  @override
  String get pdfSaved => 'PDF enregistré.';

  @override
  String couldNotSavePdf(String error) {
    return 'Impossible d\'enregistrer le PDF : $error';
  }

  @override
  String get exportPagesAsImages => 'Exporter les pages en images';

  @override
  String get saveToPhotos => 'Enregistrer dans Photos';

  @override
  String get savingToPhotos => 'Enregistrement dans Photos…';

  @override
  String get photosNeedsAndroid10 =>
      'L\'enregistrement dans Photos nécessite Android 10 ou plus récent. Utilisez plutôt Partager.';

  @override
  String get photosNotAllowed =>
      'BRIDGE PHOTO n\'est pas autorisé à ajouter des éléments à Photos. Autorisez-le dans les Réglages, ou utilisez Partager.';

  @override
  String imagesSavedToPhotos(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images enregistrées dans Photos.',
      one: '1 image enregistrée dans Photos.',
    );
    return '$_temp0';
  }

  @override
  String couldNotExport(String error) {
    return 'Impossible d\'exporter : $error';
  }

  @override
  String get deleteDocumentQuestion => 'Supprimer ce document ?';

  @override
  String deleteDocumentBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages seront supprimées. Cette action est irréversible.',
      one: '1 page sera supprimée. Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get textOcr => 'Texte (OCR)';

  @override
  String get sharePdf => 'Partager le PDF';

  @override
  String get savePdfToFolder => 'Enregistrer le PDF dans un dossier';

  @override
  String get exportAsImages => 'Exporter en JPEG / PNG';

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
  String get deleteDocument => 'Supprimer le document';

  @override
  String get noPages => 'Aucune page. Touchez Ajouter des pages.';

  @override
  String get addPages => 'Ajouter des pages';

  @override
  String get holdToReorder => 'maintenez une page pour la déplacer';

  @override
  String get savePdfDialogTitle => 'Enregistrer le PDF';

  @override
  String get saveDialogTitle => 'Enregistrer';

  @override
  String couldNotRotate(String error) {
    return 'Impossible de pivoter : $error';
  }

  @override
  String couldNotShare(String error) {
    return 'Impossible de partager : $error';
  }

  @override
  String get noTextOnPage => 'Aucun texte trouvé sur cette page.';

  @override
  String pageNText(int n) {
    return 'Texte de la page $n';
  }

  @override
  String deletePageQuestion(int n) {
    return 'Supprimer la page $n ?';
  }

  @override
  String pageNOfTotal(int n, int total) {
    return 'Page $n sur $total';
  }

  @override
  String get rotateLeft => 'Pivoter à gauche';

  @override
  String get rotateRight => 'Pivoter à droite';

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
  String get undo => 'Annuler';

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
  String get sign => 'Signer';

  @override
  String get copyText => 'Copier le texte';

  @override
  String get shareImage => 'Partager l\'image';

  @override
  String get deletePage => 'Supprimer la page';

  @override
  String get signed => 'Signé.';

  @override
  String signPageN(int n) {
    return 'Signer la page $n';
  }

  @override
  String get deleteThisSignature => 'Supprimer cette signature';

  @override
  String get newSignature => 'Nouvelle signature';

  @override
  String readingPage(int n, int total) {
    return 'Lecture de la page $n / $total';
  }

  @override
  String get ocrFailed => 'La reconnaissance de texte a échoué.';

  @override
  String ocrFailedWith(String error) {
    return 'La reconnaissance de texte a échoué : $error';
  }

  @override
  String get textSaved => 'Texte enregistré.';

  @override
  String get text => 'Texte';

  @override
  String get copyAll => 'Tout copier';

  @override
  String get shareText => 'Partager le texte';

  @override
  String get saveAsTxt => 'Enregistrer en .txt';

  @override
  String get readAgain => 'Relire';

  @override
  String get readAsLatin => 'Lire en anglais / latin';

  @override
  String get readAsDevanagari => 'Lire en hindi / népalais';

  @override
  String get readAsArabic => 'Read as Arabic';

  @override
  String get ocrModelHint =>
      'Sur Android, le modèle de texte est téléchargé une seule fois par les services Google Play. S\'il s\'agit de la première utilisation, patientez une minute et réessayez.';

  @override
  String get noTextFound => 'Aucun texte trouvé.';

  @override
  String pageSeparator(int n) {
    return '--- Page $n ---';
  }

  @override
  String get scanner => 'Numérisation';

  @override
  String get scanMode => 'Mode de numérisation';

  @override
  String get modeFull =>
      'Complet : filtres + nettoyage des taches et des doigts';

  @override
  String get modeFilter => 'Filtres uniquement';

  @override
  String get modeBase => 'Basique : recadrage et rotation uniquement';

  @override
  String get allowGallery => 'Autoriser l\'import depuis la galerie';

  @override
  String get allowGalleryHint => 'Affiche un bouton Galerie dans le scanner';

  @override
  String get pagesPerScan => 'Pages par numérisation';

  @override
  String get iosScannerNote =>
      'Sur iPhone, le scanner est la caméra de documents d\'Apple.';

  @override
  String get iosScannerNote2 =>
      'La capture automatique, la détection des bords et les modes de couleur sont intégrés.';

  @override
  String get pdf => 'PDF';

  @override
  String get pageSize => 'Taille de page';

  @override
  String get usLetter => 'US Letter';

  @override
  String get fitScan => 'Même format que la numérisation';

  @override
  String get searchablePdf => 'PDF avec recherche';

  @override
  String get searchablePdfHint =>
      'Ajoute une couche de texte invisible pour pouvoir rechercher dans le PDF et copier le texte';

  @override
  String get textRecognition => 'Reconnaissance de texte';

  @override
  String get quality => 'Qualité';

  @override
  String get qualityBest =>
      'Optimale : pleine résolution, lit les petits caractères';

  @override
  String get qualityFast => 'Rapide : copie réduite de la page';

  @override
  String get language => 'Langue';

  @override
  String get scriptLatin => 'Anglais et autres langues à alphabet latin';

  @override
  String get scriptDevanagari => 'Hindi, népalais, marathi (+ latin)';

  @override
  String get scriptArabic => 'Arabic (+ Latin)';

  @override
  String get scriptChinese => 'Chinois (+ latin)';

  @override
  String get scriptJapanese => 'Japonais (+ latin)';

  @override
  String get scriptKorean => 'Coréen (+ latin)';

  @override
  String get readAsChinese => 'Lire en chinois';

  @override
  String get readAsJapanese => 'Lire en japonais';

  @override
  String get readAsKorean => 'Lire en coréen';

  @override
  String get languageAuto => 'La langue est détectée automatiquement.';

  @override
  String get appearance => 'Apparence';

  @override
  String get theme => 'Thème';

  @override
  String get themeSystem => 'Comme le téléphone';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get about => 'À propos';

  @override
  String get aboutPromise => 'Pas de publicité. Pas de compte. Pas de suivi.';

  @override
  String get aboutPromiseBody =>
      'Les numérisations restent sur ce téléphone, sauf si vous les partagez ou les exportez. Désinstaller l\'application les supprime : exportez ce que vous voulez conserver.';

  @override
  String get openSource => 'Code source ouvert (Apache-2.0)';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get opensInBrowser => 'S\'ouvre dans votre navigateur';

  @override
  String get aboutTechAndroid =>
      'Numérisation et reconnaissance de texte par Google ML Kit (sur l\'appareil). Fusion des PDF par PDFBox-Android. Police devanagari : Noto (OFL).';

  @override
  String get aboutTechIos =>
      'Numérisation par Apple VisionKit, reconnaissance de texte par Apple Vision (sur l\'appareil). Police devanagari : Noto (OFL).';

  @override
  String couldNotOpenUrl(String url) {
    return 'Impossible d\'ouvrir $url';
  }

  @override
  String get scanBusinessCard => 'Numériser une carte de visite';

  @override
  String get saveAsContact => 'Enregistrer comme contact';

  @override
  String get saveToContacts => 'Enregistrer dans Contacts';

  @override
  String get includeCardPhoto => 'Add the card photo';

  @override
  String get contactReviewTitle => 'Carte de visite';

  @override
  String get contactHint =>
      'Vérifiez les champs, puis enregistrez. L\'app Contacts de votre téléphone s\'ouvre avec tout déjà rempli.';

  @override
  String get readingCard => 'Lecture de la carte…';

  @override
  String get nothingRecognised =>
      'Aucun texte n\'a été reconnu sur cette carte. Vous pouvez tout de même saisir les informations.';

  @override
  String get contactOpened =>
      'L\'app Contacts est ouverte. Touchez-y Enregistrer pour conserver le contact.';

  @override
  String couldNotOpenContacts(String error) {
    return 'Impossible d\'ouvrir Contacts : $error';
  }

  @override
  String cardDefaultName(String stamp) {
    return 'Carte $stamp';
  }

  @override
  String get fieldCompany => 'Société';

  @override
  String get fieldJobTitle => 'Fonction';

  @override
  String get fieldMobile => 'Mobile';

  @override
  String get fieldPhone => 'Téléphone';

  @override
  String get fieldFax => 'Fax';

  @override
  String get fieldEmail => 'E-mail';

  @override
  String get fieldWebsite => 'Site web';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'Ville';

  @override
  String get fieldCountry => 'Pays';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get drawFirst => 'Dessinez d\'abord votre signature.';

  @override
  String get clear => 'Effacer';

  @override
  String get save => 'Enregistrer';

  @override
  String get signHint =>
      'Signez dans le cadre avec le doigt. Tournez le téléphone à l\'horizontale pour avoir plus de place.';

  @override
  String get thin => 'Fin';

  @override
  String get medium => 'Moyen';

  @override
  String get thick => 'Épais';

  @override
  String couldNotReadPage(String error) {
    return 'Impossible de lire la page : $error';
  }

  @override
  String couldNotSign(String error) {
    return 'Impossible de signer : $error';
  }

  @override
  String get placeSignature => 'Placer la signature';

  @override
  String get apply => 'Appliquer';

  @override
  String get dragPinchHint =>
      'Faites glisser pour déplacer. Pincez pour redimensionner.';

  @override
  String get smaller => 'Plus petite';

  @override
  String get larger => 'Plus grande';
}
