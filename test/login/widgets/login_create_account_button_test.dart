// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockLoginState extends Mock implements LoginState {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const from = 'from';

  group(LoginCreateAccountButton, () {
    late LoginBloc bloc;
    late LoginState state;
    late AppRouter router;

    setUp(() {
      bloc = _MockLoginBloc();
      state = _MockLoginState();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.from).thenReturn(from);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: LoginCreateAccountButton(),
        ),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('pushes $CreateAccountRoute when $TextButton '
        'is pressed', (tester) async {
      final push = () => router.push(
        CreateAccountRoute(from: from),
      );
      when(push).thenAnswer((_) async => null);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(TextButton));
      verify(push).called(1);
    });
  });
}
