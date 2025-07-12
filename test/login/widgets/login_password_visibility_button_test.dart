// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockLoginState extends Mock implements LoginState {}

class _MockLoginFormModel extends Mock implements LoginFormModel {}

void main() {
  group(LoginPasswordVisibilityButton, () {
    late LoginBloc bloc;
    late LoginState state;
    late LoginFormModel form;

    setUp(() {
      bloc = _MockLoginBloc();
      state = _MockLoginState();
      form = _MockLoginFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.obscurePassword).thenReturn(true);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginPasswordVisibilityButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets(
      'adds $LoginPasswordVisibilityButton when $IconButton '
      'is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(IconButton));
        verify(
          () => bloc.add(
            LoginPasswordVisibilityToggled(),
          ),
        ).called(1);
      },
    );

    testWidgets('renders correct icon when obscurePassword', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Icons.visibility_outlined),
        findsOneWidget,
      );
    });

    testWidgets('renders correct icon when !obscurePassword', (tester) async {
      when(() => form.obscurePassword).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Icons.visibility_off_outlined),
        findsOneWidget,
      );
    });
  });
}
