import 'package:equatable/equatable.dart';

sealed class CommentFormEvent extends Equatable {
  const CommentFormEvent();

  @override
  List<Object> get props => [];
}

final class CommentFormPostSubscriptionRequested extends CommentFormEvent {
  const CommentFormPostSubscriptionRequested();
}

final class CommentFormTextChanged extends CommentFormEvent {
  const CommentFormTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class CommentFormSubmitted extends CommentFormEvent {
  const CommentFormSubmitted();
}

final class CommentFormLinkPressed extends CommentFormEvent {
  const CommentFormLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
