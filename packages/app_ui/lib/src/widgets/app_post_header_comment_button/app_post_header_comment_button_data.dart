class AppPostHeaderCommentButtonData {
  const AppPostHeaderCommentButtonData({
    required this.commentCount,
    required this.onPressed,
  });

  final String commentCount;
  final void Function()? onPressed;
}
