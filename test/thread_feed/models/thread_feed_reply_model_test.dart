// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadComment;
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockOtherUserThreadCommentModel extends Mock
    implements OtherUserThreadCommentModel {}

void main() {
  final form = ReplyFormPlaceholder();
  final comment = CurrentUserCommentDataPlaceholder();

  final update = ReplyUpdate(
    form: form,
    comment: comment,
  );

  final newItem = CurrentUserThreadCommentModel(
    comment: comment.toThread(),
  );

  group(ThreadFeedReplyModel, () {
    late PaginatedThreadFeedModel feed;
    late ThreadCommentModel afterItem;
    late PaginatedThreadFeedModel updatedFeed;

    setUp(() {
      feed = _MockPaginatedThreadFeedModel();
      afterItem = _MockOtherUserThreadCommentModel();
      updatedFeed = _MockPaginatedThreadFeedModel();
    });

    ThreadFeedReplyModel createSubject() => ThreadFeedReplyModel();

    group('updateFeed', () {
      test('throws $ThreadFeedReplyFailure when findById '
          'returns null', () {
        final model = createSubject();
        expect(
          () => model.updateFeed(update: update, feed: feed),
          throwsA(
            ThreadFeedReplyFailure(),
          ),
        );
      });

      test('returns updated feed when findById returns parent', () {
        final findById = () => feed.findById(form.parentId);
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
