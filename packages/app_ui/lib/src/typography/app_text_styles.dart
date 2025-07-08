import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  const AppTextStyles();

  static const _fontPackage = 'app_ui';

  static const _baseTextStyle = TextStyle(
    fontFamily: FontFamily.notoSans,
    package: _fontPackage,
    fontVariations: [
      FontVariation.weight(400),
    ],
  );

  TextStyle transform(TextStyle style) => _baseTextStyle.merge(style);

  TextStyle get displayLarge => transform(
    const TextStyle(
      fontSize: 57,
      height: 1.12,
      letterSpacing: -0.25,
    ),
  );

  TextStyle get displayMedium => transform(
    const TextStyle(
      fontSize: 45,
      height: 1.16,
    ),
  );

  TextStyle get displaySmall => transform(
    const TextStyle(
      fontSize: 36,
      height: 1.22,
    ),
  );

  TextStyle get headlineLarge => transform(
    const TextStyle(
      fontSize: 32,
      height: 1.25,
    ),
  );

  TextStyle get headlineMedium => transform(
    const TextStyle(
      fontSize: 28,
      height: 1.29,
    ),
  );

  TextStyle get headlineSmall => transform(
    const TextStyle(
      fontSize: 24,
      height: 1.33,
    ),
  );

  TextStyle get titleLarge => transform(
    const TextStyle(
      fontSize: 22,
      height: 1.27,
    ),
  );

  TextStyle get titleMedium => transform(
    const TextStyle(
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
      fontVariations: [
        FontVariation.weight(500),
      ],
    ),
  );

  TextStyle get titleSmall => transform(
    const TextStyle(
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
      fontVariations: [
        FontVariation.weight(500),
      ],
    ),
  );

  TextStyle get labelLargeProminent => transform(
    const TextStyle(
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
      fontVariations: [
        FontVariation.weight(700),
      ],
    ),
  );

  TextStyle get labelLarge => transform(
    const TextStyle(
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
      fontVariations: [
        FontVariation.weight(500),
      ],
    ),
  );

  TextStyle get labelMediumProminent => transform(
    const TextStyle(
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
      fontVariations: [
        FontVariation.weight(700),
      ],
    ),
  );

  TextStyle get labelMedium => transform(
    const TextStyle(
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
      fontVariations: [
        FontVariation.weight(500),
      ],
    ),
  );

  TextStyle get labelSmall => transform(
    const TextStyle(
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
      fontVariations: [
        FontVariation.weight(500),
      ],
    ),
  );

  TextStyle get bodyLarge => transform(
    const TextStyle(
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
  );

  TextStyle get bodyMedium => transform(
    const TextStyle(
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
    ),
  );

  TextStyle get bodySmall => transform(
    const TextStyle(
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.4,
    ),
  );
}
