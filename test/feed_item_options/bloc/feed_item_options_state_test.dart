import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

void main() {
  group(FeedItemOptionsState, () {
    group('from', () {
      test('returns $FeedItemOptionsState', () {
        final item = FeedItemPlaceholder();
        expect(
          FeedItemOptionsState.from(item),
          FeedItemOptionsState(
            item: FeedItemModel(item),
          ),
        );
      });
    });
  });
}
