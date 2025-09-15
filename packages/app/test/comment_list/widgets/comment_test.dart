import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart'
    hide Comment, CurrentUserComment, OtherUserComment;

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  group(Comment, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
      when(() => commentList.visibleItems).thenReturn([
        CurrentUserCommentModel(
          comment: CurrentUserCommentPlaceholder(),
        ),
        OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(),
        ),
      ]);
    });

    Widget buildSubject(int index) {
      return BlocProvider.value(
        value: bloc,
        child: Comment(index),
      );
    }

    testWidgets('renders $CurrentUserComment when item '
        'is $CurrentUserCommentModel', (tester) async {
      await tester.pumpApp(buildSubject(0));
      expect(find.byType(CurrentUserComment), findsOneWidget);
    });

    testWidgets('renders $OtherUserComment when item '
        'is $OtherUserCommentModel', (tester) async {
      await tester.pumpApp(buildSubject(1));
      expect(find.byType(OtherUserComment), findsOneWidget);
    });

    testWidgets('does not render $CurrentUserComment '
        'or $OtherUserComment when item is null', (tester) async {
      await tester.pumpApp(buildSubject(2));
      expect(find.byType(CurrentUserComment), findsNothing);
      expect(find.byType(OtherUserComment), findsNothing);
    });
  });
}
