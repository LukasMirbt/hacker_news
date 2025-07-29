import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadComment, () {
    group('from', () {
      test('returns $CurrentUserThreadComment when data '
          'is $CurrentUserThreadCommentData', () {
        final data = CurrentUserThreadCommentDataPlaceholder();
        expect(
          ThreadComment.from(data),
          CurrentUserThreadComment.from(data),
        );
      });

      test('returns $OtherUserThreadComment when data '
          'is $OtherUserThreadCommentData', () {
        final data = OtherUserThreadCommentDataPlaceholder();
        expect(
          ThreadComment.from(data),
          OtherUserThreadComment.from(data),
        );
      });
    });
  });
}
