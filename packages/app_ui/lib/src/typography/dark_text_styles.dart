import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

extension on TextStyle {
  static const _weightFactor = 0.85;

  TextStyle withReducedWeight() {
    final weightAxis = const FontVariation.weight(400).axis;
    final variations = fontVariations ?? [];
    return copyWith(
      fontVariations: [
        for (final variation in variations)
          if (variation.axis == weightAxis)
            FontVariation.weight(
              (variation.value * _weightFactor).clamp(100, 1000),
            )
          else
            variation,
      ],
    );
  }
}

class DarkTextStyles extends AppTextStyles {
  const DarkTextStyles();

  @override
  TextStyle transform(TextStyle style) {
    return super.transform(style).withReducedWeight();
  }
}
