// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';

import '../../app/pump_app.dart';

void main() {
  group(CreateAccountPage, () {
    Widget buildSubject() => CreateAccountPage(from: 'from');

    testWidgets('renders $CreateAccountView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountView), findsOneWidget);
    });
  });
}
