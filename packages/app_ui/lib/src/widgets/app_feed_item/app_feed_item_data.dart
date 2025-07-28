import 'package:app_ui/src/typography/text_style_extension.dart';
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

  TextStyle? titleStyle(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final style = textTheme.titleMedium;
    if (style == null) return null;

    Color color;
    double weightFactor;

    if (hasBeenVisited) {
      color = colorScheme.onSurfaceVariant;
      weightFactor = 0.9;
    } else {
      color = colorScheme.onSurface;
      weightFactor = 1.0;
    }

    return style
        .copyWithWeight(
          (weight) => weight * weightFactor,
        )
        .copyWith(
          color: color,
        );
  }

  TextStyle? rankStyle(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final style = textTheme.titleMedium;
    if (style == null) return null;

    double weightFactor;

    if (hasBeenVisited) {
      weightFactor = 0.9;
    } else {
      weightFactor = 1.0;
    }

    return style
        .copyWithWeight(
          (weight) => weight * weightFactor,
        )
        .copyWith(
          color: colorScheme.onSurfaceVariant,
        );
  }
}
