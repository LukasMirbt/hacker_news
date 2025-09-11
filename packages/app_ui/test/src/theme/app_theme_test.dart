// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/system_chrome.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../helpers/pump_app.dart';

class _TestAppTheme extends AppTheme {
  _TestAppTheme({
    required this.colors,
    required this.baseColorScheme,
    required this.textStyles,
    required this.systemOverlayStyle,
  });

  @override
  final AppColors colors;

  @override
  final ColorScheme baseColorScheme;

  @override
  final AppTextStyles textStyles;

  @override
  final SystemUiOverlayStyle systemOverlayStyle;
}

void main() {
  final colors = LightColors();
  final baseColorScheme = ColorScheme.light();
  final textStyles = LightTextStyles();
  const systemOverlayStyle = SystemUiOverlayStyle.dark;

  group(AppTheme, () {
    group('themeData', () {
      ThemeData createSubject() {
        final theme = _TestAppTheme(
          colors: colors,
          baseColorScheme: baseColorScheme,
          textStyles: textStyles,
          systemOverlayStyle: systemOverlayStyle,
        );
        return theme.themeData;
      }

      group('actionIconTheme', () {
        group('closeButtonIconBuilder', () {
          testWidgets('returns correct widget', (tester) async {
            final data = createSubject();
            final builder = data.actionIconTheme!.closeButtonIconBuilder!;
            await tester.pumpApp(
              Builder(builder: builder),
            );
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is AppIcon && widget.icon == Symbols.close_rounded,
              ),
              findsOneWidget,
            );
          });
        });

        group('drawerButtonIconBuilder', () {
          testWidgets('returns correct widget', (tester) async {
            final data = createSubject();
            final builder = data.actionIconTheme!.drawerButtonIconBuilder!;
            await tester.pumpApp(
              Builder(builder: builder),
            );
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is AppIcon && widget.icon == Symbols.menu_rounded,
              ),
              findsOneWidget,
            );
          });
        });

        group('backButtonIconBuilder', () {
          testWidgets('returns correct widget when platform '
              'is ${TargetPlatform.iOS}', (tester) async {
            final data = createSubject();
            final builder = data.actionIconTheme!.backButtonIconBuilder!;
            await tester.pumpApp(
              Theme(
                data: ThemeData(
                  platform: TargetPlatform.iOS,
                ),
                child: Builder(builder: builder),
              ),
            );
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is AppIcon &&
                    widget.icon == Symbols.arrow_back_ios_new_rounded,
              ),
              findsOneWidget,
            );
          });

          testWidgets('returns correct widget when platform '
              'is ${TargetPlatform.android}', (tester) async {
            final data = createSubject();
            final builder = data.actionIconTheme!.backButtonIconBuilder!;
            await tester.pumpApp(
              Theme(
                data: ThemeData(
                  platform: TargetPlatform.android,
                ),
                child: Builder(builder: builder),
              ),
            );
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is AppIcon &&
                    widget.icon == Symbols.arrow_back_rounded,
              ),
              findsOneWidget,
            );
          });
        });
      });

      group('appBarTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.appBarTheme,
            AppBarThemeData(
              scrolledUnderElevation: 0,
              systemOverlayStyle: systemOverlayStyle,
              centerTitle: false,
              shape: Border(
                bottom: BorderSide(
                  color: colors.outlineVariant,
                ),
              ),
              actionsPadding: EdgeInsets.only(
                right: AppSpacing.sm,
              ),
            ),
          );
        });
      });

      group('bottomSheetTheme', () {
        final data = createSubject();
        test('has correct values', () {
          expect(
            data.bottomSheetTheme,
            BottomSheetThemeData(
              constraints: BoxConstraints(minHeight: 200),
            ),
          );
        });
      });

      group('colorScheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.colorScheme,
            baseColorScheme.copyWith(
              brightness: colors.brightness,
              primary: colors.primary,
              onPrimary: colors.onPrimary,
              primaryContainer: colors.primaryContainer,
              onPrimaryContainer: colors.onPrimaryContainer,
              secondary: colors.secondary,
              onSecondary: colors.onSecondary,
              secondaryContainer: colors.secondaryContainer,
              onSecondaryContainer: colors.onSecondaryContainer,
              tertiary: colors.tertiary,
              onTertiary: colors.onTertiary,
              error: colors.error,
              onError: colors.onError,
              surface: colors.surface,
              onSurface: colors.onSurface,
              onSurfaceVariant: colors.onSurfaceVariant,
              outline: colors.outline,
              outlineVariant: colors.outlineVariant,
              surfaceContainerLow: colors.surfaceContainerLow,
              surfaceContainerHigh: colors.surfaceContainerHigh,
              surfaceContainerHighest: colors.surfaceContainerHighest,
              surfaceTint: colors.surfaceTint,
            ),
          );
        });
      });

      group('filledButtonTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.filledButtonTheme,
            FilledButtonThemeData(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(colors.onPrimary),
                shape: WidgetStatePropertyAll(StadiumBorder()),
                maximumSize: WidgetStatePropertyAll(Size.infinite),
                fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
              ),
            ),
          );
        });
      });

      group('iconTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.iconTheme,
            IconThemeData(
              color: colors.onSurface,
              size: 24,
              opticalSize: 24,
              fill: 0,
            ),
          );
        });
      });

      group('inputDecorationTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.inputDecorationTheme,
            InputDecorationThemeData(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          );
        });
      });

      group('listTileTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.listTileTheme,
            ListTileThemeData(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
              ),
            ),
          );
        });
      });

      group('outlinedButtonTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.outlinedButtonTheme,
            OutlinedButtonThemeData(
              style: ButtonStyle(
                side: WidgetStatePropertyAll(
                  BorderSide(color: colors.outlineVariant),
                ),
                shape: WidgetStatePropertyAll(StadiumBorder()),
                maximumSize: WidgetStatePropertyAll(Size.infinite),
                fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
              ),
            ),
          );
        });
      });

      group('pageTransitionsTheme', () {
        group('builders', () {
          test('has correct value for ${TargetPlatform.android}', () {
            final data = createSubject();
            final builders = data.pageTransitionsTheme.builders;
            expect(
              builders[TargetPlatform.android],
              isA<ZoomPageTransitionsBuilder>().having(
                (builder) => builder.allowEnterRouteSnapshotting,
                'allowEnterRouteSnapshotting',
                false,
              ),
            );
          });

          test('has correct value for ${TargetPlatform.iOS}', () {
            final data = createSubject();
            final builders = data.pageTransitionsTheme.builders;
            expect(
              builders[TargetPlatform.iOS],
              isA<CupertinoPageTransitionsBuilder>(),
            );
          });
        });
      });

      group('progressIndicatorTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.progressIndicatorTheme,
            ProgressIndicatorThemeData(
              refreshBackgroundColor: colors.surfaceContainerHigh,
            ),
          );
        });
      });

      group('tabBarTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.tabBarTheme,
            TabBarThemeData(
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              labelColor: colors.onSurface,
            ),
          );
        });
      });

      group('textTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.textTheme,
            TextTheme(
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
              decoration: TextDecoration.none,
            ),
          );
        });
      });

      group('extendedColorScheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.extension<ExtendedColorScheme>(),
            ExtendedColorScheme(
              highlight: colors.highlight,
            ),
          );
        });
      });

      group('extendedTextTheme', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.extension<ExtendedTextTheme>(),
            ExtendedTextTheme(
              labelLargeProminent: textStyles.labelLargeProminent,
              labelMediumProminent: textStyles.labelMediumProminent,
            ).apply(
              bodyColor: colors.onSurface,
              displayColor: colors.onSurface,
              decorationColor: colors.onSurface,
              decoration: TextDecoration.none,
            ),
          );
        });
      });

      group('skeletonizerConfig', () {
        test('has correct values', () {
          final data = createSubject();
          expect(
            data.extension<SkeletonizerConfigData>(),
            isA<SkeletonizerConfigData>().having(
              (config) => config.justifyMultiLineText,
              'justifyMultiLineText',
              false,
            ),
          );
        });
      });
    });
  });
}
