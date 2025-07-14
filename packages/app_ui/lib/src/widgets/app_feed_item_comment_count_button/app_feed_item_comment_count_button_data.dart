import 'package:equatable/equatable.dart';

class AppFeedItemCommentCountButtonData extends Equatable {
  const AppFeedItemCommentCountButtonData({
    required this.commentCount,
    required this.onPressed,
  });

  final String commentCount;
  final void Function() onPressed;

  @override
  List<Object?> get props => [
    commentCount,
    onPressed,
  ];
}
