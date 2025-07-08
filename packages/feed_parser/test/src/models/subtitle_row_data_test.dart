import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(SubtitleRowData, () {
    group('fromParsed', () {
      test('returns $SubtitleRowData with correct values '
          'when data is non-null', () {
        final age = DateTime(1);
        const score = 1;
        const hnuser = HnuserPlaceholder();
        const commentCount = 1;

        expect(
          SubtitleRowData.fromParsed(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
          ),
          SubtitleRowData(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
          ),
        );
      });

      test('returns $SubtitleRowData with correct values when isJob', () {
        final age = DateTime(1);
        const hnuser = HnuserPlaceholder();

        expect(
          SubtitleRowData.fromParsed(
            age: age,
            score: null,
            hnuser: hnuser,
            commentCount: null,
          ),
          SubtitleRowData(
            age: age,
            score: null,
            hnuser: hnuser,
            commentCount: null,
          ),
        );
      });

      test('returns $SubtitleRowData with correct values when !isJob', () {
        final age = DateTime(1);
        const hnuser = HnuserPlaceholder();
        const score = 1;

        expect(
          SubtitleRowData.fromParsed(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: null,
          ),
          SubtitleRowData(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: 0,
          ),
        );
      });

      test('returns $SubtitleRowData with correct values '
          'when data is null', () {
        expect(
          SubtitleRowData.fromParsed(
            age: null,
            score: null,
            hnuser: null,
            commentCount: null,
          ),
          SubtitleRowData(
            age: DateTime(0),
            score: null,
            hnuser: null,
            commentCount: null,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $SubtitleRowData', () {
        expect(
          SubtitleRowData.empty,
          isA<SubtitleRowData>(),
        );
      });
    });
  });
}
