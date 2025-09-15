// ignore_for_file: prefer_const_constructors

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

class _MockVisibleItems extends Mock implements List<CommentModel> {}

void main() {
  const index = 1;

  group(Comment, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;
    late List<CommentModel> visibleItems;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      visibleItems = _MockVisibleItems();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
      when(() => commentList.visibleItems).thenReturn(visibleItems);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: Comment(index),
      );
    }

    testWidgets('renders $CurrentUserComment when item '
        'is $CurrentUserCommentModel', (tester) async {
      when(() => visibleItems[index]).thenReturn(
        CurrentUserCommentModel(
          comment: CurrentUserCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(CurrentUserComment), findsOneWidget);
    });

    testWidgets('renders $OtherUserComment when item '
        'is $OtherUserCommentModel', (tester) async {
      when(() => visibleItems[index]).thenReturn(
        OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(OtherUserComment), findsOneWidget);
    });
  });
}
