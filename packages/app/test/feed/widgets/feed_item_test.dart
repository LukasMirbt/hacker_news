import 'package:app/feed/feed.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart'
    hide FeedItem, JobFeedItem, PostFeedItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockFeedState extends Mock implements FeedState {}

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

void main() {
  group(FeedItem, () {
    late FeedBloc bloc;
    late FeedState state;
    late PaginatedFeedModel feed;

    setUp(() {
      bloc = _MockFeedBloc();
      state = _MockFeedState();
      feed = _MockPaginatedFeedModel();
      registerFallbackValue(
        PostFeedItemModel(
          PostFeedItemPlaceholder(),
        ),
      );
      when(() => bloc.state).thenReturn(state);
      when(() => state.feed).thenReturn(feed);
      when(() => state.hasBeenVisited(any())).thenReturn(false);
      when(() => feed.items).thenReturn([
        PostFeedItemModel(
          PostFeedItemPlaceholder(),
        ),
        JobFeedItemModel(
          JobFeedItemPlaceholder(),
        ),
      ]);
    });

    Widget buildSubject(int index) {
      return BlocProvider.value(
        value: bloc,
        child: FeedItem(index),
      );
    }

    testWidgets('renders $PostFeedItem when item '
        'is $PostFeedItemModel', (tester) async {
      await tester.pumpApp(buildSubject(0));
      expect(find.byType(PostFeedItem), findsOneWidget);
    });

    testWidgets('renders $JobFeedItem when item '
        'is $JobFeedItemModel', (tester) async {
      await tester.pumpApp(buildSubject(1));
      expect(find.byType(JobFeedItem), findsOneWidget);
    });

    testWidgets('does not render $PostFeedItem '
        'or $JobFeedItem when item is null', (tester) async {
      await tester.pumpApp(buildSubject(2));
      expect(find.byType(PostFeedItem), findsNothing);
      expect(find.byType(JobFeedItem), findsNothing);
    });
  });
}
