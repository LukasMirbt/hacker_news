import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(Post, () {
    group('from', () {
      test('returns $Post', () {
        final comments = [
          OtherUserCommentDataPlaceholder(),
        ];
        final data = PostDataPlaceholder(
          comments: comments,
        );
        final fatItemData = data.fatItemData;
        const savedComment = 'savedComment';

        expect(
          Post.from(
            data,
            savedComment: savedComment,
          ),
          Post(
            header: PostHeader.from(
              data: fatItemData,
              savedComment: savedComment,
            ),
            comments: [
              for (final item in data.comments) Comment.from(item),
            ],
          ),
        );
      });
    });

    group('empty', () {
      test('returns $Post', () {
        expect(
          Post.empty,
          isA<Post>(),
        );
      });
    });
  });
}
