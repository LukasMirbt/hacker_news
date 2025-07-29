import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(OtherUserThreadCommentDataPlaceholder, () {
    test('returns $OtherUserThreadCommentData', () {
      expect(
        OtherUserThreadCommentDataPlaceholder(),
        isA<OtherUserThreadCommentData>(),
      );
    });
  });
}
