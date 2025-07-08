import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyFormBloc extends MockBloc<ReplyFormEvent, ReplyFormState>
    implements ReplyFormBloc {}

void main() {
  final child = Container();

  final initialState = ReplyFormState.initial(
    commentId: 'commentId',
    post: PostPlaceholder(),
  );

  group(ReplyFormFailureListener, () {
    late ReplyFormBloc bloc;

    setUp(() {
      bloc = _MockReplyFormBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyFormFailureListener(child: child),
      );
    }

    testWidgets('shows $SnackBar when submissionStatus changes '
        'to ${SubmissionStatus.failure}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            submissionStatus: SubmissionStatus.failure,
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
