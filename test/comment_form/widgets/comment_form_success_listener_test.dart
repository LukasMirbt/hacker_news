import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentFormBloc extends MockBloc<CommentFormEvent, CommentFormState>
    implements CommentFormBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();

  final initialState = CommentFormState(
    post: PostPlaceholder(),
  );

  group(CommentFormSuccessListener, () {
    late CommentFormBloc bloc;
    late GoRouter router;

    setUp(() {
      bloc = _MockCommentFormBloc();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormSuccessListener(
          child: child,
        ),
      );
    }

    testWidgets('pops when status changes '
        'to ${CommentFormStatus.success}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: CommentFormStatus.success,
          ),
        ),
      );
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      verify(router.pop).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
