import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExtendedTextTheme extends ThemeExtension<ExtendedTextTheme>
    with EquatableMixin {
  const ExtendedTextTheme({
    this.labelLargeProminent,
    this.labelMediumProminent,
  });

  static ExtendedTextTheme of(BuildContext context) =>
      Theme.of(context).extension<ExtendedTextTheme>()!;

  final TextStyle? labelLargeProminent;
  final TextStyle? labelMediumProminent;

  ExtendedTextTheme apply({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor,
    Color? bodyColor,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) {
    return ExtendedTextTheme(
      labelLargeProminent: labelLargeProminent?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        package: package,
      ),
      labelMediumProminent: labelMediumProminent?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        package: package,
      ),
    );
  }

  @override
  ExtendedTextTheme copyWith({
    TextStyle? labelLargeProminent,
    TextStyle? labelMediumProminent,
  }) {
    return ExtendedTextTheme(
      labelLargeProminent: labelLargeProminent ?? this.labelLargeProminent,
      labelMediumProminent: labelMediumProminent ?? this.labelMediumProminent,
    );
  }

  @override
  ExtendedTextTheme lerp(ExtendedTextTheme? other, double t) {
    if (other is! ExtendedTextTheme) return this;

    return ExtendedTextTheme(
      labelLargeProminent: TextStyle.lerp(
        labelLargeProminent,
        other.labelLargeProminent,
        t,
      ),
      labelMediumProminent: TextStyle.lerp(
        labelMediumProminent,
        other.labelMediumProminent,
        t,
      ),
    );
  }

  @override
  List<Object?> get props => [
    labelLargeProminent,
    labelMediumProminent,
  ];
}
