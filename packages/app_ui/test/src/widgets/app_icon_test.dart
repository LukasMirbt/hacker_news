// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  const icon = Symbols.home_rounded;
  const size = 32.0;
  const weight = 500.0;
  const grade = 100.0;
  const opticalSize = 28.0;
  const color = Colors.red;

  group(AppIcon, () {
    Icon findWidget(WidgetTester tester) {
      return tester.widget<Icon>(find.byType(Icon));
    }

    group('default constructor', () {
      test('returns $AppIcon with correct values', () {
        final widget = AppIcon(
          icon,
          size: size,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: color,
        );

        expect(widget.icon, icon);
        expect(widget.size, size);
        expect(widget.fill, 0.0);
        expect(widget.weight, weight);
        expect(widget.grade, grade);
        expect(widget.opticalSize, opticalSize);
        expect(widget.color, color);
      });
    });

    group('filled', () {
      testWidgets('returns $AppIcon with correct values', (tester) async {
        final widget = AppIcon.filled(
          icon,
          size: size,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: color,
        );

        expect(widget.icon, icon);
        expect(widget.size, size);
        expect(widget.fill, 1.0);
        expect(widget.weight, weight);
        expect(widget.grade, grade);
        expect(widget.opticalSize, opticalSize);
        expect(widget.color, color);
      });
    });

    testWidgets('renders $Icon with correct values '
        'when data is non-null', (tester) async {
      await tester.pumpApp(
        AppIcon(
          icon,
          size: size,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: color,
        ),
      );

      final widget = findWidget(tester);

      expect(widget.icon, icon);
      expect(widget.size, size);
      expect(widget.fill, 0.0);
      expect(widget.weight, weight);
      expect(widget.grade, grade);
      expect(widget.opticalSize, opticalSize);
      expect(widget.color, color);
    });

    testWidgets('renders $Icon with correct values '
        'when data is null', (tester) async {
      await tester.pumpApp(
        AppIcon(icon),
      );

      final widget = findWidget(tester);

      expect(widget.icon, icon);
      expect(widget.size, null);
      expect(widget.fill, 0.0);
      expect(widget.weight, null);
      expect(widget.grade, null);
      expect(widget.opticalSize, null);
      expect(widget.color, null);
    });

    testWidgets('renders $Icon with correct values '
        'when data is non-null and brightness '
        'is ${Brightness.dark}', (tester) async {
      await tester.pumpApp(
        Theme(
          data: DarkTheme().themeData,
          child: AppIcon(
            icon,
            size: size,
            weight: weight,
            grade: grade,
            opticalSize: opticalSize,
            color: color,
          ),
        ),
      );

      final widget = findWidget(tester);

      expect(widget.icon, icon);
      expect(widget.size, size);
      expect(widget.fill, 0.0);
      expect(widget.weight, weight);
      expect(widget.grade, 75);
      expect(widget.opticalSize, opticalSize);
      expect(widget.color, color);
    });

    testWidgets('renders $Icon with correct opticalSize '
        'when null and size is non-null', (tester) async {
      const value = 20.0;
      await tester.pumpApp(
        Theme(
          data: LightTheme().themeData,
          child: AppIcon(
            icon,
            size: value,
          ),
        ),
      );
      final widget = findWidget(tester);
      expect(widget.size, value);
      expect(widget.opticalSize, value);
    });

    testWidgets('renders $Icon with correct opticalSize '
        'when non-null and size is null', (tester) async {
      const value = 20.0;
      await tester.pumpApp(
        Theme(
          data: LightTheme().themeData,
          child: AppIcon(
            icon,
            opticalSize: value,
          ),
        ),
      );
      final widget = findWidget(tester);
      expect(widget.size, null);
      expect(widget.opticalSize, value);
    });

    testWidgets('renders $Icon with correct grade '
        'when brightness is ${Brightness.light}', (tester) async {
      const grade = 100.0;
      await tester.pumpApp(
        Theme(
          data: LightTheme().themeData,
          child: AppIcon(
            icon,
            grade: grade,
          ),
        ),
      );
      final widget = findWidget(tester);
      expect(widget.grade, grade);
    });

    testWidgets('renders $Icon with correct grade '
        'when brightness is ${Brightness.dark}', (tester) async {
      const grade = 100.0;
      await tester.pumpApp(
        Theme(
          data: DarkTheme().themeData,
          child: AppIcon(
            icon,
            grade: grade,
          ),
        ),
      );
      final widget = findWidget(tester);
      expect(widget.grade, grade - 25);
    });
  });
}
