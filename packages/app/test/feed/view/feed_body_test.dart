// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

class _MockFeedBuilder extends Mock implements FeedBuilder {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final initialState = FeedState.initial(
    type: FeedType.top,
    visitedPosts: {},
  );

  const index = 0;
  final item = Container();
  final separator = Container();
  final loadingWidget = Container();
  const hasReachedMax = false;
  const padding = EdgeInsets.zero;

  final items = [
    FeedItemModel(
      FeedItemPlaceholder(),
    ),
  ];

  group(FeedBody, () {
    late FeedBloc bloc;
    late PaginatedFeedModel feed;
    late FeedBuilder builder;
    late BuildContext context;

    setUp(() {
      bloc = _MockFeedBloc();
      feed = _MockPaginatedFeedModel();
      builder = _MockFeedBuilder();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(feed: feed),
      );
      when(() => feed.isPlaceholder).thenReturn(false);
      when(() => feed.hasReachedMax).thenReturn(false);
      when(() => feed.items).thenReturn(items);
      registerFallbackValue(context);
      registerFallbackValue(index);
      when(() => builder.itemBuilder(any(), any())).thenReturn(item);
      when(() => builder.separatorBuilder(any(), any())).thenReturn(separator);
      when(() => builder.loadingBuilder(any())).thenReturn(loadingWidget);
      when(
        () => builder.padding(hasReachedMax: hasReachedMax),
      ).thenReturn(padding);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedBody(
          builder: builder,
        ),
      );
    }

    group(InfiniteList, () {
      InfiniteList findWidget(
        WidgetTester tester,
      ) {
        return tester.widget<InfiniteList>(
          find.byType(InfiniteList),
        );
      }

      testWidgets('has correct padding', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.padding, padding);
      });

      testWidgets('has correct separatorBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.separatorBuilder?.call(context, index),
          separator,
        );
      });

      testWidgets('has correct itemBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.itemBuilder(context, index),
          item,
        );
      });

      testWidgets('has correct loadingBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.loadingBuilder?.call(context),
          loadingWidget,
        );
      });

      testWidgets('adds $FeedDataFetched onFetchData', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onFetchData();
        verify(() => bloc.add(FeedDataFetched())).called(1);
      });
    });
  });
}
