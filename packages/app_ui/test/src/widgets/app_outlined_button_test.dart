// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  group(AppOutlinedButton, () {
    AppOutlinedButton buildSubject({
      AppButtonSize? size,
      bool? isLoading,
      void Function()? onPressed,
      Widget? child,
    }) {
      return AppOutlinedButton(
        isLoading: isLoading ?? false,
        size: size ?? AppButtonSize.shrink,
        onPressed: onPressed ?? () {},
        child: child ?? Container(),
      );
    }

    OutlinedButton findWidget(WidgetTester tester) {
      return tester.widget<OutlinedButton>(
        find.byType(OutlinedButton),
      );
    }

    group('shrink', () {
      test('returns $AppOutlinedButton with correct values', () {
        const isLoading = true;
        final onPressed = () {};
        final child = Container();

        final button = AppOutlinedButton.shrink(
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
      test('returns $AppOutlinedButton with correct values', () {
        const isLoading = true;
        final onPressed = () {};
        final child = Container();

        final button = AppOutlinedButton.expand(
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

    testWidgets('renders $OutlinedButton ', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OutlinedButton), findsOneWidget);
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
      expect(
        widget.style?.minimumSize,
        WidgetStatePropertyAll<Size?>(size.value),
      );
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
        find.byType(AppOutlinedButton),
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
        find.byType(OutlinedButton),
      );

      expect(tapped, false);
    });

    testWidgets('renders $InvisiblePlaceholder with visible: true '
        'when !isLoading', (tester) async {
      final child = Container();
      await tester.pumpApp(
        buildSubject(
          child: child,
          isLoading: false,
        ),
      );

      final widget = tester.widget<InvisiblePlaceholder>(
        find.ancestor(
          of: find.byWidget(child),
          matching: find.byType(InvisiblePlaceholder),
        ),
      );

      expect(widget.visible, true);
    });

    testWidgets('renders $InvisiblePlaceholder with visible: false '
        'when isLoading', (tester) async {
      final child = Container();
      await tester.pumpApp(
        buildSubject(
          child: child,
          isLoading: true,
        ),
      );

      final widget = tester.widget<InvisiblePlaceholder>(
        find.ancestor(
          of: find.byWidget(child),
          matching: find.byType(InvisiblePlaceholder),
        ),
      );

      expect(widget.visible, false);
    });

    testWidgets('renders $ButtonSpinner when isLoading', (tester) async {
      await tester.pumpApp(
        buildSubject(isLoading: true),
      );
      expect(find.byType(ButtonSpinner), findsOneWidget);
    });

    testWidgets('does not render $ButtonSpinner '
        'when !isLoading', (tester) async {
      await tester.pumpApp(
        buildSubject(isLoading: false),
      );
      expect(find.byType(ButtonSpinner), findsNothing);
    });
  });
}
