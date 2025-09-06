// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/comment/comment.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockCommentDraftModel extends Mock implements CommentDraftModel {}

void main() {
  const title = 'title';
  const subtitle = 'subtitle';

  group(CommentDraftItem, () {
    late AppRouter router;
    late CommentDraftModel draft;

    setUp(() {
      router = _MockAppRouter();
      draft = _MockCommentDraftModel();
      when(() => draft.title).thenReturn(title);
      when(() => draft.subtitle).thenReturn(subtitle);
    });

    Widget createSubject() {
      return Provider.value(
        value: router,
        child: CommentDraftItem(draft),
      );
    }

    ListTile findWidget(WidgetTester tester) {
      return tester.widget<ListTile>(
        find.byType(ListTile),
      );
    }

    TypeMatcher<Text> matchesSingleLineText(String text) {
      return isA<Text>()
          .having(
            (text) => text.data,
            'data',
            text,
          )
          .having(
            (text) => text.maxLines,
            'maxLines',
            1,
          )
          .having(
            (text) => text.overflow,
            'overflow',
            TextOverflow.ellipsis,
          );
    }

    group(ListTile, () {
      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(createSubject());
        final widget = findWidget(tester);
        expect(widget.title, matchesSingleLineText(title));
      });

      testWidgets('has correct subtitle', (tester) async {
        await tester.pumpApp(createSubject());
        final widget = findWidget(tester);
        expect(widget.subtitle, matchesSingleLineText(subtitle));
      });

      testWidgets('has correct trailing', (tester) async {
        await tester.pumpApp(createSubject());
        final widget = findWidget(tester);
        expect(widget.trailing, isA<CommentDraftMoreButton>());
      });

      testWidgets('navigates to $PostRoute '
          'and $CommentRoute onTap', (tester) async {
        const postId = 'postId';
        when(() => draft.postId).thenReturn(postId);
        await tester.pumpApp(createSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(
          () => router.goRelative(
            PostRoute(postId: postId),
          ),
        ).called(1);
        verify(
          () => router.goRelative(
            CommentRoute(),
          ),
        ).called(1);
      });
    });
  });
}
