import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailSubtitleRowData, () {
    group('fromParsed', () {
      test('returns $DetailSubtitleRowData with correct values '
          'when data is non-null', () {
        const score = 1;
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const commentCount = 1;

        expect(
          DetailSubtitleRowData.fromParsed(
            score: score,
            hnuser: hnuser,
            age: age,
            commentCount: commentCount,
          ),
          DetailSubtitleRowData(
            score: score,
            hnuser: hnuser,
            age: age,
            commentCount: commentCount,
          ),
        );
      });

      test('returns $DetailSubtitleRowData with correct values '
          'when data is null', () {
        expect(
          DetailSubtitleRowData.fromParsed(
            score: null,
            hnuser: null,
            age: null,
            commentCount: null,
          ),
          DetailSubtitleRowData(
            score: 0,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            commentCount: 0,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $DetailSubtitleRowData', () {
        expect(
          DetailSubtitleRowData.empty,
          isA<DetailSubtitleRowData>(),
        );
      });
    });
  });
}
