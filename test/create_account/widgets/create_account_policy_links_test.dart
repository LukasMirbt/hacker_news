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

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CreateAccountPolicyLinks, () {
    late CreateAccountBloc bloc;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      when(() => bloc.state).thenReturn(
        CreateAccountState(from: 'from'),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountPolicyLinks(),
      );
    }

    testWidgets('adds $CreateAccountTermsPressed when terms link '
        'is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tapOnText(
        find.textRange.ofSubstring(l10n.createAccount_termsOfUse),
      );
      verify(
        () => bloc.add(CreateAccountTermsPressed()),
      ).called(1);
    });

    testWidgets(
      'adds $CreateAccountPrivacyPolicyPressed when privacy policy link '
      'is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tapOnText(
          find.textRange.ofSubstring(l10n.createAccount_privacyPolicy),
        );
        verify(
          () => bloc.add(CreateAccountPrivacyPolicyPressed()),
        ).called(1);
      },
    );
  });
}
