import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(JobSubtitleRowData, () {
    group('fromParsed', () {
      test('returns $JobSubtitleRowData with correct values '
          'when data is non-null', () {
        final age = DateTime(1);

        expect(
          JobSubtitleRowData.fromParsed(
            age: age,
          ),
          JobSubtitleRowData(
            age: age,
          ),
        );
      });

      test('returns $JobSubtitleRowData with correct values '
          'when data is null', () {
        expect(
          JobSubtitleRowData.fromParsed(
            age: null,
          ),
          JobSubtitleRowData(
            age: DateTime(0),
          ),
        );
      });
    });

    group('empty', () {
      test('returns $JobSubtitleRowData', () {
        expect(
          JobSubtitleRowData.empty,
          isA<JobSubtitleRowData>(),
        );
      });
    });
  });
}
