import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostHeader, () {
    group('from', () {
      test('returns $PostHeader', () {
        final data = DetailFatItemDataPlaceholder();
        final titleRowData = data.titleRowData;
        final subtitleRowData = data.subtitleRowData;

        expect(
          PostHeader.from(data),
          PostHeader(
            id: titleRowData.id,
            title: titleRowData.title,
            url: titleRowData.url,
            upvoteUrl: titleRowData.upvoteUrl,
            hasBeenUpvoted: titleRowData.hasBeenUpvoted,
            urlHost: titleRowData.urlHost,
            score: subtitleRowData.score,
            hnuser: subtitleRowData.hnuser,
            age: subtitleRowData.age,
            commentCount: subtitleRowData.commentCount,
            htmlText: data.htmlText,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $PostHeader', () {
        expect(
          PostHeader.empty,
          isA<PostHeader>(),
        );
      });
    });

    group('unvote', () {
      test('returns updated $PostHeader', () {
        const score = 1;
        const hasBeenUpvoted = true;

        final item = PostHeaderPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.unvote(),
          item.copyWith(
            hasBeenUpvoted: false,
            score: score - 1,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $PostHeader', () {
        const score = 1;
        const hasBeenUpvoted = false;

        final item = PostHeaderPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.upvote(),
          item.copyWith(
            hasBeenUpvoted: true,
            score: score + 1,
          ),
        );
      });
    });
  });
}
