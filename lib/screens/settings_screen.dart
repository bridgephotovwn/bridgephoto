import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../engine.dart';
import '../main.dart';
import '../prefs.dart';

const kSourceUrl = 'https://github.com/OWNER/bridgephoto'; // TODO: real repository
const kPrivacyUrl = 'https://OWNER.github.io/bridgephoto/privacy-policy.html'; // TODO: real page
const kVersion = '1.0.0';

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
    if (!ok && mounted) context.snack('Could not open $url');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final android = Engine.isAndroid;

    const modes = [
      ('full', 'Full: filters + clean stains and fingers'),
      ('filter', 'Filters only'),
      ('base', 'Basic: crop and rotate only'),
    ];
    const limits = [(10, '10 pages'), (25, '25 pages'), (50, '50 pages'), (100, '100 pages')];
    const sizes = [('a4', 'A4'), ('letter', 'US Letter'), ('fit', 'Same shape as the scan')];
    const scripts = [('latin', 'English and other Latin-script languages'), ('devanagari', 'Hindi, Nepali, Marathi (+ Latin)')];
    const qualities = [('best', 'Best: full resolution, reads small print'), ('fast', 'Fast: smaller copy of the page')];
    const themes = [('system', 'Follow the phone'), ('light', 'Light'), ('dark', 'Dark')];

    Widget header(String t) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Text(t, style: TextStyle(color: cs.primary, fontWeight: FontWeight.w600)),
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(children: [
        header('Scanner'),
        if (android)
          ListTile(
            title: const Text('Scan mode'),
            subtitle: Text(_label(Prefs.scannerMode, modes)),
            onTap: () => _choose('Scan mode', Prefs.scannerMode, modes, (v) => Prefs.scannerMode = v),
          ),
        if (android)
          SwitchListTile(
            title: const Text('Allow import from gallery'),
            subtitle: const Text('Shows a gallery button inside the scanner'),
            value: Prefs.galleryImport,
            onChanged: (v) => setState(() => Prefs.galleryImport = v),
          ),
        ListTile(
          title: const Text('Pages per scan'),
          subtitle: Text(_label(Prefs.pageLimit, limits)),
          onTap: () => _choose('Pages per scan', Prefs.pageLimit, limits, (v) => Prefs.pageLimit = v),
        ),
        if (!android)
          ListTile(
            leading: Icon(Icons.info_outline, color: cs.onSurfaceVariant),
            title: const Text('On iPhone the scanner is Apple\'s own document camera.'),
            subtitle: const Text('Automatic capture, edge detection and colour modes are built in.'),
          ),
        header('PDF'),
        ListTile(
          title: const Text('Page size'),
          subtitle: Text(_label(Prefs.pdfSize, sizes)),
          onTap: () => _choose('Page size', Prefs.pdfSize, sizes, (v) => Prefs.pdfSize = v),
        ),
        SwitchListTile(
          title: const Text('Searchable PDF'),
          subtitle: const Text('Adds an invisible text layer so the PDF can be searched and text copied'),
          value: Prefs.pdfOcr,
          onChanged: (v) => setState(() => Prefs.pdfOcr = v),
        ),
        header('Text recognition'),
        if (android)
          ListTile(
            title: const Text('Quality'),
            subtitle: Text(_label(Prefs.ocrQuality, qualities)),
            onTap: () => _choose('Quality', Prefs.ocrQuality, qualities, (v) => Prefs.ocrQuality = v),
          ),
        if (android)
          ListTile(
            title: const Text('Language'),
            subtitle: Text(_label(Prefs.ocrScript, scripts)),
            onTap: () => _choose('Language', Prefs.ocrScript, scripts, (v) => Prefs.ocrScript = v),
          )
        else
          ListTile(
            leading: Icon(Icons.info_outline, color: cs.onSurfaceVariant),
            title: const Text('The language is detected automatically.'),
          ),
        header('Appearance'),
        ListTile(
          title: const Text('Theme'),
          subtitle: Text(_label(Prefs.theme, themes)),
          onTap: () => _choose('Theme', Prefs.theme, themes, (v) => Prefs.theme = v),
        ),
        header('About'),
        const ListTile(
          leading: Icon(Icons.verified_user_outlined),
          title: Text('No ads. No account. No tracking.'),
          subtitle: Text('Scans stay on this phone unless you share or export them. '
              'Uninstalling the app deletes them, so export what you want to keep.'),
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('Open source (Apache-2.0)'),
          subtitle: const Text(kSourceUrl),
          onTap: () => _open(kSourceUrl),
        ),
        ListTile(
          leading: const Icon(Icons.policy_outlined),
          title: const Text('Privacy policy'),
          subtitle: const Text('Opens in your browser'),
          onTap: () => _open(kPrivacyUrl),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('BRIDGE PHOTO $kVersion'),
          subtitle: Text(android
              ? 'Scanning and text recognition by Google ML Kit (on device). PDF merge by PDFBox-Android. Devanagari font: Noto (OFL).'
              : 'Scanning by Apple VisionKit, text recognition by Apple Vision (on device). Devanagari font: Noto (OFL).'),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
