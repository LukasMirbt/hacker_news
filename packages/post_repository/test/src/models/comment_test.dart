import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(Comment, () {
    group('from', () {
      test('returns $CurrentUserComment when data '
          'is $CurrentUserCommentData', () {
        final data = CurrentUserCommentDataPlaceholder();
        expect(
          Comment.from(data),
          CurrentUserComment.from(data),
        );
      });

      test('returns $OtherUserComment when data '
          'is $OtherUserCommentData', () {
        final data = OtherUserCommentDataPlaceholder();
        expect(
          Comment.from(data),
          OtherUserComment.from(data),
        );
      });
    });
  });
}
