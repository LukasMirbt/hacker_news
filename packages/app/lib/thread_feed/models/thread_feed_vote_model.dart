import 'package:app/thread_feed/thread_feed.dart';
import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

class CurrentUserVoteError extends Error with EquatableMixin {
  CurrentUserVoteError();

  @override
  List<Object> get props => [];
}

class ThreadFeedVoteModel {
  const ThreadFeedVoteModel();

  PaginatedThreadFeedModel updateFeed({
    required Vote vote,
    required PaginatedThreadFeedModel feed,
  }) {
    final item = feed.findById(vote.id);

    switch (item) {
      case null:
        return feed;
      case OtherUserThreadCommentModel():
        final updatedItem = item.vote(vote.type);
        final updatedFeed = feed.update(updatedItem);
        return updatedFeed;
      case CurrentUserThreadCommentModel():
        throw CurrentUserVoteError();
    }
  }
}
