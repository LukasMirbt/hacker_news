// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(TitleRowData, () {
    group('fromParsed', () {
      test('returns $TitleRowData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const rank = 1;
        const title = 'title';
        const url = 'url';
        const urlHost = 'urlHost';
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;

        expect(
          TitleRowData.fromParsed(
            id: id,
            rank: rank,
            title: title,
            url: url,
            urlHost: urlHost,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          TitleRowData(
            id: id,
            rank: rank,
            title: title,
            url: url,
            urlHost: urlHost,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
      });

      test('returns $TitleRowData with correct values '
          'when data is null', () {
        expect(
          TitleRowData.fromParsed(
            id: null,
            rank: null,
            title: null,
            url: null,
            urlHost: null,
            upvoteUrl: null,
            hasBeenUpvoted: null,
          ),
          TitleRowData(
            id: '',
            rank: 0,
            title: '',
            url: '',
            urlHost: null,
            upvoteUrl: null,
            hasBeenUpvoted: false,
          ),
        );
      });
    });
  });
}
