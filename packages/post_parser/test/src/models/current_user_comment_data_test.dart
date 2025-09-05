import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  final base = BaseCommentDataPlaceholder();

  group(CurrentUserCommentData, () {
    group('fromParsed', () {
      test('returns $CurrentUserCommentData with correct values '
          'when data is non-null', () {
        const score = 1;
        const editUrl = 'editUrl';
        const deleteUrl = 'deleteUrl';

        expect(
          CurrentUserCommentData.fromParsed(
            base: base,
            score: score,
            editUrl: editUrl,
            deleteUrl: deleteUrl,
          ),
          CurrentUserCommentData(
            base: base,
            score: score,
            editUrl: editUrl,
            deleteUrl: deleteUrl,
          ),
        );
      });

      test('returns $CurrentUserCommentData with correct values '
          'when data is null', () {
        expect(
          CurrentUserCommentData.fromParsed(
            base: base,
            score: null,
            editUrl: null,
            deleteUrl: null,
          ),
          CurrentUserCommentData(
            base: base,
            score: 0,
            editUrl: null,
            deleteUrl: null,
          ),
        );
      });
    });
  });
}
