// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(SettingsPage, () {
    Widget buildSubject() => SettingsPage();

    testWidgets('renders $ThemeSection', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThemeSection), findsOneWidget);
    });

    testWidgets('renders $GeneralSection', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(GeneralSection), findsOneWidget);
    });

    testWidgets('renders $UserSection', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserSection), findsOneWidget);
    });
  });
}
