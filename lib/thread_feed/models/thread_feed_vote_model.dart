import 'package:equatable/equatable.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadFeedVoteFailure with EquatableMixin implements Exception {
  const ThreadFeedVoteFailure();

  @override
  List<Object?> get props => [];
}

class ThreadFeedVoteModel {
  const ThreadFeedVoteModel();

  PaginatedThreadFeedModel updateFeed({
    required Vote vote,
    required PaginatedThreadFeedModel feed,
  }) {
    final item = feed.findById(vote.id);

    if (item is! OtherUserThreadCommentModel) {
      throw const ThreadFeedVoteFailure();
    }

    final updatedItem = item.vote(vote.type);
    final updatedFeed = feed.update(updatedItem);
    return updatedFeed;
  }
}
