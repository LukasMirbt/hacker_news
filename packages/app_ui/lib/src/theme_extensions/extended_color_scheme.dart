import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExtendedColorScheme extends ThemeExtension<ExtendedColorScheme>
    with EquatableMixin {
  const ExtendedColorScheme({
    this.highlight,
  });

  static ExtendedColorScheme of(BuildContext context) =>
      Theme.of(context).extension<ExtendedColorScheme>()!;

  final Color? highlight;

  @override
  ExtendedColorScheme lerp(ExtendedColorScheme? other, double t) {
    if (other is! ExtendedColorScheme) return this;

    return ExtendedColorScheme(
      highlight: Color.lerp(
        highlight,
        other.highlight,
        t,
      ),
    );
  }

  @override
  ExtendedColorScheme copyWith({
    Color? highlight,
  }) {
    return ExtendedColorScheme(
      highlight: highlight ?? this.highlight,
    );
  }

  @override
  List<Object?> get props => [
    highlight,
  ];
}
