import 'package:equatable/equatable.dart';

sealed class PostHeaderEvent extends Equatable {
  const PostHeaderEvent();

  @override
  List<Object> get props => [];
}

final class PostHeaderSubscriptionRequested extends PostHeaderEvent {
  const PostHeaderSubscriptionRequested();
}

final class PostHeaderVoteSubscriptionRequested extends PostHeaderEvent {
  const PostHeaderVoteSubscriptionRequested();
}

final class PostHeaderVisitedPostSubscriptionRequested extends PostHeaderEvent {
  const PostHeaderVisitedPostSubscriptionRequested();
}

final class PostHeaderPressed extends PostHeaderEvent {
  const PostHeaderPressed();
}

final class PostHeaderVotePressed extends PostHeaderEvent {
  const PostHeaderVotePressed();
}

final class PostHeaderSharePressed extends PostHeaderEvent {
  const PostHeaderSharePressed({
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  List<Object> get props => [
    title,
    url,
  ];
}

final class PostHeaderTextLinkPressed extends PostHeaderEvent {
  const PostHeaderTextLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
