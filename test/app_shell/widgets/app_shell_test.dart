// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

void main() {
  group(AppShell, () {
    GoRouter buildSubject() {
      return GoRouter(
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (_, _, shell) {
              return Provider.value(
                value: shell,
                child: AppShell(),
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (_, __) => Container(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    testWidgets('renders $ShellBackButtonListener', (tester) async {
      await tester.pumpAppWithRouter(buildSubject());
      expect(
        find.byType(ShellBackButtonListener),
        findsOneWidget,
      );
    });

    group(Scaffold, () {
      Scaffold findWidget(WidgetTester tester) {
        return tester.widget<Scaffold>(
          find.descendant(
            of: find.byType(AppShell),
            matching: find.byType(Scaffold),
          ),
        );
      }

      testWidgets('drawer is $ShellDrawer', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        expect(widget.drawer, isA<ShellDrawer>());
      });

      testWidgets('appBar is $ShellAppBar', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        expect(widget.appBar, isA<ShellAppBar>());
      });

      testWidgets('body is $StatefulNavigationShell', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        expect(widget.body, isA<StatefulNavigationShell>());
      });
    });
  });
}
