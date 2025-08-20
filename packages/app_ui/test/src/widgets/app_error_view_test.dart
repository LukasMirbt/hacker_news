// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() async {
  final l10n = await AppUiLocalizations.delegate.load(Locale('en'));

  group(AppErrorView, () {
    Widget buildSubject() => AppErrorView();

    ColorScheme findColorScheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(AppErrorView),
      );
      return ColorScheme.of(context);
    }

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AppErrorView),
          matching: find.byType(SafeArea),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<AppIcon>(
        find.byType(AppIcon),
      );
      final colorScheme = findColorScheme(tester);
      expect(
        widget,
        isA<AppIcon>()
            .having(
              (widget) => widget.icon,
              'icon',
              Symbols.error_rounded,
            )
            .having(
              (widget) => widget.size,
              'size',
              40,
            )
            .having(
              (widget) => widget.color,
              'color',
              colorScheme.error,
            ),
      );
    });

    testWidgets('renders errorTitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(l10n.errorTitle), findsOneWidget);
    });

    testWidgets('renders errorBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(l10n.errorBody), findsOneWidget);
    });
  });
}
