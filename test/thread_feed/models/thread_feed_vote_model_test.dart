// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockPaginatedFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockThreadFeedItemModel extends Mock implements ThreadFeedItemModel {}

void main() {
  final vote = VotePlaceholder();

  group(ThreadFeedVoteModel, () {
    late PaginatedThreadFeedModel feed;
    late ThreadFeedItemModel item;
    late ThreadFeedItemModel updatedItem;
    late PaginatedThreadFeedModel updatedFeed;

    setUp(() {
      feed = _MockPaginatedFeedModel();
      item = _MockThreadFeedItemModel();
      updatedItem = _MockThreadFeedItemModel();
      updatedFeed = _MockPaginatedFeedModel();
    });

    ThreadFeedVoteModel createSubject() => ThreadFeedVoteModel();

    group('updateFeed', () {
      test('returns feed when findById returns null', () {
        final model = createSubject();
        expect(
          model.updateFeed(vote: vote, feed: feed),
          feed,
        );
      });

      test('returns updated feed when findById returns item', () {
        final findById = () => feed.findById(vote.id);
        final voteMethod = () => item.vote(vote.type);
        final update = () => feed.update(updatedItem);
        when(findById).thenReturn(item);
        when(voteMethod).thenReturn(updatedItem);
        when(update).thenReturn(updatedFeed);
        final model = createSubject();
        expect(
          model.updateFeed(vote: vote, feed: feed),
          updatedFeed,
        );
        verify(findById).called(1);
        verify(voteMethod).called(1);
        verify(update).called(1);
      });
    });
  });
}
