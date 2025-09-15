// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide Comment;
import 'package:super_sliver_list/super_sliver_list.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  final itemBuilder = (_, _) => Container(height: 100);

  final visibleItems = List.generate(
    10,
    (index) => OtherUserCommentModel(
      comment: OtherUserCommentPlaceholder(
        id: index.toString(),
      ),
    ),
  );

  group(CommentListContainer, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
      when(() => commentList.visibleItems).thenReturn(visibleItems);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CustomScrollView(
          slivers: [
            CommentListContainer(itemBuilder),
          ],
        ),
      );
    }

    testWidgets('renders $SelectedCommentListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(SelectedCommentListener),
        findsOneWidget,
      );
    });

    group(SuperSliverList, () {
      SuperSliverList findWidget(WidgetTester tester) {
        return tester.widget(
          find.byType(SuperSliverList),
        );
      }

      SliverChildBuilderDelegate findDelegate(WidgetTester tester) {
        final widget = findWidget(tester);
        return widget.delegate as SliverChildBuilderDelegate;
      }

      testWidgets('listController is non-null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.listController, isNotNull);
      });

      testWidgets('has correct itemCount', (tester) async {
        await tester.pumpApp(buildSubject());
        final delegate = findDelegate(tester);
        expect(delegate.childCount, visibleItems.length);
      });

      testWidgets('has correct itemBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final delegate = findDelegate(tester);
        expect(delegate.builder, itemBuilder);
      });
    });
  });
}
