import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../engine.dart';
import '../id_numbers.dart';
import '../exporter.dart';
import '../main.dart';
import '../ocr.dart';
import '../signatures.dart';
import '../store.dart';
import 'contact_screen.dart';
import 'redact_screen.dart';
import 'sign_place_screen.dart';

/// One page, full screen, with rotate / sign / share / copy text / delete.
class PageScreen extends StatefulWidget {
  final Doc doc;
  final int index;
  const PageScreen({super.key, required this.doc, required this.index});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  late final PageController _pc = PageController(initialPage: widget.index);
  late int _index = widget.index;
  bool _busy = false;
  bool _zoomed = false; // while zoomed the PageView stops swiping so the page can be panned
  final _tcs = <int, TransformationController>{};

  Doc get d => widget.doc;
  String get page => d.pages[_index];

  TransformationController _tc(int i) =>
      _tcs.putIfAbsent(i, TransformationController.new);

  @override
  void dispose() {
    for (final c in _tcs.values) {
      c.dispose();
    }
    _pc.dispose();
    super.dispose();
  }

  static String _msg(Object e) {
    if (e is PlatformException) return e.message ?? e.code;
    return e.toString().replaceFirst('Exception: ', '');
  }

  Future<void> _rotate(int degrees) async {
    setState(() => _busy = true);
    try {
      final f = d.pageFile(page);
      await Engine.transform(f.path, f.path, rotate: degrees);
      await Ocr.invalidate(d, page);
      await DocStore.save(d); // bumps `modified`, which keys every thumbnail
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      _tc(_index).value = Matrix4.identity();
      _zoomed = false;
    } catch (e) {
      if (mounted) context.snack(context.l10n.couldNotRotate(_msg(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Finds ID numbers on the page and offers to cover them.
  ///
  /// India's own advice is not to hand out a plain photocopy of an Aadhaar
  /// card; the official masked version hides the first eight digits. The
  /// number is confirmed by its check digit before anything is proposed, so
  /// an invoice reference is not mistaken for one — and even then the app
  /// only DRAWS the box. A person looks at the page and decides.
  Future<void> _hideIdNumbers() async {
    final l = context.l10n;
    setState(() => _busy = true);
    List<IdFound> found;
    try {
      found = IdNumbers.find(await Ocr.page(d, page));
    } catch (e) {
      if (mounted) context.snack(_msg(e));
      return;
    } finally {
      if (mounted) setState(() => _busy = false);
    }
    if (!mounted) return;
    if (found.isEmpty) {
      context.snack(l.noIdNumbersFound);
      return;
    }
    context.snack(l.idNumbersFound(found.length, found.first.masked));
    final done = await Navigator.of(context).push<bool>(MaterialPageRoute(
      builder: (_) => RedactScreen(
        doc: d,
        page: page,
        proposed: [
          for (final f in found)
            Rect.fromLTRB(f.left.toDouble(), f.top.toDouble(),
                f.right.toDouble(), f.bottom.toDouble()),
        ],
      ),
    ));
    if (done == true && mounted) {
      _tc(_index).value = Matrix4.identity();
      setState(() => _zoomed = false);
    }
  }

  /// Covers parts of the page for good. The screen does the work; here we
  /// only reload, because the page on disk has changed underneath us.
  Future<void> _redact() async {
    final done = await Navigator.of(context).push<bool>(MaterialPageRoute(
        builder: (_) => RedactScreen(doc: d, page: page)));
    if (done == true && mounted) {
      _tc(_index).value = Matrix4.identity();
      setState(() => _zoomed = false);
    }
  }

  /// Splits a photograph of an open book into its two pages, cutting at the
  /// fold. The order matters: an Arabic or Urdu book reads the other way
  /// round, so the user says which side comes first rather than us guessing.
  Future<void> _splitBook() async {
    final l = context.l10n;
    final rightFirst = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.splitBookTitle),
        content: Text(l.splitBookHint),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l.rightPageFirst)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l.leftPageFirst)),
        ],
      ),
    );
    if (rightFirst == null || !mounted) return;
    setState(() => _busy = true);
    try {
      final p = page;
      final leftName = DocStore.newPageName();
      final rightName = DocStore.newPageName();
      final at = await Engine.splitSpread(
          d.pageFile(p).path, d.pageFile(leftName).path, d.pageFile(rightName).path);
      final i = d.pages.indexOf(p);
      await DocStore.removePage(d, p); // takes the file, its text and its original
      d.pages.insertAll(
          i.clamp(0, d.pages.length), rightFirst ? [rightName, leftName] : [leftName, rightName]);
      await DocStore.save(d);
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      _index = i.clamp(0, d.pages.length - 1);
      _pc.jumpToPage(_index);
      if (mounted) {
        // Say so when the fold was not in the middle: that is the app telling
        // the user it actually looked, rather than cutting down the centre.
        context.snack((at - 0.5).abs() < 0.01 ? l.splitInTheMiddle : l.splitAtTheFold);
      }
    } catch (e) {
      if (mounted) context.snack(l.couldNotSplit(_msg(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Cleans up the page. The scan as it came off the camera is kept the first
  /// time, so [l.enhanceOriginal] can always put it back.
  Future<void> _enhance(String mode) async {
    final l = context.l10n;
    setState(() => _busy = true);
    try {
      final f = d.pageFile(page);
      final original = d.originalFile(page);
      if (mode == 'none') {
        if (!await original.exists()) return; // nothing was ever changed
        await original.copy(f.path);
      } else {
        if (!await original.exists()) await f.copy(original.path);
        // Always work from the untouched scan: enhancing twice over darkens
        // the page a little more each time.
        final angle = await Engine.enhance(original.path, f.path,
            mode: mode, straighten: true);
        if (mounted && angle.abs() >= 0.25) {
          context.snack(l.straightenedBy(angle.abs().toStringAsFixed(1)));
        }
      }
      await Ocr.invalidate(d, page);
      await DocStore.save(d); // bumps `modified`, which keys every thumbnail
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
    } catch (e) {
      if (mounted) context.snack(l.couldNotEnhance(_msg(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _pickEnhance() async {
    final l = context.l10n;
    final modes = <(String, String, IconData)>[
      ('auto', l.enhanceAuto, Icons.auto_fix_high),
      ('grey', l.enhanceGrey, Icons.gradient),
      ('bw', l.enhanceBw, Icons.filter_b_and_w),
      ('none', l.enhanceOriginal, Icons.undo),
    ];
    final picked = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(l.enhanceTitle,
                style: Theme.of(ctx).textTheme.titleMedium),
          ),
          for (final (value, label, icon) in modes)
            ListTile(
              leading: Icon(icon),
              title: Text(label),
              onTap: () => Navigator.of(ctx).pop(value),
            ),
        ]),
      ),
    );
    if (picked != null) await _enhance(picked);
  }

  Future<void> _share() async {
    setState(() => _busy = true);
    try {
      await Exporter.cleanShareDir();
      final files = await Exporter.imageFiles(d, 'jpg', only: [page]);
      if (!mounted) return;
      setState(() => _busy = false);
      await Exporter.shareImages(context, files, 'jpg');
    } catch (e) {
      if (mounted) context.snack(context.l10n.couldNotShare(_msg(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _copyText() async {
    final l = context.l10n;
    setState(() => _busy = true);
    String text;
    try {
      text = (await Ocr.page(d, page)).text.trim();
    } catch (e) {
      if (mounted) context.snack(_msg(e));
      return;
    } finally {
      if (mounted) setState(() => _busy = false);
    }
    if (!mounted) return;
    if (text.isEmpty) {
      context.snack(l.noTextOnPage);
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.pageNText(_index + 1)),
        content: SizedBox(
          width: 600,
          child: SingleChildScrollView(child: SelectableText(text)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.close)),
          FilledButton.icon(
            icon: const Icon(Icons.copy),
            label: Text(l.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
              Navigator.pop(ctx);
              context.snack(l.copied);
            },
          ),
        ],
      ),
    );
  }

  // ---- signing

  Future<void> _sign() async {
    final sig = await _pickSignature();
    if (sig == null || !mounted) return;
    final applied = await Navigator.of(context).push<bool>(MaterialPageRoute(
        builder: (_) => SignPlaceScreen(doc: d, page: page, signature: sig)));
    if (applied == true && mounted) {
      _tc(_index).value = Matrix4.identity();
      _zoomed = false;
      setState(() {});
      context.snack(context.l10n.signed);
    }
  }

  Future<File?> _pickSignature() async {
    final l = context.l10n;
    final sigs = await SignatureStore.list();
    if (!mounted) return null;
    return showModalBottomSheet<File>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(title: Text(l.signPageN(_index + 1), style: Theme.of(ctx).textTheme.titleMedium)),
            if (sigs.isNotEmpty)
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    for (final f in sigs)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 10),
                        child: Stack(children: [
                          Card(
                            color: Colors.white,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => Navigator.pop(ctx, f),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.file(f, width: 170, height: 76, fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            top: 0,
                            child: IconButton(
                              tooltip: l.deleteThisSignature,
                              iconSize: 18,
                              icon: const Icon(Icons.close, color: Colors.black54),
                              onPressed: () async {
                                await SignatureStore.delete(f);
                                setSheet(() => sigs.remove(f));
                              },
                            ),
                          ),
                        ]),
                      ),
                  ],
                ),
              ),
            ListTile(
              leading: const Icon(Icons.draw_outlined),
              title: Text(l.newSignature),
              onTap: () async {
                final f = await Navigator.of(ctx).push<File>(
                    MaterialPageRoute(builder: (_) => const SignatureScreen()));
                if (ctx.mounted) Navigator.pop(ctx, f);
              },
            ),
            const SizedBox(height: 8),
          ]),
        ),
      ),
    );
  }

  Future<void> _delete() async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.deletePageQuestion(_index + 1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.delete)),
        ],
      ),
    );
    if (ok != true) return;
    await DocStore.removePage(d, page);
    await DocStore.save(d);
    if (!mounted) return;
    if (d.pages.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _index = _index.clamp(0, d.pages.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(l.pageNOfTotal(_index + 1, d.pages.length)),
        actions: [
          IconButton(tooltip: l.enhanceTitle, icon: const Icon(Icons.auto_fix_high), onPressed: _busy ? null : _pickEnhance),
          IconButton(tooltip: l.rotateRight, icon: const Icon(Icons.rotate_right), onPressed: _busy ? null : () => _rotate(90)),
          IconButton(tooltip: l.sign, icon: const Icon(Icons.draw_outlined), onPressed: _busy ? null : _sign),
          IconButton(tooltip: l.shareImage, icon: const Icon(Icons.share), onPressed: _busy ? null : _share),
          PopupMenuButton<String>(
            enabled: !_busy,
            onSelected: (v) {
              switch (v) {
                case 'left':
                  _rotate(-90);
                case 'text':
                  _copyText();
                case 'contact':
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ContactScreen(doc: d, page: page)));
                case 'book':
                  _splitBook();
                case 'redact':
                  _redact();
                case 'hideid':
                  _hideIdNumbers();
                case 'delete':
                  _delete();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'left', child: ListTile(leading: const Icon(Icons.rotate_left), title: Text(l.rotateLeft))),
              PopupMenuItem(value: 'text', child: ListTile(leading: const Icon(Icons.text_fields), title: Text(l.copyText))),
              PopupMenuItem(value: 'contact', child: ListTile(leading: const Icon(Icons.person_add_alt_1_outlined), title: Text(l.saveAsContact))),
              PopupMenuItem(value: 'book', child: ListTile(leading: const Icon(Icons.auto_stories_outlined), title: Text(l.splitBookTitle))),
              PopupMenuItem(value: 'redact', child: ListTile(leading: const Icon(Icons.visibility_off_outlined), title: Text(l.redactTitle))),
              PopupMenuItem(value: 'hideid', child: ListTile(leading: const Icon(Icons.badge_outlined), title: Text(l.hideIdTitle))),
              const PopupMenuDivider(),
              PopupMenuItem(value: 'delete', child: ListTile(leading: const Icon(Icons.delete_outline), title: Text(l.deletePage))),
            ],
          ),
        ],
      ),
      body: Stack(children: [
        PageView.builder(
          controller: _pc,
          physics: _zoomed ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
          itemCount: d.pages.length,
          onPageChanged: (i) => setState(() {
            _index = i;
            _zoomed = false;
          }),
          itemBuilder: (context, i) => InteractiveViewer(
            transformationController: _tc(i),
            minScale: 1,
            maxScale: 6,
            onInteractionEnd: (_) {
              final z = _tc(i).value.getMaxScaleOnAxis() > 1.01;
              if (z != _zoomed) setState(() => _zoomed = z);
            },
            child: Center(
              child: Image.file(
                d.pageFile(d.pages[i]),
                key: ValueKey('${d.pages[i]}#${d.modified}'),
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
        ),
        if (_busy) const Center(child: CircularProgressIndicator()),
      ]),
    );
  }
}
