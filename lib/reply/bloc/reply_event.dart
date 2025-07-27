import 'package:equatable/equatable.dart';

sealed class ReplyEvent extends Equatable {
  const ReplyEvent();

  @override
  List<Object> get props => [];
}

final class ReplyVoteSubscriptionRequested extends ReplyEvent {
  const ReplyVoteSubscriptionRequested();
}

final class ReplyStarted extends ReplyEvent {
  const ReplyStarted();
}

final class ReplyTextChanged extends ReplyEvent {
  const ReplyTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class ReplyParentHeaderPressed extends ReplyEvent {
  const ReplyParentHeaderPressed();
}

final class ReplyParentVotePressed extends ReplyEvent {
  const ReplyParentVotePressed();
}

final class ReplyLinkPressed extends ReplyEvent {
  const ReplyLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}

final class ReplySubmitted extends ReplyEvent {
  const ReplySubmitted();
}
