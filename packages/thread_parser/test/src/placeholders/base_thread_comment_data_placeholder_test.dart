import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(BaseThreadCommentDataPlaceholder, () {
    test('returns $BaseThreadCommentData', () {
      expect(
        BaseThreadCommentDataPlaceholder(),
        isA<BaseThreadCommentData>(),
      );
    });
  });
}
