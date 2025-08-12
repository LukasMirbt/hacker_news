// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/delete_draft/delete_draft.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

void main() {
  group(CancelButton, () {
    late MockNavigator navigator;

    setUp(() {
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: CancelButton(),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('pops when $TextButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(TextButton));
      verify(navigator.pop).called(1);
    });
  });
}
