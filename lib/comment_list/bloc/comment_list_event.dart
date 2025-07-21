import 'package:equatable/equatable.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

sealed class CommentListEvent {
  const CommentListEvent();
}

final class CommentListSubscriptionRequested extends CommentListEvent {
  const CommentListSubscriptionRequested();
}

final class CommentListVoteSubscriptionRequested extends CommentListEvent {
  const CommentListVoteSubscriptionRequested();
}

final class CommentListReplySubscriptionRequested extends CommentListEvent {
  const CommentListReplySubscriptionRequested();
}

final class CommentListExpansionToggled extends CommentListEvent
    with EquatableMixin {
  const CommentListExpansionToggled(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

final class CommentListVotePressed extends CommentListEvent
    with EquatableMixin {
  const CommentListVotePressed(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

final class CommentListLinkPressed extends CommentListEvent
    with EquatableMixin {
  const CommentListLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
