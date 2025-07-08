import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentFormBloc extends MockBloc<CommentFormEvent, CommentFormState>
    implements CommentFormBloc {}

void main() {
  final child = Container();

  final initialState = CommentFormState(
    post: PostPlaceholder(),
  );

  group(CommentFormFailureListener, () {
    late CommentFormBloc bloc;

    setUp(() {
      bloc = _MockCommentFormBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormFailureListener(
          child: child,
        ),
      );
    }

    testWidgets('shows $SnackBar when status changes '
        'to ${CommentFormStatus.failure}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: CommentFormStatus.failure,
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
