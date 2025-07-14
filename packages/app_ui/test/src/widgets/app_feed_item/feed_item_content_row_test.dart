// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(FeedItemContentRow, () {
    Widget buildSubject({AppFeedItemData? data}) {
      return Provider.value(
        value: data ?? AppFeedItemDataPlaceholder(),
        child: FeedItemContentRow(),
      );
    }

    testWidgets('renders rank', (tester) async {
      const rank = 'rank';
      await tester.pumpApp(
        buildSubject(
          data: AppFeedItemDataPlaceholder(rank: rank),
        ),
      );
      expect(find.text(rank), findsOneWidget);
    });

    testWidgets('calls onPressed when $InkWell is tapped', (tester) async {
      var count = 0;

      void onPressed() {
        count += 1;
      }

      await tester.pumpApp(
        buildSubject(
          data: AppFeedItemDataPlaceholder(
            onPressed: onPressed,
          ),
        ),
      );
      await tester.tap(find.byType(InkWell));
      expect(count, 1);
    });

    testWidgets('renders $FeedItemTitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemTitle), findsOneWidget);
    });

    testWidgets('renders $FeedItemSubtitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemSubtitle), findsOneWidget);
    });
  });
}
