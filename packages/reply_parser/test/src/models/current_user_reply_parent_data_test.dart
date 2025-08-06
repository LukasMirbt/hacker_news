import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  final base = BaseReplyParentDataPlaceholder();

  group(CurrentUserReplyParentData, () {
    group('fromParsed', () {
      test('returns $CurrentUserReplyParentData with correct values '
          'when data is non-null', () {
        const score = 1;

        expect(
          CurrentUserReplyParentData.fromParsed(
            base: base,
            score: score,
          ),
          CurrentUserReplyParentData(
            base: base,
            score: score,
          ),
        );
      });

      test('returns $CurrentUserReplyParentData with correct values '
          'when data is null', () {
        expect(
          CurrentUserReplyParentData.fromParsed(
            base: base,
            score: null,
          ),
          CurrentUserReplyParentData(
            base: base,
            score: 0,
          ),
        );
      });
    });
  });
}
