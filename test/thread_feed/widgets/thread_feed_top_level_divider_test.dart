// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockOtherUserThreadCommentModel extends Mock
    implements OtherUserThreadCommentModel {}

void main() {
  group(ThreadFeedTopLevelDivider, () {
    late ThreadCommentModel comment;

    setUp(() {
      comment = _MockOtherUserThreadCommentModel();
      when(() => comment.isExpanded).thenReturn(true);
    });

    Widget buildSubject() => ThreadFeedTopLevelDivider(comment);

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
      when(() => comment.isExpanded).thenReturn(false);
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
