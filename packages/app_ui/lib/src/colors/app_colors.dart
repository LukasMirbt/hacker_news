import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors();

  Brightness get brightness;

  Color get primary;
  Color get onPrimary;

  Color get primaryContainer;
  Color get onPrimaryContainer;

  // Navigation drawer indicator color
  Color get secondaryContainer;
  // Navigation drawer indicator text color
  Color get onSecondaryContainer;

  Color get tertiary;
  Color get onTertiary;

  Color get surface;
  Color get onSurface;
  Color get onSurfaceVariant;

  Color get outline;
  Color get outlineVariant;

  // Navigation drawer background color
  Color get surfaceContainerLow;
  Color get surfaceContainerHighest;

  Color get surfaceTint;
}
