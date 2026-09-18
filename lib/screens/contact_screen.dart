import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../card_parser.dart';
import '../engine.dart';
import '../main.dart';
import '../ocr.dart';
import '../store.dart';

/// Business card → contact fields → the phone's own Contacts app.
class ContactScreen extends StatefulWidget {
  final Doc doc;
  final String page;
  /// When true the document was created for this card and gets named after it.
  final bool nameDocument;
  const ContactScreen({super.key, required this.doc, required this.page, this.nameDocument = false});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _c = <String, TextEditingController>{
    for (final k in ['name', 'company', 'jobTitle', 'mobile', 'phone', 'fax', 'email', 'website', 'address', 'city', 'country', 'notes'])
      k: TextEditingController(),
  };
  bool _reading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _read());
  }

  @override
  void dispose() {
    for (final c in _c.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _read() async {
    final l = context.l10n;
    setState(() {
      _reading = true;
      _error = null;
    });
    try {
      final r = await Ocr.page(widget.doc, widget.page);
      final card = parseCard(r.text);
      if (!mounted) return;
      card.toMap().forEach((k, v) => _c[k]!.text = v);
      if (widget.nameDocument) {
        final title = [card.name, card.company].where((s) => s.trim().isNotEmpty).join(' – ');
        if (title.isNotEmpty) {
          widget.doc.name = title;
          await DocStore.save(widget.doc);
        }
      }
      setState(() {
        _reading = false;
        if (card.isEmpty) _error = l.nothingRecognised;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _reading = false;
        _error = e is PlatformException ? (e.message ?? l.ocrFailed) : l.ocrFailedWith('$e');
      });
    }
  }

  Future<void> _save() async {
    final l = context.l10n;
    setState(() => _saving = true);
    try {
      final fields = {for (final e in _c.entries) e.key: e.value.text.trim()};
      await Engine.addContact(fields, photo: widget.doc.pageFile(widget.page).path);
      if (mounted) context.snack(l.contactOpened);
    } catch (e) {
      if (mounted) {
        context.snack(l.couldNotOpenContacts(e is PlatformException ? (e.message ?? e.code) : '$e'));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _field(String key, String label, {TextInputType? type, int maxLines = 1, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: TextField(
        controller: _c[key],
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon == null ? null : Icon(icon),
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(l.contactReviewTitle)),
      body: Column(children: [
        if (_reading) const LinearProgressIndicator(),
        Expanded(
          child: ListView(padding: const EdgeInsets.only(top: 8, bottom: 24), children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(widget.doc.pageFile(widget.page),
                      key: ValueKey('${widget.page}#${widget.doc.modified}'),
                      width: 120,
                      height: 76,
                      fit: BoxFit.cover,
                      cacheWidth: 360),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(_reading ? l.readingCard : l.contactHint,
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ),
              ]),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Text(_error!, style: TextStyle(color: cs.error)),
              ),
            _field('name', l.name, icon: Icons.person_outline, type: TextInputType.name),
            _field('company', l.fieldCompany, icon: Icons.business_outlined),
            _field('jobTitle', l.fieldJobTitle, icon: Icons.work_outline),
            _field('mobile', l.fieldMobile, icon: Icons.smartphone, type: TextInputType.phone),
            _field('phone', l.fieldPhone, icon: Icons.phone_outlined, type: TextInputType.phone),
            _field('fax', l.fieldFax, icon: Icons.fax_outlined, type: TextInputType.phone),
            _field('email', l.fieldEmail, icon: Icons.alternate_email, type: TextInputType.emailAddress),
            _field('website', l.fieldWebsite, icon: Icons.language, type: TextInputType.url),
            _field('address', l.fieldAddress, icon: Icons.place_outlined, maxLines: 2),
            Row(children: [
              Expanded(child: _field('city', l.fieldCity, icon: Icons.location_city_outlined)),
              Expanded(child: _field('country', l.fieldCountry, icon: Icons.flag_outlined)),
            ]),
            _field('notes', l.fieldNotes, icon: Icons.notes_outlined, maxLines: 3),
          ]),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _reading || _saving ? null : _save,
                icon: const Icon(Icons.person_add_alt_1),
                label: Text(l.saveToContacts),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
