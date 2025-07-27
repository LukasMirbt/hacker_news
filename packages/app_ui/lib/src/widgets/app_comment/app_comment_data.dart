import 'package:flutter/material.dart';

class AppCommentData {
  const AppCommentData({
    required this.isExpanded,
    required this.user,
    required this.age,
    required this.hasBeenUpvoted,
    required this.htmlText,
    required this.onHeaderPressed,
    required this.onMorePressed,
    required this.onLinkPressed,
    required this.onVotePressed,
  });

  final bool isExpanded;
  final String user;
  final String age;
  final bool hasBeenUpvoted;
  final String htmlText;
  final void Function() onHeaderPressed;
  final void Function() onMorePressed;
  final void Function(String) onLinkPressed;
  final void Function() onVotePressed;

  Color voteIconColor(ColorScheme colorScheme) {
    if (hasBeenUpvoted) return colorScheme.onSurface;
    return colorScheme.onSurfaceVariant;
  }

  double get voteIconSize {
    if (hasBeenUpvoted) return 20;
    return 18;
  }
}
