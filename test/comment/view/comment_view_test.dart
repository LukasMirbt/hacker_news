// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

void main() {
  final initialState = CommentState(
    fetchStatus: FetchStatus.loading,
    post: CommentPostModel(
      PostPlaceholder(),
    ),
    form: CommentFormModel(
      text: '',
      form: CommentFormPlaceholder(),
    ),
  );

  group(CommentView, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentView(),
      );
    }

    testWidgets('renders $CommentPostLoadListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentPostLoadListener), findsOneWidget);
    });

    testWidgets('renders $CommentSuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentSuccessListener), findsOneWidget);
    });

    testWidgets('renders $CommentFailureListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFailureListener), findsOneWidget);
    });

    testWidgets('renders $CommentAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentAppBar), findsOneWidget);
    });

    testWidgets('renders $Spinner when fetchStatus is '
        '${FetchStatus.loading}', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Spinner), findsOneWidget);
    });

    testWidgets('renders $CommentBody when fetchStatus is '
        '${FetchStatus.success}', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentBody), findsOneWidget);
    });

    testWidgets('renders $ErrorText when fetchStatus is '
        '${FetchStatus.failure}', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ErrorText), findsOneWidget);
    });
  });
}
