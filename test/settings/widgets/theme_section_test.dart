// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:hacker_client/theme/theme.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThemeSection, () {
    Widget buildSubject() => ThemeSection();

    testWidgets('renders $ThemeRadioGroup', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThemeRadioGroup), findsOneWidget);
    });
  });
}
