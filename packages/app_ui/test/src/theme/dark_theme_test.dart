// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _TestAppTheme extends AppTheme {
  @override
  AppColors get colors => DarkColors();

  @override
  ColorScheme get baseColorScheme => ColorScheme.dark();

  @override
  DarkTextStyles get textStyles => DarkTextStyles();

  @override
  SystemUiOverlayStyle get systemOverlayStyle => SystemUiOverlayStyle.light;

  @override
  SkeletonizerConfigData get skeletonizerConfig => SkeletonizerConfigData();
}

void main() {
  final colors = DarkColors();

  group(DarkTheme, () {
    DarkTheme createSubject() => DarkTheme();

    group('colors', () {
      test('returns $DarkColors', () {
        final theme = createSubject();
        expect(
          theme.colors,
          isA<DarkColors>(),
        );
      });
    });

    group('baseColorScheme', () {
      test('returns correct $ColorScheme', () {
        final theme = createSubject();
        expect(
          theme.baseColorScheme,
          ColorScheme.dark(),
        );
      });
    });

    group('textStyles', () {
      test('returns $DarkTextStyles', () {
        final theme = createSubject();
        expect(
          theme.textStyles,
          isA<DarkTextStyles>(),
        );
      });
    });

    group('systemOverlayStyle', () {
      test('returns correct $SystemUiOverlayStyle', () {
        final theme = createSubject();
        expect(
          theme.systemOverlayStyle,
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: colors.surface,
            systemNavigationBarDividerColor: colors.surface,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      });
    });

    group('iconTheme', () {
      test('returns correct $IconThemeData', () {
        final baseTheme = _TestAppTheme();
        final theme = createSubject();
        expect(
          theme.iconTheme,
          baseTheme.iconTheme.copyWith(
            grade: -25,
          ),
        );
      });
    });

    group('skeletonizerConfig', () {
      test('returns correct $SkeletonizerConfigData', () {
        final theme = createSubject();
        expect(
          theme.skeletonizerConfig,
          isA<SkeletonizerConfigData>().having(
            (config) => config.effect,
            'effect',
            ShimmerEffect(
              baseColor: colors.surfaceContainerHigh,
              highlightColor: colors.surfaceContainerHighest,
            ),
          ),
        );
      });
    });
  });
}
