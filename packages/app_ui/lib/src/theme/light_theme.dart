import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme extends AppTheme {
  const LightTheme();

  @override
  LightColors get colors => const LightColors();

  @override
  LightTextStyles get textStyles => const LightTextStyles();

  @override
  SystemUiOverlayStyle get systemOverlayStyle {
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: colors.surface,
      systemNavigationBarDividerColor: colors.surface,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}
