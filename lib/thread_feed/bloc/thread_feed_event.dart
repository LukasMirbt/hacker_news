import 'package:equatable/equatable.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

sealed class ThreadFeedEvent extends Equatable {
  const ThreadFeedEvent();

  @override
  List<Object> get props => [];
}

final class ThreadFeedVoteSubscriptionRequested extends ThreadFeedEvent {
  const ThreadFeedVoteSubscriptionRequested();
}

final class ThreadFeedReplySubscriptionRequested extends ThreadFeedEvent {
  const ThreadFeedReplySubscriptionRequested();
}

final class ThreadFeedStarted extends ThreadFeedEvent {
  const ThreadFeedStarted();
}

final class ThreadFeedDataFetched extends ThreadFeedEvent {
  const ThreadFeedDataFetched();
}

final class ThreadFeedRefreshTriggered extends ThreadFeedEvent {
  const ThreadFeedRefreshTriggered();
}

final class ThreadFeedExpansionToggled extends ThreadFeedEvent {
  const ThreadFeedExpansionToggled(this.comment);

  final ThreadCommentModel comment;

  @override
  List<Object> get props => [comment];
}

final class ThreadFeedVotePressed extends ThreadFeedEvent {
  const ThreadFeedVotePressed(this.comment);

  final OtherUserThreadCommentModel comment;

  @override
  List<Object> get props => [comment];
}

final class ThreadFeedLinkPressed extends ThreadFeedEvent {
  const ThreadFeedLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
