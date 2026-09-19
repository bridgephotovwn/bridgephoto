import 'package:flutter_test/flutter_test.dart';

import 'package:bridgephoto/store.dart';

void main() {
  _folderTests();
  test('safe file names', () {
    expect(DocStore.safeName('Invoice #12 / March'), 'Invoice _12 _ March');
    expect(DocStore.safeName('   '), 'document');
  });

  test('default name has date and time', () {
    final n = DocStore.defaultName(DateTime(2026, 9, 17, 8, 5));
    expect(n, 'Scan 2026-09-17 08.05');
  });
}

// ---- folders

void _folderTests() {
  group('folders', () {
    test('a document remembers its folder across a save and reload', () {
      final d = Doc('d1', 'Invoice', 1, 1, ['p.jpg'], folder: 'Work');
      final back = Doc.fromJson(d.toJson());
      expect(back.folder, 'Work');
      expect(back.pages, ['p.jpg']);
    });

    test('a document written before folders existed loads at the top level', () {
      final old = {
        'id': 'd2',
        'name': 'Old scan',
        'created': 1,
        'modified': 1,
        'pages': ['p.jpg'],
      };
      expect(Doc.fromJson(old).folder, '');
    });
  });
}
