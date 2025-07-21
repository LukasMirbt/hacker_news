import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(CommentData, () {
    group('fromParsed', () {
      test('returns $CommentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const indent = 1;
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;
        const score = 2;
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';
        const replyUrl = 'replyUrl';

        expect(
          CommentData.fromParsed(
            id: id,
            indent: indent,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            score: score,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
          ),
          CommentData(
            id: id,
            indent: indent,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            score: score,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
          ),
        );
      });

      test('returns $CommentData with correct values '
          'when data is null', () {
        expect(
          CommentData.fromParsed(
            id: null,
            indent: null,
            upvoteUrl: null,
            hasBeenUpvoted: null,
            score: null,
            hnuser: null,
            age: null,
            htmlText: null,
            replyUrl: null,
          ),
          CommentData(
            id: '',
            indent: 0,
            upvoteUrl: '',
            hasBeenUpvoted: false,
            score: null,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
            replyUrl: null,
          ),
        );
      });
    });
  });
}
