// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(JobTitleRowDataPlaceholder, () {
    test('returns $JobTitleRowData', () {
      expect(
        JobTitleRowDataPlaceholder(),
        isA<JobTitleRowData>(),
      );
    });
  });
}
