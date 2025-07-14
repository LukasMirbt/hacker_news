// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

void main() {
  const commentCount = 'commentCount';

  group(FeedItemCommentCountButton, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
      when(() => data.isCommentCountVisible).thenReturn(true);
      when(() => data.onCommentPressed).thenReturn(() {});
      when(() => data.commentCount).thenReturn(commentCount);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemCommentCountButton(),
      );
    }

    testWidgets('renders $InvisiblePlaceholder with visible '
        'when isCommentCountVisible', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<InvisiblePlaceholder>(
        find.byType(InvisiblePlaceholder),
      );
      expect(widget.visible, true);
    });

    testWidgets('renders $InvisiblePlaceholder with !visible '
        'when !isCommentCountVisible', (tester) async {
      when(() => data.isCommentCountVisible).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<InvisiblePlaceholder>(
        find.byType(InvisiblePlaceholder),
      );
      expect(widget.visible, false);
    });

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets(
      'calls onCommentPressed when $TextButton is pressed',
      (tester) async {
        var count = 0;

        void onCommentPressed() {
          count += 1;
        }

        when(() => data.onCommentPressed).thenReturn(onCommentPressed);

        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(TextButton));
        expect(count, 1);
      },
    );

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Icons.mode_comment_outlined),
        findsOneWidget,
      );
    });

    testWidgets('renders commentCount', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(commentCount), findsOneWidget);
    });
  });
}
