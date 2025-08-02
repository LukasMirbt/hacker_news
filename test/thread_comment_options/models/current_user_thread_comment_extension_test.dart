import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group('CurrentUserThreadCommentExtension', () {
    group('toReplyParent', () {
      test('returns $CurrentUserReplyParent', () {
        final comment = CurrentUserThreadCommentPlaceholder();
        expect(
          CurrentUserThreadCommentExtension(comment).toReplyParent(),
          CurrentUserReplyParent(
            id: comment.id,
            hnuser: comment.hnuser,
            age: comment.age,
            htmlText: comment.htmlText,
            score: comment.score,
          ),
        );
      });
    });
  });
}
