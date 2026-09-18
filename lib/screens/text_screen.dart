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
    WidgetsBinding.instance.addPostFrameCallback((_) => _run());
  }

  Future<void> _run({bool force = false}) async {
    final l = context.l10n;
    setState(() {
      _status = l.readingPage(1, widget.doc.pages.length);
      _error = null;
    });
    try {
      final text = await Ocr.document(
        widget.doc,
        force: force,
        separator: (n) => l.pageSeparator(n),
        onProgress: (done, total) {
          if (mounted && done < total) setState(() => _status = l.readingPage(done + 1, total));
        },
      );
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
            ? (e.message ?? l.ocrFailed)
            : l.ocrFailedWith(e.toString());
      });
    }
  }

  Future<void> _save() async {
    final l = context.l10n;
    final bytes = utf8.encode(_c.text);
    final p = await Exporter.saveBytes('${DocStore.safeName(widget.doc.name)}.txt',
        Uint8List.fromList(bytes), ext: 'txt', title: l.saveDialogTitle);
    if (p != null && mounted) context.snack(l.textSaved);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    final busy = _status != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.text),
        actions: [
          IconButton(
            tooltip: l.copyAll,
            icon: const Icon(Icons.copy),
            onPressed: busy || _c.text.isEmpty
                ? null
                : () {
                    Clipboard.setData(ClipboardData(text: _c.text));
                    context.snack(l.copied);
                  },
          ),
          IconButton(
            tooltip: l.shareText,
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
                case 'devanagari':
                case 'chinese':
                case 'japanese':
                case 'korean':
                  Prefs.ocrScript = v;
                  _run(force: true);
              }
            },
            itemBuilder: (_) {
              final scripts = {
                'latin': l.readAsLatin,
                'devanagari': l.readAsDevanagari,
                'chinese': l.readAsChinese,
                'japanese': l.readAsJapanese,
                'korean': l.readAsKorean,
              };
              return [
                PopupMenuItem(value: 'save', child: ListTile(leading: const Icon(Icons.save_alt), title: Text(l.saveAsTxt))),
                PopupMenuItem(value: 'rerun', child: ListTile(leading: const Icon(Icons.refresh), title: Text(l.readAgain))),
                if (Engine.isAndroid) const PopupMenuDivider(),
                if (Engine.isAndroid)
                  for (final e in scripts.entries)
                    if (Prefs.ocrScript != e.key)
                      PopupMenuItem(value: e.key, child: ListTile(leading: const Icon(Icons.language), title: Text(e.value))),
              ];
            },
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
              if (Engine.isAndroid) Text(l.ocrModelHint, style: TextStyle(color: cs.onSurfaceVariant)),
              const SizedBox(height: 8),
              FilledButton(onPressed: () => _run(force: true), child: Text(l.tryAgain)),
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
                hintText: busy ? '' : l.noTextFound,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
        ),
      ]),
    );
  }
}
