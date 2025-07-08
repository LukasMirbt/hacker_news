// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  group(AppFilledButton, () {
    AppFilledButton buildSubject({
      AppButtonSize? size,
      bool? isLoading,
      void Function()? onPressed,
      Widget? child,
    }) {
      return AppFilledButton(
        isLoading: isLoading ?? false,
        size: size ?? AppButtonSize.shrink,
        onPressed: onPressed ?? () {},
        child: child ?? Container(),
      );
    }

    AppFilledButton findWidget(WidgetTester tester) {
      return tester.widget<AppFilledButton>(
        find.byType(AppFilledButton),
      );
    }

    group('shrink', () {
      test('returns $AppFilledButton with correct values', () {
        const isLoading = true;
        final onPressed = () {};
        final child = Container();

        final button = AppFilledButton.shrink(
          isLoading: isLoading,
          onPressed: onPressed,
          child: child,
        );

        expect(button.size, AppButtonSize.shrink);
        expect(button.isLoading, isLoading);
        expect(button.onPressed, onPressed);
        expect(button.child, child);
      });
    });

    group('expand', () {
      test('returns $AppFilledButton with correct values', () {
        const isLoading = true;
        final onPressed = () {};
        final child = Container();

        final button = AppFilledButton.expand(
          isLoading: isLoading,
          onPressed: onPressed,
          child: child,
        );

        expect(button.size, AppButtonSize.expand);
        expect(button.isLoading, isLoading);
        expect(button.onPressed, onPressed);
        expect(button.child, child);
      });
    });

    testWidgets('renders $AppFilledButton ', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppFilledButton), findsOneWidget);
    });

    testWidgets('renders child', (tester) async {
      final child = Container();
      await tester.pumpApp(
        buildSubject(child: child),
      );
      expect(find.byWidget(child), findsOneWidget);
    });

    testWidgets('has correct size', (tester) async {
      const size = AppButtonSize.expand;
      await tester.pumpApp(
        buildSubject(size: size),
      );
      final widget = findWidget(tester);
      expect(widget.size, size);
    });

    testWidgets('calls onPressed when tapped '
        'when !isLoading', (tester) async {
      var tapped = false;

      await tester.pumpApp(
        buildSubject(
          isLoading: false,
          onPressed: () {
            tapped = true;
          },
        ),
      );

      await tester.tap(
        find.byType(AppFilledButton),
      );

      expect(tapped, true);
    });

    testWidgets('does not call onPressed when tapped '
        'when isLoading', (
      tester,
    ) async {
      var tapped = false;

      await tester.pumpApp(
        buildSubject(
          isLoading: true,
          onPressed: () => tapped = true,
        ),
      );

      await tester.tap(
        find.byType(AppFilledButton),
      );

      expect(tapped, false);
    });

    testWidgets('renders $ButtonSpinner when isLoading', (tester) async {
      await tester.pumpApp(
        buildSubject(isLoading: true),
      );
      expect(find.byType(ButtonSpinner), findsOneWidget);
    });
  });
}
