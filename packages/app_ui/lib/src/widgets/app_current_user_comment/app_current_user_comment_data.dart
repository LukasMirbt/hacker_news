class AppCurrentUserCommentData {
  const AppCurrentUserCommentData({
    required this.isExpanded,
    required this.user,
    required this.age,
    required this.htmlText,
    required this.score,
    required this.onHeaderPressed,
    required this.onMorePressed,
    required this.onLinkPressed,
  });

  final bool isExpanded;
  final String user;
  final String age;
  final String htmlText;
  final String score;
  final void Function() onHeaderPressed;
  final void Function() onMorePressed;
  final void Function(String) onLinkPressed;
}
