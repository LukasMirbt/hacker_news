import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(SubtitleRowDataPlaceholder, () {
    test('returns $SubtitleRowData', () {
      expect(
        SubtitleRowDataPlaceholder(),
        isA<SubtitleRowData>(),
      );
    });
  });
}
