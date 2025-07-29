import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(OtherUserThreadComment, () {
    group('from', () {
      test('returns $OtherUserThreadComment', () {
        final data = OtherUserThreadCommentDataPlaceholder();
        final base = data.base;
        expect(
          OtherUserThreadComment.from(data),
          OtherUserThreadComment(
            id: base.id,
            indent: base.indent,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            parentUrl: base.parentUrl,
            contextUrl: base.contextUrl,
            onUrl: base.onUrl,
            onTitle: base.onTitle,
            upvoteUrl: data.upvoteUrl,
            hasBeenUpvoted: data.hasBeenUpvoted,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $ThreadComment', () {
        final comment = OtherUserThreadCommentPlaceholder(
          hasBeenUpvoted: false,
        );
        expect(
          comment.upvote(),
          comment.copyWith(hasBeenUpvoted: true),
        );
      });
    });

    group('unvote', () {
      test('returns updated $ThreadComment', () {
        final comment = OtherUserThreadCommentPlaceholder(
          hasBeenUpvoted: true,
        );
        expect(
          comment.unvote(),
          comment.copyWith(hasBeenUpvoted: false),
        );
      });
    });
  });
}
