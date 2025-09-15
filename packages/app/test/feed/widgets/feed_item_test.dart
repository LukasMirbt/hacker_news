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

class _MockItems extends Mock implements List<FeedItemModel> {}

void main() {
  const index = 1;

  group(FeedItem, () {
    late FeedBloc bloc;
    late FeedState state;
    late PaginatedFeedModel feed;
    late List<FeedItemModel> items;

    setUp(() {
      bloc = _MockFeedBloc();
      state = _MockFeedState();
      feed = _MockPaginatedFeedModel();
      items = _MockItems();
      registerFallbackValue(
        PostFeedItemModel(
          PostFeedItemPlaceholder(),
        ),
      );
      when(() => bloc.state).thenReturn(state);
      when(() => state.feed).thenReturn(feed);
      when(() => feed.items).thenReturn(items);
      when(() => state.hasBeenVisited(any())).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: const FeedItem(index),
      );
    }

    testWidgets('renders $PostFeedItem when item '
        'is $PostFeedItemModel', (tester) async {
      when(() => items[index]).thenReturn(
        PostFeedItemModel(
          PostFeedItemPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostFeedItem), findsOneWidget);
    });

    testWidgets('renders $JobFeedItem when item '
        'is $JobFeedItemModel', (tester) async {
      when(() => items[index]).thenReturn(
        JobFeedItemModel(
          JobFeedItemPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(JobFeedItem), findsOneWidget);
    });
  });
}
