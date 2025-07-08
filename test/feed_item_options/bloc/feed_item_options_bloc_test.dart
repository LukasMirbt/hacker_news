import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

void main() {
  final item = FeedItemPlaceholder();

  group(FeedItemOptionsBloc, () {
    FeedItemOptionsBloc buildBloc() {
      return FeedItemOptionsBloc(item: item);
    }

    test('initial state is $FeedItemOptionsState', () {
      expect(
        buildBloc().state,
        FeedItemOptionsState.from(item),
      );
    });
  });
}
