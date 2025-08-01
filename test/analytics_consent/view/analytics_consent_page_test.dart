// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

import '../../app/pump_app.dart';

void main() {
  group(AnalyticsConsentPage, () {
    Widget buildSubject() => AnalyticsConsentPage();

    testWidgets('renders $AnalyticsConsentView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AnalyticsConsentView), findsOneWidget);
    });
  });
}
