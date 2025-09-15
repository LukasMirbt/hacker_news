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

void main() {
  group(ThreadComment, () {
    late ThreadFeedBloc bloc;
    late ThreadFeedState state;
    late PaginatedThreadFeedModel feed;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      state = _MockThreadFeedState();
      feed = _MockPaginatedThreadFeedModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.feed).thenReturn(feed);
      when(() => feed.visibleItems).thenReturn([
        CurrentUserThreadCommentModel(
          comment: CurrentUserThreadCommentPlaceholder(),
        ),
        OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(),
        ),
      ]);
    });

    Widget buildSubject(int index) {
      return BlocProvider.value(
        value: bloc,
        child: ThreadComment(index),
      );
    }

    testWidgets('renders $CurrentUserThreadComment when item '
        'is $CurrentUserThreadCommentModel', (tester) async {
      await tester.pumpApp(buildSubject(0));
      expect(find.byType(CurrentUserThreadComment), findsOneWidget);
    });

    testWidgets('renders $OtherUserThreadComment when item '
        'is $OtherUserThreadCommentModel', (tester) async {
      await tester.pumpApp(buildSubject(1));
      expect(find.byType(OtherUserThreadComment), findsOneWidget);
    });

    testWidgets('does not render $CurrentUserThreadComment '
        'or $OtherUserThreadComment when item is null', (tester) async {
      await tester.pumpApp(buildSubject(2));
      expect(find.byType(CurrentUserThreadComment), findsNothing);
      expect(find.byType(OtherUserThreadComment), findsNothing);
    });
  });
}
