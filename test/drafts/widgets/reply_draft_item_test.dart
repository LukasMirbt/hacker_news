// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockReplyDraftModel extends Mock implements ReplyDraftModel {}

void main() {
  const title = 'title';
  const subtitle = 'subtitle';

  group(ReplyDraftItem, () {
    late AppRouter router;
    late ReplyDraftModel draft;

    setUp(() {
      router = _MockAppRouter();
      draft = _MockReplyDraftModel();
      when(() => draft.title).thenReturn(title);
      when(() => draft.subtitle).thenReturn(subtitle);
    });

    Widget createSubject() {
      return Provider.value(
        value: router,
        child: ReplyDraftItem(draft),
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
        expect(widget.trailing, isA<ReplyDraftMoreButton>());
      });

      testWidgets('navigates to $ReplyRoute onTap', (tester) async {
        const url = 'url';
        when(() => draft.url).thenReturn(url);
        await tester.pumpApp(createSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(
          () => router.goRelative(
            ReplyRoute(url: url),
          ),
        ).called(1);
      });
    });
  });
}
