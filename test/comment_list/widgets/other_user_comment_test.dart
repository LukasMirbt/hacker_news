// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide OtherUserComment;

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockOtherUserCommentModel extends Mock
    implements OtherUserCommentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const hasBeenUpvoted = true;

  group(OtherUserComment, () {
    late CommentListBloc commentListBloc;
    late PostHeaderBloc postHeaderBloc;
    late OtherUserCommentModel item;

    setUp(() {
      commentListBloc = _MockCommentListBloc();
      postHeaderBloc = _MockPostHeaderBloc();
      item = _MockOtherUserCommentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
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
          child: OtherUserComment(item),
        ),
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

    testWidgets('adds $CommentListExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => commentListBloc.add(
          CommentListExpansionToggled(item),
        ),
      );
    });

    testWidgets(
      'shows $CommentOptionsSheet onMorePressed',
      (tester) async {
        when(item.toRepository).thenReturn(
          OtherUserCommentPlaceholder(),
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

    testWidgets(
      'adds $CommentListVotePressed onVotePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => commentListBloc.add(
            CommentListVotePressed(item),
          ),
        ).called(1);
      },
    );
  });
}
