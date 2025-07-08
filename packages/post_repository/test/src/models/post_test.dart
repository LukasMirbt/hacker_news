import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(Post, () {
    group('from', () {
      test('returns $Post', () {
        final comments = [
          CommentDataPlaceholder(),
        ];

        final data = PostDataPlaceholder(
          comments: comments,
        );

        final fatItemData = data.fatItemData;

        expect(
          Post.from(data),
          Post(
            header: PostHeader.from(fatItemData),
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
