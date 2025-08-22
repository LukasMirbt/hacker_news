// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(PostAppBar, () {
    Widget buildSubject() => PostAppBar();

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $PostBackButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostBackButton), findsOneWidget);
    });

    testWidgets('renders $PostOptionsButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostOptionsButton), findsOneWidget);
    });
  });
}
