// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
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
      return RootRestorationScope(
        restorationId: 'app',
        child: BlocProvider.value(
          value: bloc,
          child: CreateAccountUsernameTextField(),
        ),
      );
    }

    TextField findWidget(WidgetTester tester) {
      return tester.widget<TextField>(
        find.byType(TextField),
      );
    }

    testWidgets('controller is non-null', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.controller, isNotNull);
    });

    testWidgets('restores controller state', (tester) async {
      await tester.pumpApp(buildSubject());
      const text = 'text';
      await tester.enterText(find.byType(TextField), text);
      await tester.pump();
      await tester.restartAndRestore();
      final widget = findWidget(tester);
      expect(widget.controller?.text, text);
    });

    testWidgets('adds $CreateAccountUsernameRestored when state '
        'is restored', (tester) async {
      await tester.pumpApp(buildSubject());
      const text = 'text';
      await tester.enterText(find.byType(TextField), text);
      await tester.pump();
      await tester.restartAndRestore();
      verify(
        () => bloc.add(
          CreateAccountUsernameRestored(text),
        ),
      ).called(1);
    });

    testWidgets('autocorrect is false', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.autocorrect, false);
    });

    testWidgets('enableSuggestions is false', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.enableSuggestions, false);
    });

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
        [AutofillHints.newUsername],
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
        isA<AppIcon>().having(
          (icon) => icon.icon,
          'icon',
          Symbols.error_rounded,
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
