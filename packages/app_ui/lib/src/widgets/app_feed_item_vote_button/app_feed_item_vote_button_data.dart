import 'package:flutter/material.dart';

class AppFeedItemVoteButtonData {
  const AppFeedItemVoteButtonData({
    required this.hasBeenUpvoted,
    required this.score,
    required this.onPressed,
  });

  final bool hasBeenUpvoted;
  final String score;
  final void Function() onPressed;

  Color color(ColorScheme colorScheme) {
    if (hasBeenUpvoted) return colorScheme.onSurface;
    return colorScheme.onSurfaceVariant;
  }

  // TODO: Use grade instead
  double get weight {
    if (hasBeenUpvoted) return 700;
    return 500;
  }
}
