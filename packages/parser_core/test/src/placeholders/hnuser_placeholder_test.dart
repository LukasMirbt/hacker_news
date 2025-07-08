// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:parser_core/parser_core.dart';

void main() {
  group(HnuserPlaceholder, () {
    test('returns $Hnuser', () {
      expect(
        HnuserPlaceholder(),
        isA<Hnuser>(),
      );
    });
  });
}
