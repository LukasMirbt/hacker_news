// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  const index = 1;

  group(CommentListDivider, () {
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

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: Provider.value(
          value: index,
          child: CommentListDivider(),
        ),
      );
    }

    testWidgets('renders $CommentListDividerBody '
        'when isEndOfThread', (tester) async {
      when(() => commentList.isEndOfThread(index)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListDividerBody), findsOneWidget);
    });

    testWidgets('does not render $CommentListDividerBody '
        'when !isEndOfThread', (tester) async {
      when(() => commentList.isEndOfThread(index)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListDividerBody), findsNothing);
    });
  });

  group(CommentListDividerBody, () {
    Widget buildSubject() => CommentListDividerBody();

    testWidgets('renders $Divider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Divider && widget.height == 1,
        ),
        findsOneWidget,
      );
    });
  });
}
