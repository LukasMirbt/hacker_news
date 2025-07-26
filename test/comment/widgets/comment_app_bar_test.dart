// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockCommentState extends Mock implements CommentState {}

void main() {
  group(CommentAppBar, () {
    late CommentBloc bloc;
    late CommentState state;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isSubmittingEnabled).thenReturn(false);
      when(() => state.form).thenReturn(
        CommentFormModel(
          form: CommentFormPlaceholder(),
          text: '',
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentAppBar(),
      );
    }

    testWidgets('renders $CommentSubmitButton '
        'when isSubmittingEnabled', (tester) async {
      when(() => state.isSubmittingEnabled).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentSubmitButton), findsOneWidget);
    });

    testWidgets('does not render $CommentSubmitButton '
        'when !isSubmittingEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentSubmitButton), findsNothing);
    });
  });
}
