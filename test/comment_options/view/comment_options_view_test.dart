// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/comment_options.dart';

import '../../app/pump_app.dart';

void main() {
  group(CommentOptionsView, () {
    Widget buildSubject() => CommentOptionsView();

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ReplyOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
