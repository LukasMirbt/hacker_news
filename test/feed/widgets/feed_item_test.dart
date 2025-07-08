// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
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

class _MockGoRouter extends Mock implements GoRouter {}

class _MockFeedItemModel extends Mock implements FeedItemModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const rank = 'rank';
  const urlHost = 'urlHost';
  const user = 'user';
  const age = 'age';
  const title = 'title';
  const hasBeenUpvoted = true;
  const score = 'score';
  const commentCount = 'commentCount';

  group(FeedItem, () {
    late FeedBloc bloc;
    late GoRouter router;
    late FeedItemModel item;

    setUp(() {
      bloc = _MockFeedBloc();
      router = _MockGoRouter();
      item = _MockFeedItemModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.rank(any())).thenReturn(rank);
      when(() => item.urlHost).thenReturn(urlHost);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any())).thenReturn(age);
      when(() => item.title).thenReturn(title);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
      when(() => item.score).thenReturn(score);
      when(() => item.commentCount).thenReturn(commentCount);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedItem(item: item),
      );
    }

    group(AppListItem, () {
      AppListItem findWidget(WidgetTester tester) {
        return tester.widget<AppListItem>(
          find.byType(AppListItem),
        );
      }

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

      testWidgets('has correct hasBeenUpvoted', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
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

      testWidgets('adds $FeedItemVotePressed onVotePressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => bloc.add(
            FeedItemVotePressed(item),
          ),
        ).called(1);
      });

      testWidgets('navigates to $PostRoute onCommentPressed', (tester) async {
        const id = 'id';
        when(() => item.id).thenReturn(id);
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        final widget = findWidget(tester);
        widget.data.onCommentPressed();
        const route = PostRoute(postId: id);
        verify(() => router.go(route.location)).called(1);
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
    });
  });
}
