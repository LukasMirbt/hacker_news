import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadItemOptionsState, () {
    group('from', () {
      test('returns $ThreadItemOptionsState', () {
        final item = ThreadFeedItemPlaceholder();
        expect(
          ThreadItemOptionsState.from(item),
          ThreadItemOptionsState(
            item: ThreadItemModel(item),
          ),
        );
      });
    });
  });
}
