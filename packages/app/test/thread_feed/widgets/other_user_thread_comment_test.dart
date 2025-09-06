// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart'
    hide OtherUserThreadCommentModel;
import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart'
    hide OtherUserThreadComment;

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockOtherUserThreadCommentModel extends Mock
    implements OtherUserThreadCommentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const hasBeenUpvoted = true;

  group(OtherUserThreadComment, () {
    late ThreadFeedBloc bloc;
    late OtherUserThreadCommentModel item;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      item = _MockOtherUserThreadCommentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: OtherUserThreadComment(item),
      );
    }

    AppOtherUserComment findWidget(WidgetTester tester) {
      return tester.widget<AppOtherUserComment>(
        find.byType(AppOtherUserComment),
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

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
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
        OtherUserThreadCommentPlaceholder(),
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

    testWidgets(
      'adds $ThreadFeedVotePressed onVotePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => bloc.add(
            ThreadFeedVotePressed(item),
          ),
        ).called(1);
      },
    );
  });
}
