// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app/comment_options/comment_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide CurrentUserComment;

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockCurrentUserCommentModel extends Mock
    implements CurrentUserCommentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const score = 'score';

  group(CurrentUserComment, () {
    late CommentListBloc commentListBloc;
    late PostHeaderBloc postHeaderBloc;
    late CurrentUserCommentModel item;

    setUp(() {
      commentListBloc = _MockCommentListBloc();
      postHeaderBloc = _MockPostHeaderBloc();
      item = _MockCurrentUserCommentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.score(any())).thenReturn(score);
      when(() => postHeaderBloc.state).thenReturn(
        PostHeaderState.initial(
          id: 'id',
          visitedPosts: {},
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: commentListBloc,
        child: BlocProvider.value(
          value: postHeaderBloc,
          child: CurrentUserComment(item),
        ),
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

    testWidgets('adds $CommentListExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => commentListBloc.add(
          CommentListExpansionToggled(item),
        ),
      ).called(1);
    });

    testWidgets(
      'shows $CommentOptionsSheet onMorePressed',
      (tester) async {
        when(item.toRepository).thenReturn(
          CurrentUserCommentPlaceholder(),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        await tester.pump();
        expect(
          find.byType(CommentOptionsSheet),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'adds $CommentListLinkPressed onLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onLinkPressed(url);
        verify(
          () => commentListBloc.add(
            CommentListLinkPressed(url),
          ),
        ).called(1);
      },
    );
  });
}
