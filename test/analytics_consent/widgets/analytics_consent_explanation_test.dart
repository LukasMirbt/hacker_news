// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAnalyticsConsentBloc
    extends MockBloc<AnalyticsConsentEvent, AnalyticsConsentState>
    implements AnalyticsConsentBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(AnalyticsConsentExplanation, () {
    late AnalyticsConsentBloc bloc;

    setUp(() {
      bloc = _MockAnalyticsConsentBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsConsentExplanation(),
      );
    }

    testWidgets(
      'adds $AnalyticsConsentPrivacyPolicyPressed when privacy policy link '
      'is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tapOnText(
          find.textRange.ofSubstring(l10n.analyticsConsent_privacyPolicy),
        );
        verify(
          () => bloc.add(AnalyticsConsentPrivacyPolicyPressed()),
        ).called(1);
      },
    );
  });
}
