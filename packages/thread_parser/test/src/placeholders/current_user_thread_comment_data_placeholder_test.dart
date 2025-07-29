import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(CurrentUserThreadCommentDataPlaceholder, () {
    test('returns $CurrentUserThreadCommentData', () {
      expect(
        CurrentUserThreadCommentDataPlaceholder(),
        isA<CurrentUserThreadCommentData>(),
      );
    });
  });
}
