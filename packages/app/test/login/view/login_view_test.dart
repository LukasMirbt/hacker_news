// ignore_for_file: prefer_const_constructors

import 'package:app/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group(LoginView, () {
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
        child: LoginView(),
      );
    }

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $LoginBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginBody), findsOneWidget);
    });
  });
}
