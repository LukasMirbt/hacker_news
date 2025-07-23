import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  final item = ThreadFeedItemPlaceholder();

  group(ThreadItemOptionsBloc, () {
    ThreadItemOptionsBloc buildBloc() {
      return ThreadItemOptionsBloc(item: item);
    }

    test('initial state is $ThreadItemOptionsState', () {
      expect(
        buildBloc().state,
        ThreadItemOptionsState.from(item),
      );
    });
  });
}
