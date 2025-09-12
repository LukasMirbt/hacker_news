// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockListController extends Mock implements ListController {}

class _MockScrollController extends Mock implements ScrollController {}

class _MockSelectedCommentModel extends Mock implements SelectedCommentModel {
  @override
  int get index => 1;

  @override
  double get alignment => 0.5;

  @override
  Curve curve(_) => Curves.easeInOut;

  @override
  Duration duration(double estimatedDistance) => Duration(milliseconds: 500);
}

void main() {
  final child = Container();

  group(SelectedCommentListener, () {
    late CommentListBloc bloc;
    late ScrollController scrollController;
    late ListController listController;
    late SelectedCommentModel selectedComment;

    setUp(() {
      bloc = _MockCommentListBloc();
      scrollController = _MockScrollController();
      listController = _MockListController();
      selectedComment = _MockSelectedCommentModel();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ListenableProvider.value(
          value: scrollController,
          child: SelectedCommentListener(
            listController: listController,
            child: child,
          ),
        ),
      );
    }

    testWidgets('calls animateToItem '
        'when selectedComment changes', (tester) async {
      final firstState = _MockCommentListState();
      final firstCommentList = _MockCommentListModel();
      when(() => firstState.commentList).thenReturn(firstCommentList);

      final secondState = _MockCommentListState();
      final secondCommentList = _MockCommentListModel();
      when(() => secondState.commentList).thenReturn(secondCommentList);
      when(() => secondCommentList.selectedComment).thenReturn(selectedComment);

      whenListen(
        bloc,
        initialState: firstState,
        Stream.value(secondState),
      );

      await tester.pumpApp(buildSubject());

      verify(
        () => listController.animateToItem(
          index: selectedComment.index,
          scrollController: scrollController,
          alignment: selectedComment.alignment,
          duration: selectedComment.duration,
          curve: selectedComment.curve,
        ),
      ).called(1);
    });
  });
}
