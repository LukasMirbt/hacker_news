// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(BaseTitleRowDataPlaceholder, () {
    test('returns $BaseTitleRowData', () {
      expect(
        BaseTitleRowDataPlaceholder(),
        isA<BaseTitleRowData>(),
      );
    });
  });
}
