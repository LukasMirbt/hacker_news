import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailSubtitleRowDataPlaceholder, () {
    test('returns $DetailSubtitleRowData', () {
      expect(
        DetailSubtitleRowDataPlaceholder(),
        isA<DetailSubtitleRowData>(),
      );
    });
  });
}
