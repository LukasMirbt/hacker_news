// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  const id = 'id';
  const visited = true;
  const title = 'title';
  const age = 'age';
  const urlHost = 'urlHost';
  const user = 'user';
  const score = 'score';
  const commentCount = 'commentCount';
  const hasBeenUpvoted = true;
  const htmlText = 'htmlText';
  const shareText = 'shareText';

  group(PostHeader, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late PostHeaderModel header;
    late GoRouter router;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      header = _MockPostHeaderModel();
      router = _MockGoRouter();
      registerFallbackValue(_MockDateFormatterLocalizations());
      registerFallbackValue(_MockAppLocalizations());
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
      when(() => state.id).thenReturn(id);
      when(() => state.visited).thenReturn(visited);
      when(() => header.title).thenReturn(title);
      when(() => header.age(any())).thenReturn(age);
      when(() => header.urlHost).thenReturn(urlHost);
      when(() => header.user).thenReturn(user);
      when(() => header.score).thenReturn(score);
      when(() => header.commentCount).thenReturn(commentCount);
      when(() => header.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
      when(() => header.htmlText).thenReturn(htmlText);
      when(() => header.shareText(any())).thenReturn(shareText);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostHeader(),
      );
    }

    AppPostHeader findWidget(WidgetTester tester) {
      return tester.widget<AppPostHeader>(
        find.byType(AppPostHeader),
      );
    }

    testWidgets('has correct visited', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.visited, visited);
    });

    testWidgets('has correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.title, title);
    });

    testWidgets('has correct age', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.age, age);
    });

    testWidgets('has correct urlHost', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.urlHost, urlHost);
    });

    testWidgets('has correct user', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.user, user);
    });

    testWidgets('has correct score', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.score, score);
    });

    testWidgets('has correct commentCount', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.commentCount, commentCount);
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

    testWidgets(
      'adds $PostHeaderTextLinkPressed onTextLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onTextLinkPressed(url);
        verify(
          () => bloc.add(
            PostHeaderTextLinkPressed(url),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'adds $PostHeaderPressed onPressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onPressed();
        verify(
          () => bloc.add(PostHeaderPressed()),
        ).called(1);
      },
    );

    testWidgets(
      'adds $PostHeaderVotePressed onVotePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => bloc.add(PostHeaderVotePressed()),
        ).called(1);
      },
    );

    testWidgets(
      'navigates to $CommentFormRoute onCommentPressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        final widget = findWidget(tester);
        widget.data.onCommentPressed();
        final route = CommentFormRoute(postId: id);
        verify(
          () => router.go(route.location),
        ).called(1);
      },
    );

    testWidgets(
      'adds $PostHeaderSharePressed onSharePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onSharePressed();
        verify(
          () => bloc.add(
            PostHeaderSharePressed(text: shareText),
          ),
        ).called(1);
      },
    );
  });
}
