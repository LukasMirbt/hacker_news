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

  group(CreateAccountUsernameTextField, () {
    late CreateAccountBloc bloc;
    late CreateAccountState state;
    late CreateAccountFormModel form;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      state = _MockCreateAccountState();
      form = _MockCreateAccountFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      registerFallbackValue(l10n);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountUsernameTextField(),
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
        l10n.createAccount_usernameLabel,
      );
    });

    testWidgets('errorText is correct', (tester) async {
      when(
        () => form.usernameErrorText(any()),
      ).thenReturn(errorText);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(
        widget.decoration?.errorText,
        errorText,
      );
    });

    testWidgets('suffixIcon is error icon '
        'when errorText is non-null', (tester) async {
      when(
        () => form.usernameErrorText(any()),
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

    testWidgets('suffixIcon is null when errorText is null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.decoration?.suffixIcon, null);
    });

    testWidgets('adds $CreateAccountUsernameChanged onChanged', (tester) async {
      const username = 'username';
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onChanged?.call(username);
      verify(
        () => bloc.add(
          CreateAccountUsernameChanged(username),
        ),
      ).called(1);
    });
  });
}
