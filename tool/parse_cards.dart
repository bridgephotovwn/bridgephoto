// Batch harness for the business-card parser.
//   dart run tool/parse_cards.dart <folder-with-txt-files>
// Prints one JSON object per .txt file (the OCR text of a card) with the
// parsed fields, so the results can be checked against the card image.
import 'dart:convert';
import 'dart:io';

import 'package:bridgephoto/card_parser.dart';

void main(List<String> args) {
  final dir = Directory(args.isEmpty ? '.' : args.first);
  final files = dir.listSync().whereType<File>().where((f) => f.path.toLowerCase().endsWith('.txt')).toList()
    ..sort((a, b) => a.path.compareTo(b.path));
  for (final f in files) {
    final card = parseCard(f.readAsStringSync());
    final out = <String, dynamic>{'file': f.uri.pathSegments.last, ...card.toMap()};
    stdout.writeln(jsonEncode(out));
  }
}
