// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockThreadFeedBuilder extends Mock implements ThreadFeedBuilder {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final initialState = ThreadFeedState.initial();

  const index = 0;
  final item = Container();
  final separator = Container();
  final loadingWidget = Container();
  const hasReachedMax = false;
  const padding = EdgeInsets.zero;

  final visibleItems = [
    OtherUserThreadCommentModel(
      comment: OtherUserThreadCommentPlaceholder(),
    ),
  ];

  group(ThreadFeedBody, () {
    late ThreadFeedBloc bloc;
    late PaginatedThreadFeedModel feed;
    late ThreadFeedBuilder builder;
    late BuildContext context;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      feed = _MockPaginatedThreadFeedModel();
      builder = _MockThreadFeedBuilder();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(feed: feed),
      );
      when(() => feed.isPlaceholder).thenReturn(false);
      when(() => feed.hasReachedMax).thenReturn(false);
      when(() => feed.visibleItems).thenReturn(visibleItems);
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
        child: ThreadFeedBody(
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

      testWidgets('adds $ThreadFeedDataFetched onFetchData', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onFetchData();
        verify(() => bloc.add(ThreadFeedDataFetched())).called(1);
      });
    });
  });
}
