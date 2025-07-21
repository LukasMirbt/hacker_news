import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(Comment, () {
    group('from', () {
      test('returns $Comment', () {
        final data = CommentDataPlaceholder();
        expect(
          Comment.from(data),
          Comment(
            id: data.id,
            indent: data.indent,
            upvoteUrl: data.upvoteUrl,
            hasBeenUpvoted: data.hasBeenUpvoted,
            score: data.score,
            hnuser: data.hnuser,
            age: data.age,
            htmlText: data.htmlText,
            replyUrl: data.replyUrl,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $Comment', () {
        final comment = CommentPlaceholder(
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
        final comment = CommentPlaceholder(
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
