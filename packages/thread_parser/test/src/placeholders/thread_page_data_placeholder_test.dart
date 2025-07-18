// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(ThreadFeedPageDataPlaceholder, () {
    test('returns $ThreadFeedPageData', () {
      expect(
        ThreadFeedPageDataPlaceholder(),
        isA<ThreadFeedPageData>(),
      );
    });
  });
}
