// ignore_for_file: prefer_const_constructors

import 'package:app/comment/comment.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

void main() {
  final child = Container();

  final initialState = CommentState(
    fetchStatus: FetchStatus.loading,
    header: CommentPostHeaderModel(
      PostHeaderPlaceholder(),
    ),
    form: CommentFormModel(
      form: CommentFormPlaceholder(),
    ),
  );

  group(CommentFailureListener, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFailureListener(
          child: child,
        ),
      );
    }

    testWidgets('shows $SnackBar when submissionStatus changes '
        'to ${SubmissionStatus.failure}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            form: initialState.form.copyWith(
              submissionStatus: SubmissionStatus.failure,
            ),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
