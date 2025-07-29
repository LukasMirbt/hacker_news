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

final class ThreadFeedItemExpansionToggled extends ThreadFeedEvent {
  const ThreadFeedItemExpansionToggled(this.item);

  final ThreadCommentModel item;

  @override
  List<Object> get props => [item];
}

final class ThreadFeedItemVotePressed extends ThreadFeedEvent {
  const ThreadFeedItemVotePressed(this.item);

  final ThreadCommentModel item;

  @override
  List<Object> get props => [item];
}

final class ThreadFeedItemLinkPressed extends ThreadFeedEvent {
  const ThreadFeedItemLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
