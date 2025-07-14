// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart'
    hide FeedItemCommentCountButton, FeedItemVoteButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart' hide FeedItem;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockFeedState extends Mock implements FeedState {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockFeedItemModel extends Mock implements FeedItemModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const hasBeenVisited = true;

  const rank = 'rank';
  const urlHost = 'urlHost';
  const user = 'user';
  const age = 'age';
  const title = 'title';

  group(FeedItem, () {
    late FeedBloc bloc;
    late FeedState state;
    late GoRouter router;
    late FeedItemModel item;

    setUp(() {
      bloc = _MockFeedBloc();
      state = _MockFeedState();
      router = _MockGoRouter();
      item = _MockFeedItemModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => bloc.state).thenReturn(state);
      when(() => state.hasBeenVisited(item)).thenReturn(hasBeenVisited);
      when(() => item.rank(any())).thenReturn(rank);
      when(() => item.urlHost).thenReturn(urlHost);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any())).thenReturn(age);
      when(() => item.title).thenReturn(title);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedItem(item: item),
      );
    }

    group(AppFeedItem, () {
      AppFeedItem findWidget(WidgetTester tester) {
        return tester.widget<AppFeedItem>(
          find.byType(AppFeedItem),
        );
      }

      testWidgets('has correct hasBeenVisited', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.hasBeenVisited, hasBeenVisited);
      });

      testWidgets('has correct rank', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.rank, rank);
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

      testWidgets('has correct age', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.age, age);
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.title, title);
      });

      testWidgets('adds $FeedItemPressed onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onPressed();
        verify(
          () => bloc.add(
            FeedItemPressed(item),
          ),
        ).called(1);
      });

      testWidgets('adds $FeedItemSharePressed onSharePressed', (tester) async {
        const text = 'shareText';
        when(() => item.shareText(any())).thenReturn(text);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onSharePressed();
        verify(
          () => bloc.add(
            FeedItemSharePressed(text: text),
          ),
        ).called(1);
      });

      testWidgets('navigates to $FeedItemOptionsRoute '
          'onMorePressed', (tester) async {
        final repositoryItem = FeedItemPlaceholder();
        when(item.toRepository).thenReturn(repositoryItem);
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        final route = FeedItemOptionsRoute(repositoryItem);
        verify(
          () => router.go(
            route.location,
            extra: route.$extra,
          ),
        ).called(1);
      });

      testWidgets('voteButton is null when score is null', (tester) async {
        when(() => item.score).thenReturn(null);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.voteButton, null);
      });

      testWidgets('voteButton is $FeedItemVoteButton '
          'when score is non-null', (tester) async {
        const score = 'score';
        when(() => item.score).thenReturn(score);
        when(() => item.hasBeenUpvoted).thenReturn(false);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.data.voteButton,
          isA<FeedItemVoteButton>().having(
            (widget) => widget.score,
            'score',
            score,
          ),
        );
      });

      testWidgets('commentCountButton is null '
          'when commentCount is null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.commentCountButton, null);
      });

      testWidgets('commentCountButton is $FeedItemCommentCountButton '
          'when commentCount is non-null', (tester) async {
        const commentCount = 'commentCount';
        when(() => item.commentCount).thenReturn(commentCount);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.data.commentCountButton,
          isA<FeedItemCommentCountButton>().having(
            (widget) => widget.commentCount,
            'commentCount',
            commentCount,
          ),
        );
      });
    });
  });
}
