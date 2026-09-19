import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../engine.dart';
import '../main.dart';
import '../prefs.dart';

const kSourceUrl = 'https://github.com/bridgephotovwn/bridgephoto';
const kPrivacyUrl = 'https://bridgephotovwn.github.io/bridgephoto/privacy-policy.html';
const kVersion = '1.1.0';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _choose<T>(String title, T current, List<(T, String)> options,
      void Function(T) apply) async {
    final v = await showDialog<T>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: Text(title),
        children: [
          for (final o in options)
            ListTile(
              leading: Icon(o.$1 == current ? Icons.radio_button_checked : Icons.radio_button_unchecked),
              title: Text(o.$2),
              onTap: () => Navigator.pop(ctx, o.$1),
            ),
        ],
      ),
    );
    if (v != null) setState(() => apply(v));
  }

  String _label<T>(T v, List<(T, String)> options) =>
      options.firstWhere((o) => o.$1 == v, orElse: () => options.first).$2;

  Future<void> _open(String url) async {
    var ok = false;
    try {
      ok = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (_) {
      ok = false;
    }
    if (!ok && mounted) context.snack(context.l10n.couldNotOpenUrl(url));
  }

  /// The words stamped across every exported page. Empty turns it off.
  Future<void> _editStamp() async {
    final l = context.l10n;
    final c = TextEditingController(text: Prefs.pdfStamp);
    final v = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.stampText),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(l.stampHint),
          const SizedBox(height: 12),
          TextField(
            controller: c,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, c.text), child: Text(l.ok)),
        ],
      ),
    );
    if (v != null) setState(() => Prefs.pdfStamp = v.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    final android = Engine.isAndroid;

    final modes = [('full', l.modeFull), ('filter', l.modeFilter), ('base', l.modeBase)];
    final limits = [for (final n in [10, 25, 50, 100]) (n, l.nPages(n))];
    final sizes = [('a4', 'A4'), ('letter', 'US Letter'), ('fit', l.fitScan)];
    final scripts = [
      ('latin', l.scriptLatin),
      ('devanagari', l.scriptDevanagari),
      ('arabic', l.scriptArabic),
      ('chinese', l.scriptChinese),
      ('japanese', l.scriptJapanese),
      ('korean', l.scriptKorean),
    ];
    final qualities = [('best', l.qualityBest), ('fast', l.qualityFast)];
    final themes = [('system', l.themeSystem), ('light', l.themeLight), ('dark', l.themeDark)];

    Widget header(String t) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Text(t, style: TextStyle(color: cs.primary, fontWeight: FontWeight.w600)),
        );

    return Scaffold(
      appBar: AppBar(title: Text(l.settings)),
      body: ListView(children: [
        header(l.scanner),
        if (android)
          ListTile(
            title: Text(l.scanMode),
            subtitle: Text(_label(Prefs.scannerMode, modes)),
            onTap: () => _choose(l.scanMode, Prefs.scannerMode, modes, (v) => Prefs.scannerMode = v),
          ),
        if (android)
          SwitchListTile(
            title: Text(l.allowGallery),
            subtitle: Text(l.allowGalleryHint),
            value: Prefs.galleryImport,
            onChanged: (v) => setState(() => Prefs.galleryImport = v),
          ),
        ListTile(
          title: Text(l.pagesPerScan),
          subtitle: Text(_label(Prefs.pageLimit, limits)),
          onTap: () => _choose(l.pagesPerScan, Prefs.pageLimit, limits, (v) => Prefs.pageLimit = v),
        ),
        if (!android)
          ListTile(
            leading: Icon(Icons.info_outline, color: cs.onSurfaceVariant),
            title: Text(l.iosScannerNote),
            subtitle: Text(l.iosScannerNote2),
          ),
        header(l.pdf),
        ListTile(
          title: Text(l.pageSize),
          subtitle: Text(_label(Prefs.pdfSize, sizes)),
          onTap: () => _choose(l.pageSize, Prefs.pdfSize, sizes, (v) => Prefs.pdfSize = v),
        ),
        SwitchListTile(
          title: Text(l.searchablePdf),
          subtitle: Text(l.searchablePdfHint),
          value: Prefs.pdfOcr,
          onChanged: (v) => setState(() => Prefs.pdfOcr = v),
        ),
        SwitchListTile(
          title: Text(l.autoName),
          subtitle: Text(l.autoNameHint),
          value: Prefs.autoName,
          onChanged: (v) => setState(() => Prefs.autoName = v),
        ),
        SwitchListTile(
          title: Text(l.numberPages),
          subtitle: Text(l.numberPagesHint),
          value: Prefs.pdfPageNumbers,
          onChanged: (v) => setState(() => Prefs.pdfPageNumbers = v),
        ),
        ListTile(
          title: Text(l.stampText),
          subtitle: Text(Prefs.pdfStamp.trim().isEmpty ? l.stampNone : Prefs.pdfStamp),
          onTap: _editStamp,
        ),
        header(l.textRecognition),
        if (android)
          ListTile(
            title: Text(l.quality),
            subtitle: Text(_label(Prefs.ocrQuality, qualities)),
            onTap: () => _choose(l.quality, Prefs.ocrQuality, qualities, (v) => Prefs.ocrQuality = v),
          ),
        if (android)
          ListTile(
            title: Text(l.language),
            subtitle: Text(_label(Prefs.ocrScript, scripts)),
            onTap: () => _choose(l.language, Prefs.ocrScript, scripts, (v) => Prefs.ocrScript = v),
          )
        else
          ListTile(
            leading: Icon(Icons.info_outline, color: cs.onSurfaceVariant),
            title: Text(l.languageAuto),
          ),
        header(l.appearance),
        ListTile(
          title: Text(l.theme),
          subtitle: Text(_label(Prefs.theme, themes)),
          onTap: () => _choose(l.theme, Prefs.theme, themes, (v) => Prefs.theme = v),
        ),
        header(l.about),
        ListTile(
          leading: const Icon(Icons.verified_user_outlined),
          title: Text(l.aboutPromise),
          subtitle: Text(l.aboutPromiseBody),
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: Text(l.openSource),
          subtitle: const Text(kSourceUrl),
          onTap: () => _open(kSourceUrl),
        ),
        ListTile(
          leading: const Icon(Icons.policy_outlined),
          title: Text(l.privacyPolicy),
          subtitle: Text(l.opensInBrowser),
          onTap: () => _open(kPrivacyUrl),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text('${l.appName} $kVersion'),
          subtitle: Text(android ? l.aboutTechAndroid : l.aboutTechIos),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
