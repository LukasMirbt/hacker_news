// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  const icon = Symbols.abc_rounded;
  const title = 'title';
  const body = 'body';

  group(AppEmptyView, () {
    Widget buildSubject() {
      return AppEmptyView(
        icon: icon,
        title: title,
        body: body,
      );
    }

    ColorScheme findColorScheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(AppEmptyView),
      );
      return ColorScheme.of(context);
    }

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AppEmptyView),
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
              icon,
            )
            .having(
              (widget) => widget.size,
              'size',
              40,
            )
            .having(
              (widget) => widget.color,
              'color',
              colorScheme.secondary,
            ),
      );
    });

    testWidgets('renders title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('renders body', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(body), findsOneWidget);
    });
  });
}
