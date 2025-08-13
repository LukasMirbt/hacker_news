import 'package:flutter/material.dart';

class AppPostHeaderVoteButtonData {
  const AppPostHeaderVoteButtonData({
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

  double get weight {
    if (hasBeenUpvoted) return 700;
    return 500;
  }

  // TODO(LukasMirbt): Add voteIconGrade
}
