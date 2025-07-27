import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyParent, () {
    group('from', () {
      test('returns $ReplyParent', () {
        final data = ReplyParentDataPlaceholder();
        expect(
          ReplyParent.from(data),
          ReplyParent(
            id: data.id,
            upvoteUrl: data.upvoteUrl,
            hasBeenUpvoted: data.hasBeenUpvoted,
            hnuser: data.hnuser,
            age: data.age,
            htmlText: data.htmlText,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $ReplyParent', () {
        final comment = ReplyParentPlaceholder(
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
        final comment = ReplyParentPlaceholder(
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
