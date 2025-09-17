// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  group(CommentListView, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
      when(() => commentList.isPlaceholder).thenReturn(false);
      when(() => commentList.isEmpty).thenReturn(false);
      when(() => commentList.visibleItems).thenReturn([]);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CustomScrollView(
          slivers: [
            CommentListView(),
          ],
        ),
      );
    }

    testWidgets('renders $CommentListEmptyBody '
        'when isEmpty', (tester) async {
      when(() => commentList.isEmpty).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListEmptyBody), findsOneWidget);
    });

    testWidgets('renders skeletonized $CommentListBody '
        'when !isEmpty and isPlaceholder ', (tester) async {
      when(() => commentList.isPlaceholder).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(
            CommentListBody,
            skipOffstage: false,
          ),
          matching: find.byType(
            SkeletonizerScope,
            skipOffstage: false,
          ),
        ),
      );
      expect(skeletonizerScope.enabled, true);
    });

    testWidgets('renders non-skeletonized $CommentListBody '
        'when !isEmpty and !isPlaceholder', (tester) async {
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(
            CommentListBody,
            skipOffstage: false,
          ),
          matching: find.byType(
            SkeletonizerScope,
            skipOffstage: false,
          ),
        ),
      );
      expect(skeletonizerScope.enabled, false);
    });
  });
}
