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

void main() {
  group(LoginBody, () {
    late LoginBloc bloc;

    setUp(() {
      bloc = _MockLoginBloc();
      when(() => bloc.state).thenReturn(
        LoginState(from: 'from'),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginBody(),
      );
    }

    testWidgets('renders $AutofillGroup', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AutofillGroup), findsOneWidget);
    });

    testWidgets('renders $LoginUsernameTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginUsernameTextField), findsOneWidget);
    });

    testWidgets('renders $LoginPasswordTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginPasswordTextField), findsOneWidget);
    });

    testWidgets('renders $LoginButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginButton), findsOneWidget);
    });
  });
}
