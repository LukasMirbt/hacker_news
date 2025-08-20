// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group(AppLoadingView, () {
    Widget buildSubject() => AppLoadingView();

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AppLoadingView),
          matching: find.byType(SafeArea),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders $CircularProgressIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
