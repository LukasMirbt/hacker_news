// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockLoginState extends Mock implements LoginState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(LoginPasswordTextField, () {
    late LoginBloc bloc;
    late LoginState state;

    setUp(() {
      bloc = _MockLoginBloc();
      state = _MockLoginState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.obscurePassword).thenReturn(true);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginPasswordTextField(),
      );
    }

    TextField findWidget(WidgetTester tester) {
      return tester.widget<TextField>(
        find.byType(TextField),
      );
    }

    testWidgets('obscureText is true when obscurePassword', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.obscureText, true);
    });

    testWidgets('obscureText is false when !obscurePassword', (tester) async {
      when(() => state.obscurePassword).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.obscureText, false);
    });

    testWidgets('textInputAction is ${TextInputAction.done}', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.textInputAction, TextInputAction.done);
    });

    testWidgets('autofillHints are correct', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.autofillHints,
        [AutofillHints.password],
      );
    });

    testWidgets('labelText is correct', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.labelText,
        l10n.login_passwordLabel,
      );
    });

    testWidgets('suffixIcon is $LoginPasswordVisibilityButton', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.suffixIcon,
        isA<LoginPasswordVisibilityButton>(),
      );
    });

    testWidgets('adds $LoginPasswordChanged onChanged', (tester) async {
      const password = 'password';
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onChanged?.call(password);
      verify(
        () => bloc.add(
          LoginPasswordChanged(password),
        ),
      ).called(1);
    });

    testWidgets('adds $LoginSubmitted onSubmitted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onSubmitted?.call('');
      verify(() => bloc.add(LoginSubmitted())).called(1);
    });
  });
}
