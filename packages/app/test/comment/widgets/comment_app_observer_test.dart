// ignore_for_file: prefer_const_constructors

import 'package:app/comment/comment.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

void main() {
  final child = Container();

  group(CommentAppObserver, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
    });

    Widget createSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentAppObserver(child: child),
      );
    }

    testWidgets('adds $CommentAppInactivated when state '
        'changes from ${AppLifecycleState.resumed} '
        'to ${AppLifecycleState.inactive}', (tester) async {
      final binding = tester.binding
        ..handleAppLifecycleStateChanged(AppLifecycleState.resumed);

      await tester.pumpApp(createSubject());

      binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);

      verify(
        () => bloc.add(
          CommentAppInactivated(),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(createSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
