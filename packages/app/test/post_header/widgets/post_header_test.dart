// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app/post_options/post_options.dart';
import 'package:app_ui/app_ui.dart'
    hide PostHeaderCommentButton, PostHeaderVoteButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../post/pump_post.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  const id = 'id';
  const hasBeenVisited = true;
  const title = 'title';
  const age = 'age';
  const urlHost = 'urlHost';
  const user = 'user';
  const htmlText = 'htmlText';
  const shareText = 'shareText';

  group(PostHeader, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late PostHeaderModel header;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      header = _MockPostHeaderModel();
      registerFallbackValue(_MockDateFormatterLocalizations());
      registerFallbackValue(_MockAppLocalizations());
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
      when(() => state.id).thenReturn(id);
      when(() => state.hasBeenVisited).thenReturn(hasBeenVisited);
      when(() => header.title).thenReturn(title);
      when(() => header.age(any())).thenReturn(age);
      when(() => header.urlHost).thenReturn(urlHost);
      when(() => header.user).thenReturn(user);
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

    testWidgets('has correct hasBeenVisited', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenVisited, hasBeenVisited);
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

    testWidgets('has correct htmlText', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.htmlText, htmlText);
    });

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

    testWidgets('shows $PostOptionsSheet onMorePressed', (tester) async {
      await tester.pumpPost(buildSubject());
      final widget = findWidget(tester);
      widget.data.onMorePressed();
      await tester.pump();
      expect(
        find.byType(PostOptionsSheet),
        findsOneWidget,
      );
    });

    testWidgets('voteButton is null when score is null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.voteButton, null);
    });

    testWidgets('voteButton is $PostHeaderVoteButton '
        'when score is non-null', (tester) async {
      const score = 'score';
      when(() => header.score).thenReturn(score);
      when(() => header.hasBeenUpvoted).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.data.voteButton,
        isA<PostHeaderVoteButton>().having(
          (widget) => widget.score,
          'score',
          score,
        ),
      );
    });

    testWidgets('commentButton is null '
        'when commentCount is null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.commentButton, null);
    });

    testWidgets('commentButton is $PostHeaderCommentButton '
        'when commentCount is non-null', (tester) async {
      const commentCount = 'commentCount';
      when(() => header.commentCount).thenReturn(commentCount);
      when(() => header.isCommentingEnabled).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.data.commentButton,
        isA<PostHeaderCommentButton>().having(
          (widget) => widget.commentCount,
          'commentCount',
          commentCount,
        ),
      );
    });
  });
}
