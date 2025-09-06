// ignore_for_file: prefer_const_constructors

import 'package:app/reply/reply.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

void main() {
  final child = Container();

  group(ReplyAppObserver, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
    });

    Widget createSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyAppObserver(child: child),
      );
    }

    testWidgets('adds $ReplyAppInactivated when state '
        'changes from ${AppLifecycleState.resumed} '
        'to ${AppLifecycleState.inactive}', (tester) async {
      final binding = tester.binding
        ..handleAppLifecycleStateChanged(AppLifecycleState.resumed);

      await tester.pumpApp(createSubject());

      binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);

      verify(
        () => bloc.add(
          ReplyAppInactivated(),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(createSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
