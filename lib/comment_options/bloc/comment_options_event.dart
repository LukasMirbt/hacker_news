import 'package:equatable/equatable.dart';

class CommentOptionsEvent extends Equatable {
  const CommentOptionsEvent();

  @override
  List<Object> get props => [];
}

final class CommentOptionsSharePressed extends CommentOptionsEvent {
  const CommentOptionsSharePressed();
}
