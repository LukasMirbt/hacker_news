// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart' hide FeedItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final initialState = FeedState.initial(
    type: FeedType.top,
    visitedPosts: {},
  );

  final items = List.filled(
    30,
    PostFeedItemModel(
      PostFeedItemPlaceholder(),
    ),
  );

  group(FeedBody, () {
    late FeedBloc bloc;
    late PaginatedFeedModel feed;
    late BuildContext context;

    setUp(() {
      bloc = _MockFeedBloc();
      feed = _MockPaginatedFeedModel();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          feed: feed,
          fetchStatus: FetchStatus.success,
        ),
      );
      when(() => feed.isPlaceholder).thenReturn(false);
      when(() => feed.hasReachedMax).thenReturn(false);
      when(() => feed.items).thenReturn(items);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedBody(),
      );
    }

    group(AppPaginatedList, () {
      AppPaginatedList findWidget(
        WidgetTester tester,
      ) {
        return tester.widget<AppPaginatedList>(
          find.byType(AppPaginatedList),
        );
      }

      testWidgets('has correct hasReachedMax', (tester) async {
        const hasReachedMax = true;
        when(() => feed.hasReachedMax).thenReturn(hasReachedMax);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.hasReachedMax, hasReachedMax);
      });

      testWidgets('has correct isLoading', (tester) async {
        when(() => bloc.state).thenReturn(
          initialState.copyWith(
            fetchStatus: FetchStatus.loading,
          ),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.isLoading, true);
      });

      testWidgets('has correct itemCount', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.itemCount, items.length);
      });

      testWidgets('has correct itemBuilder', (tester) async {
        const index = 1;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.itemBuilder(context, index),
          isA<FeedItem>().having(
            (item) => item.index,
            'index',
            index,
          ),
        );
      });

      testWidgets('has correct separatorBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.separatorBuilder?.call(context, 1),
          isA<FeedSeparator>(),
        );
      });

      testWidgets('has correct placeholderBuilder', (tester) async {
        const index = 1;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.placeholderBuilder(context, index),
          isA<FeedPlaceholderItem>().having(
            (item) => item.index,
            'index',
            index,
          ),
        );
      });

      testWidgets('has correct footerBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.footerBuilder(context),
          isA<FeedFooter>(),
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
