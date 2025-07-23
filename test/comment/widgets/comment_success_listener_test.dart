import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();

  final initialState = CommentState.initial(
    post: PostPlaceholder(),
  );

  group(CommentSuccessListener, () {
    late CommentBloc bloc;
    late GoRouter router;

    setUp(() {
      bloc = _MockCommentBloc();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentSuccessListener(
          child: child,
        ),
      );
    }

    testWidgets('pops when status changes '
        'to ${CommentStatus.success}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: CommentStatus.success,
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
