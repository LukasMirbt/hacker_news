// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(BaseTitleRowData, () {
    group('fromParsed', () {
      test('returns $BaseTitleRowData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const rank = 1;
        const title = 'title';
        const url = 'url';
        const urlHost = 'urlHost';

        expect(
          BaseTitleRowData.fromParsed(
            id: id,
            rank: rank,
            title: title,
            url: url,
            urlHost: urlHost,
          ),
          BaseTitleRowData(
            id: id,
            rank: rank,
            title: title,
            url: url,
            urlHost: urlHost,
          ),
        );
      });

      test('returns $BaseTitleRowData with correct values '
          'when data is null', () {
        expect(
          BaseTitleRowData.fromParsed(
            id: null,
            rank: null,
            title: null,
            url: null,
            urlHost: null,
          ),
          BaseTitleRowData(
            id: '',
            rank: 0,
            title: '',
            url: '',
            urlHost: null,
          ),
        );
      });
    });
  });
}
