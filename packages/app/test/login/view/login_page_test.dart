// ignore_for_file: prefer_const_constructors

import 'package:app/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

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
