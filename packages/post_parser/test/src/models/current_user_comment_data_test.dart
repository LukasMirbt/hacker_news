import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  final base = BaseCommentDataPlaceholder();

  group(CurrentUserCommentData, () {
    group('fromParsed', () {
      test('returns $CurrentUserCommentData with correct values '
          'when data is non-null', () {
        const score = 1;

        expect(
          CurrentUserCommentData.fromParsed(
            base: base,
            score: score,
          ),
          CurrentUserCommentData(
            base: base,
            score: score,
          ),
        );
      });

      test('returns $CurrentUserCommentData with correct values '
          'when data is null', () {
        expect(
          CurrentUserCommentData.fromParsed(
            base: base,
            score: null,
          ),
          CurrentUserCommentData(
            base: base,
            score: 0,
          ),
        );
      });
    });
  });
}
