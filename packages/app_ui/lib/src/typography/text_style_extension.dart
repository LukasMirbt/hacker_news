import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle copyWithWeight(
    double Function(double previous) updateWeight,
  ) {
    const weightAxis = 'wght';
    final variations = fontVariations ?? [];
    return copyWith(
      fontVariations: [
        for (final variation in variations)
          if (variation.axis == weightAxis)
            FontVariation.weight(
              updateWeight(variation.value),
            )
          else
            variation,
      ],
    );
  }
}
