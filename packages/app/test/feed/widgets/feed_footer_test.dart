// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(FeedFooter, () {
    Widget buildSubject() => FeedFooter();

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SafeArea), findsOneWidget);
    });

    testWidgets('renders $FeedSeparator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedSeparator), findsOneWidget);
    });
  });
}
