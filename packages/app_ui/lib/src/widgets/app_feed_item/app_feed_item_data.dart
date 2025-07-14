import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppFeedItemData {
  const AppFeedItemData({
    required this.hasBeenVisited,
    required this.rank,
    required this.title,
    required this.age,
    required this.urlHost,
    required this.user,
    required this.onPressed,
    required this.onSharePressed,
    required this.onMorePressed,
    required this.voteButtonData,
    required this.commentCountButtonData,
  });

  final bool hasBeenVisited;
  final String rank;
  final String title;
  final String age;
  final String? urlHost;
  final String? user;
  final void Function() onPressed;
  final void Function() onSharePressed;
  final void Function() onMorePressed;
  final AppFeedItemVoteButtonData? voteButtonData;
  final AppFeedItemCommentCountButtonData? commentCountButtonData;

  Color titleColor(ColorScheme colorScheme) {
    if (hasBeenVisited) return colorScheme.onSurfaceVariant;
    return colorScheme.onSurface;
  }
}
