import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group('CurrentUserCommentDataExtension', () {
    group('toThreadFeedItem', () {
      test('returns $ThreadFeedItem', () {
        final data = CurrentUserCommentDataPlaceholder();
        final base = data.base;
        expect(
          data.toThreadFeedItem(),
          ThreadFeedItem(
            upvoteUrl: null,
            hasBeenUpvoted: null,
            id: base.id,
            indent: base.indent,
            score: data.score,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
            replyUrl: base.replyUrl,
          ),
        );
      });
    });
  });
}
