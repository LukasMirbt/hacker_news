import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

void main() {
  group(ThreadFeedState, () {
    group('initial', () {
      test('returns $ThreadFeedState', () {
        expect(
          ThreadFeedState.initial(),
          ThreadFeedState(
            feed: PaginatedThreadFeedModelPlaceholder(),
          ),
        );
      });
    });
  });
}
