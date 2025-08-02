import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart'
    hide CurrentUserThreadComment, OtherUserThreadComment;

void main() {
  group('ThreadCommentExtension', () {
    group('toReplyParent', () {
      test('returns $CurrentUserReplyParent when comment '
          'is $CurrentUserThreadComment', () {
        final comment = CurrentUserThreadCommentPlaceholder();
        expect(
          comment.toReplyParent(),
          CurrentUserThreadCommentExtension(comment).toReplyParent(),
        );
      });

      test('returns $OtherUserReplyParent when comment '
          'is $OtherUserThreadComment', () {
        final comment = OtherUserThreadCommentPlaceholder();
        expect(
          comment.toReplyParent(),
          OtherUserThreadCommentExtension(comment).toReplyParent(),
        );
      });
    });
  });
}
