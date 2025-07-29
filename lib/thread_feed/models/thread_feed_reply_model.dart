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
    required ReplyUpdate update,
    required PaginatedThreadFeedModel feed,
  }) {
    final form = update.form;
    final parent = feed.findById(form.parentId);

    if (parent == null) {
      throw const ThreadFeedReplyFailure();
    }

    final newItem = CurrentUserThreadCommentModel(
      comment: update.comment.toThread(),
    );

    final updatedFeed = feed.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedFeed;
  }
}
