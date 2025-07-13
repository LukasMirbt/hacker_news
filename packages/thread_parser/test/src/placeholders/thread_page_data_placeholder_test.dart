// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(ThreadListPageDataPlaceholder, () {
    test('returns $ThreadListPageData', () {
      expect(
        ThreadListPageDataPlaceholder(),
        isA<ThreadListPageData>(),
      );
    });
  });
}
