// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart'
    hide CurrentUserThreadCommentModel;
import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart'
    hide CurrentUserThreadComment;

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockCurrentUserThreadCommentModel extends Mock
    implements CurrentUserThreadCommentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const score = 'score';

  group(CurrentUserThreadComment, () {
    late ThreadFeedBloc bloc;
    late CurrentUserThreadCommentModel item;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      item = _MockCurrentUserThreadCommentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.score(any())).thenReturn(score);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CurrentUserThreadComment(item),
      );
    }

    AppCurrentUserComment findWidget(WidgetTester tester) {
      return tester.widget<AppCurrentUserComment>(
        find.byType(AppCurrentUserComment),
      );
    }

    testWidgets('has correct isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.isExpanded, isExpanded);
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

    testWidgets('has correct htmlText', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.htmlText, htmlText);
    });

    testWidgets('has correct score', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.score, score);
    });

    testWidgets('adds $ThreadFeedExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => bloc.add(
          ThreadFeedExpansionToggled(item),
        ),
      ).called(1);
    });

    testWidgets('navigates to $ThreadCommentOptionsSheet '
        'onMorePressed', (tester) async {
      when(item.toRepository).thenReturn(
        CurrentUserThreadCommentPlaceholder(),
      );
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onMorePressed();
      await tester.pump();
      expect(
        find.byType(ThreadCommentOptionsSheet),
        findsOneWidget,
      );
    });

    testWidgets(
      'adds $ThreadFeedLinkPressed onLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onLinkPressed(url);
        verify(
          () => bloc.add(
            ThreadFeedLinkPressed(url),
          ),
        ).called(1);
      },
    );
  });
}
