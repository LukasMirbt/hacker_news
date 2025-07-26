// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockDetailFatItemData extends Mock implements DetailFatItemData {}

void main() {
  group(PostHeader, () {
    group('from', () {
      final titleRowData = DetailTitleRowDataPlaceholder();
      final subtitleRowData = DetailSubtitleRowDataPlaceholder();
      const htmlText = 'htmlText';
      final commentFormData = DetailCommentFormDataPlaceholder();

      late DetailFatItemData data;

      setUp(() {
        data = _MockDetailFatItemData();
        when(() => data.titleRowData).thenReturn(titleRowData);
        when(() => data.subtitleRowData).thenReturn(subtitleRowData);
      });

      test('returns $PostHeader with correct values '
          'when data is non-null', () {
        when(() => data.htmlText).thenReturn(htmlText);
        when(() => data.commentFormData).thenReturn(commentFormData);

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
            commentForm: CommentForm.from(commentFormData),
          ),
        );
      });

      test('returns $PostHeader with correct values '
          'when data is null', () {
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
            htmlText: null,
            commentForm: null,
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
