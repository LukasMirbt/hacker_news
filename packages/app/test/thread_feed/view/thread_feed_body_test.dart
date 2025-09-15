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

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final initialState = ThreadFeedState.initial();

  final visibleItems = [
    OtherUserThreadCommentModel(
      comment: OtherUserThreadCommentPlaceholder(),
    ),
  ];

  group(ThreadFeedBody, () {
    late ThreadFeedBloc bloc;
    late PaginatedThreadFeedModel feed;
    late BuildContext context;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      feed = _MockPaginatedThreadFeedModel();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(feed: feed),
      );
      when(() => feed.hasReachedMax).thenReturn(false);
      when(() => feed.visibleItems).thenReturn(visibleItems);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadFeedBody(),
      );
    }

    group(AppCommentList, () {
      AppCommentList findWidget(
        WidgetTester tester,
      ) {
        return tester.widget<AppCommentList>(
          find.byType(AppCommentList),
        );
      }

      testWidgets('has correct items', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.items, visibleItems);
      });

      testWidgets('has correct containerBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final itemBuilder = (_, _) => Container();
        expect(
          widget.data.containerBuilder(context, itemBuilder),
          isA<ThreadCommentList>().having(
            (widget) => widget.itemBuilder,
            'itemBuilder',
            itemBuilder,
          ),
        );
      });

      testWidgets('has correct commentBuilder', (tester) async {
        const index = 1;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.data.commentBuilder(context, index),
          isA<ThreadComment>().having(
            (widget) => widget.index,
            'index',
            index,
          ),
        );
      });
    });
  });
}
