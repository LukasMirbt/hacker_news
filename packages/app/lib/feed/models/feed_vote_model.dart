import 'package:app/feed/feed.dart';
import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

class JobFeedItemVoteError extends Error with EquatableMixin {
  JobFeedItemVoteError();

  @override
  List<Object> get props => [];
}

class FeedVoteModel {
  const FeedVoteModel();

  PaginatedFeedModel updateFeed({
    required Vote vote,
    required PaginatedFeedModel feed,
  }) {
    final item = feed.findById(vote.id);

    switch (item) {
      case null:
        return feed;
      case PostFeedItemModel():
        final updatedItem = item.vote(vote.type);
        final updatedFeed = feed.update(updatedItem);
        return updatedFeed;
      case JobFeedItemModel():
        throw JobFeedItemVoteError();
    }
  }
}
