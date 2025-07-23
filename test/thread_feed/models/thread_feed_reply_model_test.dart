// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockThreadFeedItemModel extends Mock implements ThreadFeedItemModel {}

void main() {
  final form = ReplyFormPlaceholder();
  final comment = CommentDataPlaceholder();

  final update = ReplyUpdate(
    form: form,
    comment: comment,
  );

  final newItem = ThreadFeedItemModel(
    item: comment.toThreadFeedItem(),
  );

  group(ThreadFeedReplyModel, () {
    late PaginatedThreadFeedModel feed;
    late ThreadFeedItemModel afterItem;
    late PaginatedThreadFeedModel updatedFeed;

    setUp(() {
      feed = _MockPaginatedThreadFeedModel();
      afterItem = _MockThreadFeedItemModel();
      updatedFeed = _MockPaginatedThreadFeedModel();
    });

    ThreadFeedReplyModel createSubject() => ThreadFeedReplyModel();

    group('updateFeed', () {
      test('returns feed when findById returns null', () {
        final model = createSubject();
        expect(
          model.updateFeed(update: update, feed: feed),
          feed,
        );
      });

      test('returns updated feed when findById returns parent', () {
        final findById = () => feed.findById(form.parent);
        final insertAfter = () => feed.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        when(findById).thenReturn(afterItem);
        when(insertAfter).thenReturn(updatedFeed);
        final model = createSubject();
        expect(
          model.updateFeed(update: update, feed: feed),
          updatedFeed,
        );
        verify(findById).called(1);
        verify(insertAfter).called(1);
      });
    });
  });
}
