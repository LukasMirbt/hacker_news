// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const base = BaseTitleRowDataPlaceholder();

  group(PostTitleRowData, () {
    group('fromParsed', () {
      test('returns $PostTitleRowData with correct values '
          'when data is non-null', () {
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;

        expect(
          PostTitleRowData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          PostTitleRowData(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
      });

      test('returns $PostTitleRowData with correct values '
          'when data is null', () {
        expect(
          PostTitleRowData.fromParsed(
            base: base,
            upvoteUrl: null,
            hasBeenUpvoted: null,
          ),
          PostTitleRowData(
            base: base,
            upvoteUrl: null,
            hasBeenUpvoted: false,
          ),
        );
      });
    });
  });
}
