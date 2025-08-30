// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _TestAppTheme extends AppTheme {
  @override
  AppColors get colors => LightColors();

  @override
  ColorScheme get baseColorScheme => ColorScheme.light();

  @override
  LightTextStyles get textStyles => LightTextStyles();

  @override
  SystemUiOverlayStyle get systemOverlayStyle => SystemUiOverlayStyle.dark;

  @override
  SkeletonizerConfigData get skeletonizerConfig => SkeletonizerConfigData();
}

void main() {
  final colors = LightColors();

  group(LightTheme, () {
    LightTheme createSubject() => LightTheme();

    group('colors', () {
      test('returns $LightColors', () {
        final theme = createSubject();
        expect(
          theme.colors,
          isA<LightColors>(),
        );
      });
    });

    group('baseColorScheme', () {
      test('returns correct $ColorScheme', () {
        final theme = createSubject();
        expect(
          theme.baseColorScheme,
          ColorScheme.light(),
        );
      });
    });

    group('textStyles', () {
      test('returns $LightTextStyles', () {
        final theme = createSubject();
        expect(
          theme.textStyles,
          isA<LightTextStyles>(),
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
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: colors.surface,
            systemNavigationBarDividerColor: colors.surface,
            systemNavigationBarIconBrightness: Brightness.dark,
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
            grade: 0,
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
              baseColor: colors.outlineVariant,
              highlightColor: colors.surfaceContainerLow,
            ),
          ),
        );
      });
    });
  });
}
