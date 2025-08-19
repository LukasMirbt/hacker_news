// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
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

class _MockLoginFormModel extends Mock implements LoginFormModel {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const errorText = 'errorText';

  group(LoginPasswordTextField, () {
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
      registerFallbackValue(l10n);
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
      when(() => form.obscurePassword).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.obscureText, false);
    });

    testWidgets('textInputAction is ${TextInputAction.done}', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.textInputAction, TextInputAction.done);
    });

    testWidgets('keyboardType is correct', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.keyboardType,
        TextInputType.visiblePassword,
      );
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

    testWidgets('errorText is correct', (tester) async {
      when(
        () => form.passwordErrorText(any()),
      ).thenReturn(errorText);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.errorText,
        errorText,
      );
    });

    testWidgets('suffixIcon is $LoginPasswordVisibilityButton '
        'when errorText is null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.suffixIcon,
        isA<LoginPasswordVisibilityButton>(),
      );
    });

    testWidgets('suffixIcon is error icon '
        'when errorText is non-null', (tester) async {
      when(
        () => form.passwordErrorText(any()),
      ).thenReturn(errorText);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.suffixIcon,
        isA<AppIcon>().having(
          (icon) => icon.icon,
          'icon',
          Symbols.error_rounded,
        ),
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
      verify(
        () => bloc.add(LoginSubmitted()),
      ).called(1);
    });
  });
}
