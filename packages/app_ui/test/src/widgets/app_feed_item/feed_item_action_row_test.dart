// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(FeedItemActionRow, () {
    Widget buildSubject() {
      return Provider<AppFeedItemData>.value(
        value: AppFeedItemDataPlaceholder(),
        child: FeedItemActionRow(),
      );
    }

    testWidgets('renders $FeedItemVoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemVoteButton), findsOneWidget);
    });

    testWidgets('renders $FeedItemCommentCountButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemCommentCountButton), findsOneWidget);
    });

    testWidgets('renders $FeedItemShareButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemShareButton), findsOneWidget);
    });

    testWidgets('renders $FeedItemMoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemMoreButton), findsOneWidget);
    });
  });
}
