// ignore_for_file: prefer_const_constructors

import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThreadFeedFooter, () {
    Widget buildSubject() => ThreadFeedFooter();

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}
