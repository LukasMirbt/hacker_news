import 'package:hacker_client/feed/feed.dart';
import 'package:vote_repository/vote_repository.dart';

class FeedVoteModel {
  const FeedVoteModel();

  PaginatedFeedModel updateFeed({
    required Vote vote,
    required PaginatedFeedModel feed,
  }) {
    final item = feed.findById(vote.id);
    if (item == null) return feed;
    final updatedItem = item.vote(vote.type);
    final updatedFeed = feed.update(updatedItem);
    return updatedFeed;
  }
}
