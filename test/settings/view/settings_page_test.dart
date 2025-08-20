// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(SettingsPage, () {
    Widget buildSubject() => SettingsPage();

    testWidgets('renders $SingleChildScrollView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders $ThemeListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThemeListItem), findsOneWidget);
    });

    testWidgets('renders $ContentSettingsListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ContentSettingsListItem), findsOneWidget);
    });

    testWidgets('renders $DataCollectionListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DataCollectionListItem), findsOneWidget);
    });

    testWidgets('renders $AboutListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AboutListItem), findsOneWidget);
    });

    testWidgets('renders $UserSection', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserSection), findsOneWidget);
    });
  });
}
