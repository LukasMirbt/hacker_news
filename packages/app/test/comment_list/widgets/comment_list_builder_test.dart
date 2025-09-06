// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide Comment;

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  final comment = OtherUserCommentModel(
    comment: OtherUserCommentPlaceholder(),
  );

  group(CommentListBuilder, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
    });

    CommentListBuilder createSubject() => CommentListBuilder();

    Widget buildSubject(
      Widget Function(BuildContext) builder,
    ) {
      return BlocProvider.value(
        value: bloc,
        child: Builder(builder: builder),
      );
    }

    group('itemBuilder', () {
      testWidgets('renders $Comment', (tester) async {
        final visibleItems = [comment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );

        expect(find.byType(Comment), findsOneWidget);
      });

      testWidgets('does not render $CommentListFooter '
          'when !isLast', (tester) async {
        final visibleItems = [comment, comment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );

        expect(find.byType(CommentListFooter), findsNothing);
      });

      testWidgets('renders $CommentListFooter when isLast', (tester) async {
        final visibleItems = [comment, comment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 1),
          ),
        );

        expect(find.byType(CommentListFooter), findsOneWidget);
      });
    });

    group('separatorBuilder', () {
      testWidgets('renders $CommentTopLevelDivider '
          'when nextComment.isTopLevel', (tester) async {
        final firstComment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            indent: 0,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byType(CommentTopLevelDivider),
          findsOneWidget,
        );
      });

      testWidgets('returns $SizedBox.shrink when !nextComment.isTopLevel '
          'and !comment.isExpanded', (tester) async {
        final firstComment = OtherUserCommentModel(
          isExpanded: false,
          comment: OtherUserCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            indent: 1,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is SizedBox && widget.height == 0 && widget.width == 0,
          ),
          findsOneWidget,
        );
      });

      testWidgets('returns $SizedBox with correct height '
          'when !nextComment.isTopLevel '
          'and comment.isExpanded', (tester) async {
        final firstComment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            indent: 1,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => commentList.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.height == AppSpacing.sm,
          ),
          findsOneWidget,
        );
      });
    });
  });
}
