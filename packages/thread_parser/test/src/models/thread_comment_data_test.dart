import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(ThreadFeedItemData, () {
    group('fromParsed', () {
      test('returns $ThreadFeedItemData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';
        const indent = 1;
        const score = 1;
        const hasBeenUpvoted = true;
        const upvoteUrl = 'upvoteUrl';
        const parentUrl = 'parentUrl';
        const contextUrl = 'contextUrl';
        const onUrl = 'onUrl';
        const onTitle = 'onTitle';
        const replyUrl = 'replyUrl';

        expect(
          ThreadFeedItemData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            indent: indent,
            score: score,
            hasBeenUpvoted: hasBeenUpvoted,
            upvoteUrl: upvoteUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
            onUrl: onUrl,
            onTitle: onTitle,
            replyUrl: replyUrl,
          ),
          ThreadFeedItemData(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            indent: indent,
            score: score,
            hasBeenUpvoted: hasBeenUpvoted,
            upvoteUrl: upvoteUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
            onUrl: onUrl,
            onTitle: onTitle,
            replyUrl: replyUrl,
          ),
        );
      });

      test('returns $ThreadFeedItemData with correct values '
          'when data is null', () {
        expect(
          ThreadFeedItemData.fromParsed(
            id: null,
            hnuser: null,
            age: null,
            htmlText: null,
            indent: null,
            score: null,
            hasBeenUpvoted: null,
            upvoteUrl: null,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
            replyUrl: null,
          ),
          ThreadFeedItemData(
            id: '',
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
            indent: 0,
            score: null,
            hasBeenUpvoted: null,
            upvoteUrl: null,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
            replyUrl: null,
          ),
        );
      });
    });
  });
}
