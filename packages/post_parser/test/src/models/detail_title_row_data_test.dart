// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailTitleRowData, () {
    group('fromParsed', () {
      test('returns $DetailTitleRowData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const title = 'title';
        const url = 'url';
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;
        const urlHost = 'urlHost';

        expect(
          DetailTitleRowData.fromParsed(
            id: id,
            title: title,
            url: url,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            urlHost: urlHost,
          ),
          DetailTitleRowData(
            id: id,
            title: title,
            url: url,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            urlHost: urlHost,
          ),
        );
      });

      test('returns $DetailTitleRowData with correct values '
          'when data is null', () {
        expect(
          DetailTitleRowData.fromParsed(
            id: null,
            title: null,
            url: null,
            upvoteUrl: null,
            hasBeenUpvoted: null,
            urlHost: null,
          ),
          DetailTitleRowData(
            id: '',
            title: '',
            url: '',
            upvoteUrl: null,
            hasBeenUpvoted: false,
            urlHost: null,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $DetailTitleRowData', () {
        expect(
          DetailTitleRowData.empty,
          isA<DetailTitleRowData>(),
        );
      });
    });
  });
}
