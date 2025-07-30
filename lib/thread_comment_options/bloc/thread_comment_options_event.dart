import 'package:equatable/equatable.dart';

class ThreadCommentOptionsEvent extends Equatable {
  const ThreadCommentOptionsEvent();

  @override
  List<Object> get props => [];
}

final class ThreadCommentOptionsSharePressed extends ThreadCommentOptionsEvent {
  const ThreadCommentOptionsSharePressed();
}
