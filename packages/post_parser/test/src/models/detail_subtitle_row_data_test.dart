import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailSubtitleRowData, () {
    group('fromParsed', () {
      test('returns $DetailSubtitleRowData with correct values '
          'when data is non-null', () {
        final age = DateTime(1);
        const score = 1;
        const hnuser = HnuserPlaceholder();
        const commentCount = 1;

        expect(
          DetailSubtitleRowData.fromParsed(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
          ),
          DetailSubtitleRowData(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
          ),
        );
      });

      test('returns $DetailSubtitleRowData with correct values when isJob', () {
        final age = DateTime(1);
        const hnuser = HnuserPlaceholder();

        expect(
          DetailSubtitleRowData.fromParsed(
            age: age,
            score: null,
            hnuser: hnuser,
            commentCount: null,
          ),
          DetailSubtitleRowData(
            age: age,
            score: null,
            hnuser: hnuser,
            commentCount: null,
          ),
        );
      });

      test(
        'returns $DetailSubtitleRowData with correct values when !isJob',
        () {
          final age = DateTime(1);
          const hnuser = HnuserPlaceholder();
          const score = 1;

          expect(
            DetailSubtitleRowData.fromParsed(
              age: age,
              score: score,
              hnuser: hnuser,
              commentCount: null,
            ),
            DetailSubtitleRowData(
              age: age,
              score: score,
              hnuser: hnuser,
              commentCount: 0,
            ),
          );
        },
      );

      test('returns $DetailSubtitleRowData with correct values '
          'when data is null', () {
        expect(
          DetailSubtitleRowData.fromParsed(
            age: null,
            score: null,
            hnuser: null,
            commentCount: null,
          ),
          DetailSubtitleRowData(
            age: DateTime(0),
            score: null,
            hnuser: null,
            commentCount: null,
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
