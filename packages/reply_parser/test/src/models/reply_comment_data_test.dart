import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(ReplyParentData, () {
    group('fromParsed', () {
      test('returns $ReplyParentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const upvoteUrl = 'upvoteUrl';
        const hasBeenUpvoted = true;
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';

        expect(
          ReplyParentData.fromParsed(
            id: id,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
          ReplyParentData(
            id: id,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
        );
      });

      test('returns $ReplyParentData with correct values '
          'when data is null', () {
        expect(
          ReplyParentData.fromParsed(
            id: null,
            upvoteUrl: null,
            hasBeenUpvoted: null,
            age: null,
            hnuser: null,
            htmlText: null,
          ),
          ReplyParentData(
            id: '',
            upvoteUrl: '',
            hasBeenUpvoted: false,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
          ),
        );
      });
    });

    group('empty', () {
      test('returns $ReplyParentData', () {
        expect(
          ReplyParentData.empty,
          isA<ReplyParentData>(),
        );
      });
    });
  });
}
