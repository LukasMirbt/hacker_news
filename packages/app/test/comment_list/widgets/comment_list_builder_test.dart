// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

void main() {
  group(CommentListBuilder, () {
    late CommentListBloc bloc;
    late CommentListState state;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      when(() => bloc.state).thenReturn(state);
      registerFallbackValue(
        CommentModel.from(OtherUserCommentPlaceholder()),
      );
      when(() => state.commentList).thenReturn(
        CommentListModel.from([
          OtherUserCommentPlaceholder(),
        ]),
      );
      when(() => state.isSelected(any())).thenReturn(false);
    });

    Widget buildSubject(
      Widget Function(BuildContext, CommentListBuilder) builder,
    ) {
      return BlocProvider.value(
        value: bloc,
        child: Builder(
          builder: (context) => builder(
            context,
            CommentListBuilder(),
          ),
        ),
      );
    }

    testWidgets('renders $CommentListItem', (tester) async {
      await tester.pumpApp(
        buildSubject(
          (context, builder) => builder.itemBuilder(context, 0),
        ),
      );
      expect(find.byType(CommentListItem), findsOneWidget);
    });

    testWidgets('renders $CommentListDivider', (tester) async {
      await tester.pumpApp(
        buildSubject(
          (context, builder) => builder.itemBuilder(context, 0),
        ),
      );
      expect(find.byType(CommentListDivider), findsOneWidget);
    });

    testWidgets('renders $CommentListFooter', (tester) async {
      await tester.pumpApp(
        buildSubject(
          (context, builder) => builder.itemBuilder(context, 0),
        ),
      );
      expect(find.byType(CommentListFooter), findsOneWidget);
    });
  });
}
