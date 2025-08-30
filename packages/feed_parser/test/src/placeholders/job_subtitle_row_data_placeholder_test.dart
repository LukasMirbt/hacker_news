import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(JobSubtitleRowDataPlaceholder, () {
    test('returns $JobSubtitleRowData', () {
      expect(
        JobSubtitleRowDataPlaceholder(),
        isA<JobSubtitleRowData>(),
      );
    });
  });
}
