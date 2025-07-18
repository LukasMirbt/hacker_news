// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(ThreadFeedItemHeaderRow, () {
    Widget buildSubject({AppThreadFeedItemData? data}) {
      return Provider.value(
        value: data ?? AppThreadFeedItemDataPlaceholder(),
        child: ThreadFeedItemHeaderRow(),
      );
    }

    testWidgets('calls onHeaderPressed when $InkWell '
        'is tapped', (tester) async {
      var count = 0;

      void onHeaderPressed() {
        count += 1;
      }

      await tester.pumpApp(
        buildSubject(
          data: AppThreadFeedItemDataPlaceholder(
            onHeaderPressed: onHeaderPressed,
          ),
        ),
      );
      await tester.tap(
        find.byType(InkWell).first,
      );
      expect(count, 1);
    });

    testWidgets('renders $ThreadFeedItemVoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedItemVoteButton), findsOneWidget);
    });

    testWidgets('renders $ThreadFeedItemUserAndAge', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedItemUserAndAge), findsOneWidget);
    });

    testWidgets('renders $ThreadFeedItemMoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedItemMoreButton), findsOneWidget);
    });
  });
}
