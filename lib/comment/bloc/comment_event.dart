import 'package:equatable/equatable.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

final class CommentPostSubscriptionRequested extends CommentEvent {
  const CommentPostSubscriptionRequested();
}

final class CommentPostLoaded extends CommentEvent {
  const CommentPostLoaded();
}

final class CommentTextChanged extends CommentEvent {
  const CommentTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class CommentSubmitted extends CommentEvent {
  const CommentSubmitted();
}

final class CommentLinkPressed extends CommentEvent {
  const CommentLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
