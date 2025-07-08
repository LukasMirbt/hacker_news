import 'package:equatable/equatable.dart';

sealed class ReplyFormEvent extends Equatable {
  const ReplyFormEvent();

  @override
  List<Object> get props => [];
}

final class ReplyFormStarted extends ReplyFormEvent {
  const ReplyFormStarted();
}

final class ReplyFormTextChanged extends ReplyFormEvent {
  const ReplyFormTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class ReplyFormLinkPressed extends ReplyFormEvent {
  const ReplyFormLinkPressed(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}

final class ReplyFormSubmitted extends ReplyFormEvent {
  const ReplyFormSubmitted();
}
