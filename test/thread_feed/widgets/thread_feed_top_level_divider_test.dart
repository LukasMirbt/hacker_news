// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThreadFeedItemModel extends Mock implements ThreadFeedItemModel {}

void main() {
  group(ThreadFeedTopLevelDivider, () {
    late ThreadFeedItemModel item;

    setUp(() {
      item = _MockThreadFeedItemModel();
      when(() => item.isExpanded).thenReturn(true);
    });

    Widget buildSubject() => ThreadFeedTopLevelDivider(item);

    Padding findPadding(WidgetTester tester) {
      return tester.widget<Padding>(
        find.ancestor(
          of: find.byType(Divider),
          matching: find.byType(Padding),
        ),
      );
    }

    testWidgets('renders $Divider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('has correct padding when item.isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      final padding = findPadding(tester);
      expect(
        padding.padding,
        EdgeInsets.only(
          top: AppSpacing.lg,
          bottom: AppSpacing.xs,
        ),
      );
    });

    testWidgets('has correct padding when !item.isExpanded', (tester) async {
      when(() => item.isExpanded).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final padding = findPadding(tester);
      expect(
        padding.padding,
        EdgeInsets.only(
          top: AppSpacing.xs,
          bottom: AppSpacing.xs,
        ),
      );
    });
  });
}
