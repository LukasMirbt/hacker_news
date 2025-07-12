// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockLoginState extends Mock implements LoginState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  const from = 'from';

  group(LoginCreateAccountButton, () {
    late LoginBloc bloc;
    late LoginState state;
    late GoRouter router;

    setUp(() {
      bloc = _MockLoginBloc();
      state = _MockLoginState();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.from).thenReturn(from);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginCreateAccountButton(),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets(
      'pushes $CreateAccountRoute when $TextButton '
      'is pressed',
      (tester) async {
        final route = CreateAccountRoute(from: from);
        final push = () => router.push<void>(route.location);
        when(push).thenAnswer((_) async {});
        await tester.pumpApp(
          buildSubject(),
          router: router,
        );
        await tester.tap(find.byType(TextButton));
        verify(push).called(1);
      },
    );
  });
}
