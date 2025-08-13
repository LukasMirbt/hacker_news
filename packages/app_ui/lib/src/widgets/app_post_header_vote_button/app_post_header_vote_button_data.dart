import 'package:app_ui/app_ui.dart';
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

  Color iconColor(ColorScheme colorScheme) {
    if (hasBeenUpvoted) return colorScheme.onSurface;
    return colorScheme.onSurfaceVariant;
  }

  double get iconGrade {
    if (hasBeenUpvoted) return 200;
    return 0;
  }

  TextStyle textStyle(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final style = textTheme.bodySmall!;
    if (!hasBeenUpvoted) return style;

    return style
        .copyWithWeight(
          (weight) => weight * 1.75,
        )
        .copyWith(
          color: colorScheme.onSurface,
        );
  }
}
