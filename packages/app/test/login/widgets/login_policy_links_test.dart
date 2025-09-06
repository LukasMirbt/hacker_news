// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(LoginPolicyLinks, () {
    late LoginBloc bloc;

    setUp(() {
      bloc = _MockLoginBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginPolicyLinks(),
      );
    }

    testWidgets('adds $LoginTermsPressed when terms link '
        'is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tapOnText(
        find.textRange.ofSubstring(l10n.login_termsOfUse),
      );
      verify(
        () => bloc.add(LoginTermsPressed()),
      ).called(1);
    });

    testWidgets(
      'adds $LoginPrivacyPolicyPressed when privacy policy link '
      'is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tapOnText(
          find.textRange.ofSubstring(l10n.login_privacyPolicy),
        );
        verify(
          () => bloc.add(LoginPrivacyPolicyPressed()),
        ).called(1);
      },
    );
  });
}
