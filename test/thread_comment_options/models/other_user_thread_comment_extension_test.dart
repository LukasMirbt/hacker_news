import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group('OtherUserThreadCommentExtension', () {
    group('toReplyParent', () {
      test('returns $OtherUserReplyParent', () {
        final comment = OtherUserThreadCommentPlaceholder();
        expect(
          OtherUserThreadCommentExtension(comment).toReplyParent(),
          OtherUserReplyParent(
            id: comment.id,
            hnuser: comment.hnuser,
            age: comment.age,
            htmlText: comment.htmlText,
            upvoteUrl: comment.upvoteUrl,
            hasBeenUpvoted: comment.hasBeenUpvoted,
          ),
        );
      });
    });
  });
}
