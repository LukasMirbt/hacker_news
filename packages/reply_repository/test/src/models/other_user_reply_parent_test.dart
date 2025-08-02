import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(OtherUserReplyParent, () {
    group('from', () {
      test('returns $OtherUserReplyParent', () {
        final data = OtherUserReplyParentDataPlaceholder();
        final base = data.base;
        expect(
          OtherUserReplyParent.from(data),
          OtherUserReplyParent(
            id: base.id,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            upvoteUrl: data.upvoteUrl,
            hasBeenUpvoted: data.hasBeenUpvoted,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $ReplyParent', () {
        final comment = OtherUserReplyParentPlaceholder(
          hasBeenUpvoted: false,
        );
        expect(
          comment.upvote(),
          comment.copyWith(hasBeenUpvoted: true),
        );
      });
    });

    group('unvote', () {
      test('returns updated $ReplyParent', () {
        final comment = OtherUserReplyParentPlaceholder(
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
