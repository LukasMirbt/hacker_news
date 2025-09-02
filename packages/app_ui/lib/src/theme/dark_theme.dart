import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DarkTheme extends AppTheme {
  const DarkTheme();

  @override
  DarkColors get colors => const DarkColors();

  @override
  ColorScheme get baseColorScheme => const ColorScheme.dark();

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

  @override
  IconThemeData get iconTheme {
    return super.iconTheme.copyWith(
      grade: -25,
    );
  }

  @override
  SkeletonizerConfigData get skeletonizerConfig {
    return SkeletonizerConfigData(
      justifyMultiLineText: false,
      effect: ShimmerEffect(
        baseColor: colors.surfaceContainerHigh,
        highlightColor: colors.surfaceContainerHighest,
      ),
    );
  }
}
