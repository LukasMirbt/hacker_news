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

    testWidgets('renders $CustomScrollView '
        'and $SliverFillRemaining', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(CustomScrollView),
          matching: find.byWidgetPredicate(
            (widget) => widget is SliverFillRemaining && !widget.hasScrollBody,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders $LoginForm', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginForm), findsOneWidget);
    });

    testWidgets('renders $LoginFooter', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginFooter), findsOneWidget);
    });
  });
}
