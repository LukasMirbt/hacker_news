import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  final base = BaseCommentDataPlaceholder();

  group(OtherUserCommentData, () {
    group('fromParsed', () {
      test('returns $OtherUserCommentData with correct values '
          'when data is non-null', () {
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;

        expect(
          OtherUserCommentData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          OtherUserCommentData(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
      });

      test('returns $OtherUserCommentData with correct values '
          'when data is null', () {
        expect(
          OtherUserCommentData.fromParsed(
            base: base,
            upvoteUrl: null,
            hasBeenUpvoted: null,
          ),
          OtherUserCommentData(
            base: base,
            upvoteUrl: '',
            hasBeenUpvoted: false,
          ),
        );
      });
    });
  });
}
