import 'package:flutter/widgets.dart';

class SelectedCommentModel {
  const SelectedCommentModel({
    required this.id,
    required this.index,
  });

  final String id;
  final int index;

  double get alignment => 0;

  Curve curve(_) => Curves.easeInOut;

  Duration duration(double estimatedDistance) {
    if (estimatedDistance > 2000) return Duration.zero;

    final calculatedValue = (estimatedDistance * 0.8).round();

    const min = 250;
    const max = 600;
    final clampedValue = calculatedValue.clamp(min, max);

    return Duration(milliseconds: clampedValue);
  }
}
