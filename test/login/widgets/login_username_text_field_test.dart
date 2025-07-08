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

  group(LoginUsernameTextField, () {
    late LoginBloc bloc;
    late LoginState state;

    setUp(() {
      bloc = _MockLoginBloc();
      state = _MockLoginState();
      when(() => bloc.state).thenReturn(state);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginUsernameTextField(),
      );
    }

    TextField findWidget(WidgetTester tester) {
      return tester.widget<TextField>(
        find.byType(TextField),
      );
    }

    testWidgets('textInputAction is ${TextInputAction.next}', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.textInputAction, TextInputAction.next);
    });

    testWidgets('autofillHints are correct', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.autofillHints,
        [AutofillHints.username],
      );
    });

    testWidgets('labelText is correct', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.labelText,
        l10n.login_usernameLabel,
      );
    });

    testWidgets('adds $LoginUsernameChanged onChanged', (tester) async {
      const username = 'username';
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onChanged?.call(username);
      verify(
        () => bloc.add(
          LoginUsernameChanged(username),
        ),
      ).called(1);
    });
  });
}
