import 'package:equatable/equatable.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:reply_repository/reply_repository.dart';

class ThreadFeedReplyFailure with EquatableMixin implements Exception {
  const ThreadFeedReplyFailure();

  @override
  List<Object?> get props => [];
}

class ThreadFeedReplyModel {
  const ThreadFeedReplyModel();

  PaginatedThreadFeedModel updateFeed({
    required Reply reply,
    required PaginatedThreadFeedModel feed,
  }) {
    final parent = feed.findById(reply.parentId);

    if (parent == null) {
      throw const ThreadFeedReplyFailure();
    }

    // TODO: Investigate incorrect indent after replying in thread

    final newItem = CurrentUserThreadCommentModel(
      comment: reply.toThread(),
    );

    final updatedFeed = feed.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedFeed;
  }
}
