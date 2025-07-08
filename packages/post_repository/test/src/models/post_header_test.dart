import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostHeader, () {
    group('from', () {
      test('returns $PostHeader', () {
        const htmlText = 'htmlText';
        const hmac = 'hmac';

        final data = DetailFatItemDataPlaceholder(
          htmlText: htmlText,
          hmac: hmac,
        );

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
            htmlText: htmlText,
            hmac: hmac,
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

    group('upvote', () {
      test('returns updated $PostHeader', () {
        final postHeader = PostHeaderPlaceholder(
          score: 1,
          hasBeenUpvoted: false,
        );
        expect(
          postHeader.upvote(),
          postHeader.copyWith(
            hasBeenUpvoted: true,
            score: postHeader.score + 1,
          ),
        );
      });
    });

    group('unvote', () {
      test('returns updated $PostHeader', () {
        final postHeader = PostHeaderPlaceholder(
          score: 1,
          hasBeenUpvoted: true,
        );
        expect(
          postHeader.unvote(),
          postHeader.copyWith(
            hasBeenUpvoted: false,
            score: postHeader.score - 1,
          ),
        );
      });
    });
  });
}
