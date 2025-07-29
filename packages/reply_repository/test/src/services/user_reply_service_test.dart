// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(UserReplyService, () {
    UserReplyService createSubject() => UserReplyService();

    group('newestComment', () {
      test('returns the most recent $CurrentUserCommentData', () {
        final commentThread = [
          OtherUserCommentDataPlaceholder(
            base: BaseCommentDataPlaceholder(
              age: DateTime(2025, 7, 23, 15, 34, 31),
            ),
          ),
          CurrentUserCommentDataPlaceholder(
            base: BaseCommentDataPlaceholder(
              age: DateTime(2025, 7, 23, 15, 34, 30),
            ),
          ),
          CurrentUserCommentDataPlaceholder(
            base: BaseCommentDataPlaceholder(
              age: DateTime(2025, 7, 23, 15, 33),
            ),
          ),
        ];
        final service = createSubject();
        expect(
          service.newestComment(commentThread),
          commentThread[1],
        );
      });

      test('throws $FindUserReplyFailure when first userComment '
          'is not $CurrentUserCommentData', () {
        final commentThread = <CommentData>[];
        final service = createSubject();
        expect(
          () => service.newestComment(commentThread),
          throwsA(
            FindUserReplyFailure(),
          ),
        );
      });
    });
  });
}
