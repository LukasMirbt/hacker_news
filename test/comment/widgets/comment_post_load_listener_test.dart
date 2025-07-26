// ignore_for_file: prefer_const_constructors

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
  final child = Container();

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

  group(CommentPostLoadListener, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentPostLoadListener(
          child: child,
        ),
      );
    }

    testWidgets(
      'adds $CommentPostLoaded when fetchStatus changes '
      'from ${FetchStatus.loading} to ${FetchStatus.success}',
      (tester) async {
        whenListen(
          bloc,
          initialState: initialState,
          Stream.value(
            initialState.copyWith(
              fetchStatus: FetchStatus.success,
            ),
          ),
        );
        await tester.pumpApp(buildSubject());
        verify(() => bloc.add(CommentPostLoaded())).called(1);
      },
    );

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
