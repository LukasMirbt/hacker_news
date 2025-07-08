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
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';

        expect(
          CommentData.fromParsed(
            id: id,
            indent: indent,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
          CommentData(
            id: id,
            indent: indent,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
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
            hnuser: null,
            age: null,
            htmlText: null,
          ),
          CommentData(
            id: '',
            indent: 0,
            upvoteUrl: '',
            hasBeenUpvoted: false,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
          ),
        );
      });
    });
  });
}
