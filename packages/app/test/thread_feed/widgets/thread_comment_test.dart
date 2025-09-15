// ignore_for_file: prefer_const_constructors

import 'package:app/thread_feed/thread_feed.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart'
    hide CurrentUserThreadComment, OtherUserThreadComment, ThreadComment;

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockThreadFeedState extends Mock implements ThreadFeedState {}

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

class _MockVisibleItem extends Mock implements List<ThreadCommentModel> {}

void main() {
  const index = 1;

  group(ThreadComment, () {
    late ThreadFeedBloc bloc;
    late ThreadFeedState state;
    late PaginatedThreadFeedModel feed;
    late List<ThreadCommentModel> visibleItems;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      state = _MockThreadFeedState();
      feed = _MockPaginatedThreadFeedModel();
      visibleItems = _MockVisibleItem();
      when(() => bloc.state).thenReturn(state);
      when(() => state.feed).thenReturn(feed);
      when(() => feed.visibleItems).thenReturn(visibleItems);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadComment(index),
      );
    }

    testWidgets('renders $CurrentUserThreadComment when item '
        'is $CurrentUserThreadCommentModel', (tester) async {
      when(() => visibleItems[index]).thenReturn(
        CurrentUserThreadCommentModel(
          comment: CurrentUserThreadCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(CurrentUserThreadComment), findsOneWidget);
    });

    testWidgets('renders $OtherUserThreadComment when item '
        'is $OtherUserThreadCommentModel', (tester) async {
      when(() => visibleItems[index]).thenReturn(
        OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(OtherUserThreadComment), findsOneWidget);
    });
  });
}
