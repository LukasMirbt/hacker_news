// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/comment_options/comment_options.dart'
    hide CommentModel;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockCommentModel extends Mock implements CommentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const id = 'id';
  const isExpanded = true;
  const indent = 1;
  const user = 'user';
  const age = 'age';
  const hasBeenUpvoted = true;
  const htmlText = 'htmlText';

  const postId = 'postId';

  group(CommentWidget, () {
    late CommentListBloc commentListBloc;
    late PostHeaderBloc postHeaderBloc;
    late CommentModel item;

    setUp(() {
      commentListBloc = _MockCommentListBloc();
      postHeaderBloc = _MockPostHeaderBloc();
      item = _MockCommentModel();
      when(() => item.id).thenReturn(id);
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.indent).thenReturn(indent);
      when(() => item.user).thenReturn(user);
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
      when(() => postHeaderBloc.state).thenReturn(
        PostHeaderState.initial(
          id: postId,
          visitedPosts: {},
        ),
      );
    });

    Widget buildSubject([CommentModel? commentModel]) {
      return BlocProvider.value(
        value: commentListBloc,
        child: BlocProvider.value(
          value: postHeaderBloc,
          child: CommentWidget(commentModel ?? item),
        ),
      );
    }

    AppComment findWidget(WidgetTester tester) {
      return tester.widget<AppComment>(
        find.byType(AppComment),
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
        await tester.pumpApp(
          buildSubject(
            CommentModel(
              comment: CommentPlaceholder(),
            ),
          ),
        );
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
