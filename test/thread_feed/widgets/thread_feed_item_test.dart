// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockThreadFeedItemModel extends Mock implements ThreadFeedItemModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const id = 'id';
  const isExpanded = true;
  const indent = 1;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const hasBeenUpvoted = true;

  group(ThreadFeedItem, () {
    late ThreadFeedBloc bloc;
    late GoRouter router;
    late ThreadFeedItemModel item;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      router = _MockGoRouter();
      item = _MockThreadFeedItemModel();
      when(() => item.id).thenReturn(id);
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.indent).thenReturn(indent);
      when(() => item.user).thenReturn(user);
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadFeedItem(item: item),
      );
    }

    AppThreadFeedItem findWidget(WidgetTester tester) {
      return tester.widget<AppThreadFeedItem>(
        find.byType(AppThreadFeedItem),
      );
    }

    testWidgets('has correct isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.isExpanded, isExpanded);
    });

    testWidgets('has correct indent', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.indent, indent);
    });

    testWidgets('has correct user', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.user, user);
    });

    testWidgets('has correct age', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.age, age);
    });

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
    });

    testWidgets('has correct htmlText', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.htmlText, htmlText);
    });

    testWidgets('adds $ThreadFeedItemExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => bloc.add(
          ThreadFeedItemExpansionToggled(item),
        ),
      );
    });

    /*     testWidgets(
      'navigates to $CommentOptionsRoute onMorePressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        final route = CommentOptionsRoute(
          postId: postId,
          commentId: id,
        );
        verify(
          () => router.go(route.location),
        ).called(1);
      },
    ); */

    testWidgets(
      'does nothing onMorePressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        final widget = findWidget(tester);
        expect(
          widget.data.onMorePressed,
          returnsNormally,
        );
      },
    );

    testWidgets(
      'adds $ThreadFeedItemLinkPressed onLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onLinkPressed(url);
        verify(
          () => bloc.add(
            ThreadFeedItemLinkPressed(url),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'adds $ThreadFeedItemVotePressed onVotePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => bloc.add(
            ThreadFeedItemVotePressed(item),
          ),
        ).called(1);
      },
    );
  });
}
