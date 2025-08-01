// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

import '../pump_thread_feed.dart';

void main() {
  group(ThreadFeedPage, () {
    Widget buildSubject() => ThreadFeedPage();

    testWidgets('renders $ThreadFeedView', (tester) async {
      await tester.pumpThreadFeed(buildSubject());
      expect(find.byType(ThreadFeedView), findsOneWidget);
    });
  });
}
