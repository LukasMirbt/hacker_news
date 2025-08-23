import 'package:app/reply/reply.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();
  final initialState = ReplyState.initial(url: 'url');

  group(ReplySuccessListener, () {
    late ReplyBloc bloc;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockReplyBloc();
      goRouter = _MockGoRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: ReplySuccessListener(
            child: child,
          ),
        ),
      );
    }

    testWidgets('pops when submissionStatus changes '
        'to ${SubmissionStatus.success}', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            form: initialState.form.copyWith(
              submissionStatus: SubmissionStatus.success,
            ),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(goRouter.pop).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
