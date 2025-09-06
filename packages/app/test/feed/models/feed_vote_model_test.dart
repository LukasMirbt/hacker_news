// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

class _MockPostFeedItemModel extends Mock implements PostFeedItemModel {}

class _MockJobFeedItemModel extends Mock implements JobFeedItemModel {}

void main() {
  final vote = VotePlaceholder();

  group(FeedVoteModel, () {
    late PaginatedFeedModel feed;
    late PostFeedItemModel item;
    late PostFeedItemModel updatedItem;
    late PaginatedFeedModel updatedFeed;

    setUp(() {
      feed = _MockPaginatedFeedModel();
      item = _MockPostFeedItemModel();
      updatedItem = _MockPostFeedItemModel();
      updatedFeed = _MockPaginatedFeedModel();
    });

    FeedVoteModel createSubject() => FeedVoteModel();

    group('updateFeed', () {
      final findById = () => feed.findById(vote.id);

      test('returns feed when item is null', () {
        final model = createSubject();
        expect(
          model.updateFeed(vote: vote, feed: feed),
          feed,
        );
      });

      test('returns updated feed when item '
          'is $PostFeedItemModel', () {
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

      test('throws $JobFeedItemVoteError when item '
          'is $JobFeedItemModel', () {
        when(findById).thenReturn(_MockJobFeedItemModel());
        final model = createSubject();
        expect(
          () => model.updateFeed(
            vote: vote,
            feed: feed,
          ),
          throwsA(
            JobFeedItemVoteError(),
          ),
        );
        verify(findById).called(1);
      });
    });
  });
}
