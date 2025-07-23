// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(LicenseListItem, () {
    Widget buildSubject() => LicenseListItem();

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('shows $LicensePage when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();
      expect(find.byType(LicensePage), findsOneWidget);
    });
  });
}
