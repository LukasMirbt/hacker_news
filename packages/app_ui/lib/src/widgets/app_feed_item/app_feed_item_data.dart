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
    required this.voteButton,
    required this.commentCountButton,
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
  final Widget? voteButton;
  final Widget? commentCountButton;

  Color titleColor(ColorScheme colorScheme) {
    if (hasBeenVisited) return colorScheme.onSurfaceVariant;
    return colorScheme.onSurface;
  }
}
