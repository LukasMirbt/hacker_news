import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

extension on TextStyle {
  static const _weightFactor = 0.85;

  TextStyle withReducedWeight() {
    return copyWithWeight(
      (weight) => (weight * _weightFactor).clamp(100, 1000),
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
