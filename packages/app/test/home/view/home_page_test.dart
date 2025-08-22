// ignore_for_file: prefer_const_constructors

import 'package:app/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

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
