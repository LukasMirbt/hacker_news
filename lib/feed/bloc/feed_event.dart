import 'package:equatable/equatable.dart';
import 'package:hacker_client/feed/feed.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

final class FeedVoteSubscriptionRequested extends FeedEvent {
  const FeedVoteSubscriptionRequested();
}

final class FeedVisitedPostSubscriptionRequested extends FeedEvent {
  const FeedVisitedPostSubscriptionRequested();
}

final class FeedStarted extends FeedEvent {
  const FeedStarted();
}

final class FeedItemPressed extends FeedEvent {
  const FeedItemPressed(this.item);

  final FeedItemModel item;

  @override
  List<Object> get props => [item];
}

final class FeedItemVotePressed extends FeedEvent {
  const FeedItemVotePressed(this.item);

  final FeedItemModel item;

  @override
  List<Object> get props => [item];
}

final class FeedItemSharePressed extends FeedEvent {
  const FeedItemSharePressed({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

final class FeedDataFetched extends FeedEvent {
  const FeedDataFetched();
}

final class FeedRefreshTriggered extends FeedEvent {
  const FeedRefreshTriggered();
}
