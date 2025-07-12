// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

class _MockCreateAccountState extends Mock implements CreateAccountState {}

class _MockCreateAccountFormModel extends Mock
    implements CreateAccountFormModel {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const errorText = 'errorText';

  group(CreateAccountPasswordTextField, () {
    late CreateAccountBloc bloc;
    late CreateAccountState state;
    late CreateAccountFormModel form;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      state = _MockCreateAccountState();
      form = _MockCreateAccountFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.obscurePassword).thenReturn(true);
      registerFallbackValue(l10n);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountPasswordTextField(),
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
        l10n.createAccount_passwordLabel,
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

    testWidgets('suffixIcon is $CreateAccountPasswordVisibilityButton '
        'when errorText is null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.suffixIcon,
        isA<CreateAccountPasswordVisibilityButton>(),
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
        isA<Icon>().having(
          (icon) => icon.icon,
          'icon',
          Icons.error,
        ),
      );
    });

    testWidgets('adds $CreateAccountPasswordChanged onChanged', (tester) async {
      const password = 'password';
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onChanged?.call(password);
      verify(
        () => bloc.add(
          CreateAccountPasswordChanged(password),
        ),
      ).called(1);
    });

    testWidgets('adds $CreateAccountSubmitted onSubmitted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onSubmitted?.call('');
      verify(() => bloc.add(CreateAccountSubmitted())).called(1);
    });
  });
}
