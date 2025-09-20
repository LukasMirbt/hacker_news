// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart' hide ThreadComment;

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockThreadFeedState extends Mock implements ThreadFeedState {}

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final itemBuilder = (_, __) => Container(height: 200);

  final visibleItems = List.filled(
    30,
    OtherUserThreadCommentModel(
      comment: OtherUserThreadCommentPlaceholder(),
    ),
  );

  group(ThreadCommentList, () {
    late ThreadFeedBloc bloc;
    late ThreadFeedState state;
    late PaginatedThreadFeedModel feed;
    late BuildContext context;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      state = _MockThreadFeedState();
      feed = _MockPaginatedThreadFeedModel();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(state);
      when(() => state.feed).thenReturn(feed);
      when(() => feed.visibleItems).thenReturn(visibleItems);
      when(() => feed.hasReachedMax).thenReturn(false);
      when(() => state.fetchStatus).thenReturn(FetchStatus.success);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadCommentList(itemBuilder),
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

      testWidgets('has correct itemCount', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.itemCount, visibleItems.length);
      });

      testWidgets('has correct hasReachedMax', (tester) async {
        const hasReachedMax = true;
        when(() => feed.hasReachedMax).thenReturn(hasReachedMax);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.hasReachedMax, hasReachedMax);
      });

      testWidgets('has correct isLoading', (tester) async {
        const fetchStatus = FetchStatus.loading;
        when(() => state.fetchStatus).thenReturn(fetchStatus);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.isLoading, true);
      });

      testWidgets('has correct itemBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.itemBuilder, itemBuilder);
      });

      testWidgets('has correct placeholderBuilder', (tester) async {
        const index = 1;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.placeholderBuilder(context, index),
          isA<ThreadPlaceholderComment>().having(
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
          isA<ThreadFeedFooter>(),
        );
      });

      testWidgets('adds $ThreadFeedDataFetched onFetchData', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onFetchData.call();
        verify(
          () => bloc.add(ThreadFeedDataFetched()),
        ).called(1);
      });
    });
  });
}
