// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart' hide FeedItemCommentCountButton;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockFeedItemModel extends Mock implements FeedItemModel {}

void main() {
  const commentCount = 'commentCount';
  const id = 'id';

  group(FeedItemCommentCountButton, () {
    late AppRouter router;
    late FeedItemModel item;

    setUp(() {
      router = _MockAppRouter();
      item = _MockFeedItemModel();
      when(() => item.commentCount).thenReturn(commentCount);
      when(() => item.id).thenReturn(id);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: FeedItemCommentCountButton(
          commentCount: commentCount,
          item: item,
        ),
      );
    }

    AppFeedItemCommentCountButton findWidget(WidgetTester tester) {
      return tester.widget<AppFeedItemCommentCountButton>(
        find.byType(AppFeedItemCommentCountButton),
      );
    }

    testWidgets('has correct commentCount', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.commentCount, commentCount);
    });

    testWidgets('navigates to $PostRoute onPressed', (tester) async {
      const id = 'id';
      when(() => item.id).thenReturn(id);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onPressed();
      verify(
        () => router.goRelative(
          PostRoute(postId: id),
        ),
      ).called(1);
    });
  });
}
