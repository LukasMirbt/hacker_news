// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(SettingsView, () {
    Widget buildSubject() => SettingsView();

    testWidgets('renders $SettingsBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SettingsBody), findsOneWidget);
    });
  });
}
