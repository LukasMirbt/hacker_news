import 'package:app_ui/app_ui.dart';
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

  Color? iconColor(ColorScheme colorScheme) {
    if (hasBeenUpvoted) return colorScheme.onSurface;
    return null;
  }

  double? get iconGrade {
    if (hasBeenUpvoted) return 200;
    return null;
  }

  TextStyle? textStyle(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    if (!hasBeenUpvoted) return null;

    return textTheme.bodySmall!
        .copyWithWeight(
          (weight) => weight * 1.75,
        )
        .copyWith(
          color: colorScheme.onSurface,
        );
  }
}
