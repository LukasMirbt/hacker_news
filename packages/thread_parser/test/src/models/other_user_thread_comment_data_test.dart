import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  final base = BaseThreadCommentDataPlaceholder();

  group(OtherUserThreadCommentData, () {
    group('fromParsed', () {
      test('returns $OtherUserThreadCommentData with correct values '
          'when data is non-null', () {
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;

        expect(
          OtherUserThreadCommentData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          OtherUserThreadCommentData(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
      });

      test('returns $OtherUserThreadCommentData with correct values '
          'when data is null', () {
        expect(
          OtherUserThreadCommentData.fromParsed(
            base: base,
            upvoteUrl: null,
            hasBeenUpvoted: null,
          ),
          OtherUserThreadCommentData(
            base: base,
            upvoteUrl: '',
            hasBeenUpvoted: false,
          ),
        );
      });
    });
  });
}
