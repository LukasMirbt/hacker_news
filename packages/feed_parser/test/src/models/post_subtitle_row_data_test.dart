import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostSubtitleRowData, () {
    group('fromParsed', () {
      test('returns $PostSubtitleRowData with correct values '
          'when data is non-null', () {
        const score = 1;
        const hnuser = HnuserPlaceholder();
        const commentCount = 1;
        final age = DateTime(1);

        expect(
          PostSubtitleRowData.fromParsed(
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
            age: age,
          ),
          PostSubtitleRowData(
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
            age: age,
          ),
        );
      });

      test('returns $PostSubtitleRowData with correct values '
          'when data is null', () {
        expect(
          PostSubtitleRowData.fromParsed(
            score: null,
            hnuser: null,
            commentCount: null,
            age: null,
          ),
          PostSubtitleRowData(
            score: 0,
            hnuser: Hnuser.empty,
            commentCount: 0,
            age: DateTime(0),
          ),
        );
      });
    });

    group('empty', () {
      test('returns $PostSubtitleRowData', () {
        expect(
          PostSubtitleRowData.empty,
          isA<PostSubtitleRowData>(),
        );
      });
    });
  });
}
