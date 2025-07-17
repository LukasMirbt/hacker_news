import 'package:equatable/equatable.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

sealed class ThreadListEvent {
  const ThreadListEvent();
}

final class ThreadListVoteSubscriptionRequested extends ThreadListEvent {
  const ThreadListVoteSubscriptionRequested();
}

final class ThreadListStarted extends ThreadListEvent {
  const ThreadListStarted();
}

final class ThreadListExpansionToggled extends ThreadListEvent
    with EquatableMixin {
  const ThreadListExpansionToggled(this.comment);

  final ThreadCommentModel comment;

  @override
  List<Object> get props => [comment];
}

final class ThreadListBottomReached extends ThreadListEvent {
  const ThreadListBottomReached();
}

final class ThreadListRefreshTriggered extends ThreadListEvent {
  const ThreadListRefreshTriggered();
}

final class ThreadListLinkPressed extends ThreadListEvent {
  const ThreadListLinkPressed(this.url);

  final String url;
}
