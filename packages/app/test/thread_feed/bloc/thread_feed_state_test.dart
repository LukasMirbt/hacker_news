import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter_test/flutter_test.dart';

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
