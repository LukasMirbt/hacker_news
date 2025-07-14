import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppFeedItemVoteButtonData extends Equatable {
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

  double get weight {
    if (hasBeenUpvoted) return 700;
    return 500;
  }

  @override
  List<Object?> get props => [
    hasBeenUpvoted,
    score,
    onPressed,
  ];
}
