// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/home/home.dart';

import '../../app_shell/pump_app_shell.dart';

void main() {
  group(HomePage, () {
    Widget buildSubject() => HomePage();

    testWidgets('renders $HomeTabBar', (tester) async {
      await tester.pumpAppShell(buildSubject());
      expect(find.byType(HomeTabBar), findsOneWidget);
    });

    testWidgets('renders $HomeTabBarView', (tester) async {
      await tester.pumpAppShell(buildSubject());
      expect(find.byType(HomeTabBarView), findsOneWidget);
    });
  });
}
