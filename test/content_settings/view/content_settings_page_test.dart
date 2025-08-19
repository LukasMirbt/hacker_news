// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/content_settings/content_settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(ContentSettingsPage, () {
    Widget buildSubject() => ContentSettingsPage();

    testWidgets('renders $ContentSettingsView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ContentSettingsView), findsOneWidget);
    });
  });
}
