import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme extends AppTheme {
  const DarkTheme();

  @override
  DarkColors get colors => const DarkColors();

  @override
  DarkTextStyles get textStyles => const DarkTextStyles();

  @override
  SystemUiOverlayStyle get systemOverlayStyle {
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: colors.surface,
      systemNavigationBarDividerColor: colors.surface,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}
