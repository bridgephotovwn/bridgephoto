import 'package:flutter_test/flutter_test.dart';

import 'package:bridgephoto/store.dart';

void main() {
  test('safe file names', () {
    expect(DocStore.safeName('Invoice #12 / March'), 'Invoice _12 _ March');
    expect(DocStore.safeName('   '), 'document');
  });

  test('default name has date and time', () {
    final n = DocStore.defaultName(DateTime(2026, 9, 17, 8, 5));
    expect(n, 'Scan 2026-09-17 08.05');
  });
}
