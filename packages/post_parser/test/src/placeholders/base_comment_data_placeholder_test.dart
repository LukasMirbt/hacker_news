import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(BaseCommentDataPlaceholder, () {
    test('returns $BaseCommentData', () {
      expect(
        BaseCommentDataPlaceholder(),
        isA<BaseCommentData>(),
      );
    });
  });
}
