// ignore_for_file: prefer_const_constructors

import 'package:app/about/about.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(AboutPage, () {
    Widget buildSubject() => AboutPage();

    testWidgets('renders $AboutView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AboutView), findsOneWidget);
    });
  });
}
