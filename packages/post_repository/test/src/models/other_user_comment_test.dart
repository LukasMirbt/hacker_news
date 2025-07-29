import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(OtherUserComment, () {
    group('from', () {
      test('returns $OtherUserComment', () {
        final data = OtherUserCommentDataPlaceholder();
        final base = data.base;
        expect(
          OtherUserComment.from(data),
          OtherUserComment(
            id: base.id,
            indent: base.indent,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            upvoteUrl: data.upvoteUrl,
            hasBeenUpvoted: data.hasBeenUpvoted,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $Comment', () {
        final comment = OtherUserCommentPlaceholder(
          hasBeenUpvoted: false,
        );
        expect(
          comment.upvote(),
          comment.copyWith(hasBeenUpvoted: true),
        );
      });
    });

    group('unvote', () {
      test('returns updated $Comment', () {
        final comment = OtherUserCommentPlaceholder(
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
