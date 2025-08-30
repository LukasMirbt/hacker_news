import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

  @override
  IconThemeData get iconTheme {
    return super.iconTheme.copyWith(
      grade: 0,
    );
  }

  @override
  SkeletonizerConfigData get skeletonizerConfig {
    return SkeletonizerConfigData(
      effect: ShimmerEffect(
        baseColor: colors.outlineVariant,
        highlightColor: colors.surfaceContainerLow,
      ),
    );
  }
}
