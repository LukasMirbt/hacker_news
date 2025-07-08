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

final class PostHeaderTitlePressed extends PostHeaderEvent {
  const PostHeaderTitlePressed();
}

final class PostHeaderVotePressed extends PostHeaderEvent {
  const PostHeaderVotePressed();
}

final class PostHeaderSharePressed extends PostHeaderEvent {
  const PostHeaderSharePressed({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

final class PostHeaderTextLinkPressed extends PostHeaderEvent {
  const PostHeaderTextLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
