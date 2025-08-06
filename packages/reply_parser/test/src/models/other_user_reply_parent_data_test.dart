import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  final base = BaseReplyParentDataPlaceholder();

  group(OtherUserReplyParentData, () {
    group('fromParsed', () {
      test('returns $OtherUserReplyParentData with correct values '
          'when data is non-null', () {
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;

        expect(
          OtherUserReplyParentData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          OtherUserReplyParentData(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
      });

      test('returns $OtherUserReplyParentData with correct values '
          'when data is null', () {
        expect(
          OtherUserReplyParentData.fromParsed(
            base: base,
            upvoteUrl: null,
            hasBeenUpvoted: null,
          ),
          OtherUserReplyParentData(
            base: base,
            upvoteUrl: '',
            hasBeenUpvoted: false,
          ),
        );
      });
    });
  });
}
