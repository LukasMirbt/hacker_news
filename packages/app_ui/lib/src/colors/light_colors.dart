import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LightColors extends AppColors {
  const LightColors();

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => const Color(0xFF0056B3);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get primaryContainer => const Color(0xFFD1E7FF);

  @override
  Color get onPrimaryContainer => const Color(0xFF004085);

  @override
  Color get secondaryContainer => const Color(0xFFE4EAF2);

  @override
  Color get onSecondaryContainer => const Color(0xFF2A3B4D);

  @override
  Color get surface => const Color(0xFFF8F9FA);

  @override
  Color get onSurface => const Color(0xFF212529);

  @override
  Color get onSurfaceVariant => const Color(0xFF495057);

  @override
  Color get outline => const Color(0xFFADB5BD);

  @override
  Color get outlineVariant => const Color(0xFFDEE2E6);

  @override
  Color get surfaceContainerLow => const Color(0xFFF1F3F5);

  @override
  Color get surfaceContainerHighest => const Color(0xFFE9ECEF);

  @override
  Color get surfaceTint => const Color(0xFF0069D9);
}
