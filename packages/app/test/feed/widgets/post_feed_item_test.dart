// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:app/feed_item_options/feed_item_options.dart'
    hide FeedItemModel;
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart'
    hide FeedItemCommentCountButton, FeedItemVoteButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart'
    hide FeedItem, PostFeedItem;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockFeedState extends Mock implements FeedState {}

class _MockPostFeedItemModel extends Mock implements PostFeedItemModel {}

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
  const score = 'score';
  const commentCount = 'commentCount';
  const hasBeenUpvoted = true;

  group(PostFeedItem, () {
    late FeedBloc bloc;
    late FeedState state;
    late PostFeedItemModel item;

    setUp(() {
      bloc = _MockFeedBloc();
      state = _MockFeedState();
      item = _MockPostFeedItemModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => bloc.state).thenReturn(state);
      when(() => state.hasBeenVisited(item)).thenReturn(hasBeenVisited);
      when(() => item.rank(any())).thenReturn(rank);
      when(() => item.urlHost).thenReturn(urlHost);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any())).thenReturn(age);
      when(() => item.title).thenReturn(title);
      when(() => item.score).thenReturn(score);
      when(() => item.commentCount).thenReturn(commentCount);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedItem(item),
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

      testWidgets('shows $FeedItemOptionsSheet onMorePressed', (tester) async {
        final repositoryItem = PostFeedItemPlaceholder();
        when(item.toRepository).thenReturn(repositoryItem);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        await tester.pump();
        expect(
          find.byType(FeedItemOptionsSheet),
          findsOneWidget,
        );
      });

      testWidgets('voteButton is $FeedItemVoteButton', (tester) async {
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

      testWidgets('commentCountButton '
          'is $FeedItemCommentCountButton', (tester) async {
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
