import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class AppTheme {
  const AppTheme();

  AppColors get colors;
  AppTextStyles get textStyles;
  SystemUiOverlayStyle get systemOverlayStyle;

  ThemeData get themeData {
    return ThemeData(
      appBarTheme: _appBarTheme,
      bottomSheetTheme: _bottomSheetTheme,
      colorScheme: _colorScheme,
      filledButtonTheme: _filledButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      listTileTheme: _listTileTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      pageTransitionsTheme: _pageTransitionsTheme,
      tabBarTheme: _tabBarTheme,
      textButtonTheme: _textButtonTheme,
      textTheme: _textTheme,
      extensions: [
        _extendedTextTheme,
        _skeletonizerConfig,
      ],
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      scrolledUnderElevation: 0,
      systemOverlayStyle: systemOverlayStyle,
      centerTitle: true,
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      constraints: BoxConstraints(minHeight: 200),
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      brightness: colors.brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      tertiary: colors.tertiary,
      onTertiary: colors.onTertiary,
      surface: colors.surface,
      onSurface: colors.onSurface,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      surfaceContainerLow: colors.surfaceContainerLow,
      surfaceContainerHighest: colors.surfaceContainerHighest,
      surfaceTint: colors.surfaceTint,
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colors.onPrimary),
        shape: const WidgetStatePropertyAll(StadiumBorder()),
        maximumSize: const WidgetStatePropertyAll(Size.infinite),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: colors.outlineVariant),
        ),
        shape: const WidgetStatePropertyAll(StadiumBorder()),
        maximumSize: const WidgetStatePropertyAll(Size.infinite),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
      ),
    );
  }

  PageTransitionsTheme get _pageTransitionsTheme {
    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          // Needed to prevent unexpected ink splash when navigating.
          // https://github.com/flutter/flutter/issues/119897
          allowEnterRouteSnapshotting: false,
        ),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }

  TabBarThemeData get _tabBarTheme {
    return const TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.start,
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return const TextButtonThemeData();
  }

  TextTheme get _textTheme {
    return TextTheme(
      displayLarge: textStyles.displayLarge,
      displayMedium: textStyles.displayMedium,
      displaySmall: textStyles.displaySmall,
      headlineLarge: textStyles.headlineLarge,
      headlineMedium: textStyles.headlineMedium,
      headlineSmall: textStyles.headlineSmall,
      titleLarge: textStyles.titleLarge,
      titleMedium: textStyles.titleMedium,
      titleSmall: textStyles.titleSmall,
      bodyLarge: textStyles.bodyLarge,
      bodyMedium: textStyles.bodyMedium,
      bodySmall: textStyles.bodySmall,
      labelLarge: textStyles.labelLarge,
      labelMedium: textStyles.labelMedium,
      labelSmall: textStyles.labelSmall,
    ).apply(
      bodyColor: colors.onSurface,
      displayColor: colors.onSurface,
      decorationColor: colors.onSurface,
    );
  }

  ExtendedTextTheme get _extendedTextTheme {
    return ExtendedTextTheme(
      labelLargeProminent: textStyles.labelLargeProminent,
      labelMediumProminent: textStyles.labelMediumProminent,
    ).apply(
      bodyColor: colors.onSurface,
      displayColor: colors.onSurface,
      decorationColor: colors.onSurface,
    );
  }

  SkeletonizerConfigData get _skeletonizerConfig {
    return SkeletonizerConfigData(
      effect: ShimmerEffect(
        baseColor: colors.surfaceContainerHighest,
        highlightColor: colors.surface,
      ),
    );
  }
}
