class AppFeedItemCommentCountButtonData {
  const AppFeedItemCommentCountButtonData({
    required this.commentCount,
    required this.onPressed,
  });

  final String commentCount;
  final void Function() onPressed;
}
