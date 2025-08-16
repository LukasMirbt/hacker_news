// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(SettingsBody, () {
    Widget buildSubject() => SettingsBody();

    testWidgets('renders $ThemeListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThemeListItem), findsOneWidget);
    });

    testWidgets('renders $DataCollectionListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DataCollectionListItem), findsOneWidget);
    });

    testWidgets('renders $LicenseListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LicenseListItem), findsOneWidget);
    });

    testWidgets('renders $PrivacyPolicyListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PrivacyPolicyListItem), findsOneWidget);
    });

    testWidgets('renders $UserSection', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserSection), findsOneWidget);
    });
  });
}
