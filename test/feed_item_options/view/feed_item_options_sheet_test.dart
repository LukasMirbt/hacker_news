// ignore_for_file: prefer_const_constructors

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

import '../../app/pump_app.dart';

void main() {
  group(FeedItemOptionsSheet, () {
    Widget buildSubject() {
      return FeedItemOptionsSheet(
        item: FeedItemPlaceholder(),
      );
    }

    testWidgets('renders $FeedItemOptionsView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemOptionsView), findsOneWidget);
    });
  });
}
