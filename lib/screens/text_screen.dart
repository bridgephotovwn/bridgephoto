import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../exporter.dart';
import '../main.dart';
import '../ocr.dart';
import '../prefs.dart';
import '../store.dart';

/// Recognised text of the whole document. Editable, so mistakes can be fixed
/// before copying or sharing.
class TextScreen extends StatefulWidget {
  final Doc doc;
  const TextScreen({super.key, required this.doc});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final _c = TextEditingController();
  String? _status;
  String? _error;

  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run({bool force = false}) async {
    setState(() {
      _status = 'Reading page 1 / ${widget.doc.pages.length}';
      _error = null;
    });
    try {
      final text = await Ocr.document(widget.doc, force: force, onProgress: (done, total) {
        if (mounted && done < total) setState(() => _status = 'Reading page ${done + 1} / $total');
      });
      if (!mounted) return;
      setState(() {
        _c.text = text;
        _status = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _status = null;
        _error = e is PlatformException
            ? (e.message ?? 'Text recognition failed.')
            : 'Text recognition failed: $e';
      });
    }
  }

  Future<void> _save() async {
    final bytes = utf8.encode(_c.text);
    final p = await Exporter.saveBytes('${DocStore.safeName(widget.doc.name)}.txt',
        Uint8List.fromList(bytes), ext: 'txt');
    if (p != null && mounted) context.snack('Text saved.');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final busy = _status != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
        actions: [
          IconButton(
            tooltip: 'Copy all',
            icon: const Icon(Icons.copy),
            onPressed: busy || _c.text.isEmpty
                ? null
                : () {
                    Clipboard.setData(ClipboardData(text: _c.text));
                    context.snack('Copied.');
                  },
          ),
          IconButton(
            tooltip: 'Share text',
            icon: const Icon(Icons.share),
            onPressed: busy || _c.text.isEmpty ? null : () => Exporter.shareText(context, _c.text, subject: widget.doc.name),
          ),
          PopupMenuButton<String>(
            onSelected: (v) {
              switch (v) {
                case 'save':
                  _save();
                case 'rerun':
                  _run(force: true);
                case 'latin':
                  Prefs.ocrScript = 'latin';
                  _run(force: true);
                case 'devanagari':
                  Prefs.ocrScript = 'devanagari';
                  _run(force: true);
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'save', child: ListTile(leading: Icon(Icons.save_alt), title: Text('Save as .txt'))),
              const PopupMenuItem(value: 'rerun', child: ListTile(leading: Icon(Icons.refresh), title: Text('Read again'))),
              if (Engine.isAndroid && Prefs.ocrScript != 'latin')
                const PopupMenuItem(value: 'latin', child: ListTile(leading: Icon(Icons.language), title: Text('Read as English / Latin'))),
              if (Engine.isAndroid && Prefs.ocrScript != 'devanagari')
                const PopupMenuItem(value: 'devanagari', child: ListTile(leading: Icon(Icons.language), title: Text('Read as Hindi / Nepali'))),
            ],
          ),
        ],
      ),
      body: Column(children: [
        if (busy) const LinearProgressIndicator(),
        if (busy)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(_status!, style: TextStyle(color: cs.onSurfaceVariant)),
          ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Text(_error!, style: TextStyle(color: cs.error)),
              const SizedBox(height: 8),
              Text(
                'On Android the text model is downloaded once by Google Play services. '
                'If this is the first use, wait a minute and try again.',
                style: TextStyle(color: cs.onSurfaceVariant),
              ),
              const SizedBox(height: 8),
              FilledButton(onPressed: () => _run(force: true), child: const Text('Try again')),
            ]),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: TextField(
              controller: _c,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              readOnly: busy,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: busy ? '' : 'No text was found.',
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
        ),
      ]),
    );
  }
}
