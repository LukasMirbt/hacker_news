// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide Comment;

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final visibleItems = List.generate(
    10,
    (index) => OtherUserCommentModel(
      comment: OtherUserCommentPlaceholder(
        id: index.toString(),
      ),
    ),
  );

  group(CommentListBody, () {
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
            CommentListBody(),
          ],
        ),
      );
    }

    group(AppCommentList, () {
      AppCommentList findWidget(WidgetTester tester) {
        return tester.widget(
          find.byType(AppCommentList),
        );
      }

      testWidgets('has correct selectedIndex', (tester) async {
        const selectedIndex = 1;
        when(() => commentList.selectedIndex).thenReturn(selectedIndex);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.selectedIndex, selectedIndex);
      });

      testWidgets('has correct items', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.data.items, visibleItems);
      });

      testWidgets('has correct containerBuilder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final context = _MockBuildContext();
        final itemBuilder = (_, _) => Container();
        final comment = widget.data.containerBuilder(context, itemBuilder);
        expect(
          comment,
          isA<CommentListContainer>().having(
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
        final context = _MockBuildContext();
        final comment = widget.data.commentBuilder(context, index);
        expect(
          comment,
          isA<Comment>().having(
            (widget) => widget.index,
            'item',
            index,
          ),
        );
      });
    });
  });
}
