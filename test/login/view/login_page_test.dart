// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/login/login.dart';

import '../../app/pump_app.dart';

void main() {
  group(LoginPage, () {
    Widget buildSubject() => LoginPage(from: 'from');

    testWidgets('renders $LoginView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
