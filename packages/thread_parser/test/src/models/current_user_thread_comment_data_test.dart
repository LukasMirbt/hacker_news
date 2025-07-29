import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  final base = BaseThreadCommentDataPlaceholder();

  group(CurrentUserThreadCommentData, () {
    group('fromParsed', () {
      test('returns $CurrentUserThreadCommentData with correct values '
          'when data is non-null', () {
        const score = 1;

        expect(
          CurrentUserThreadCommentData.fromParsed(
            base: base,
            score: score,
          ),
          CurrentUserThreadCommentData(
            base: base,
            score: score,
          ),
        );
      });

      test('returns $CurrentUserThreadCommentData with correct values '
          'when data is null', () {
        expect(
          CurrentUserThreadCommentData.fromParsed(
            base: base,
            score: null,
          ),
          CurrentUserThreadCommentData(
            base: base,
            score: 0,
          ),
        );
      });
    });
  });
}
