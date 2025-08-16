// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
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

  group(AnalyticsConsentAgreeButton, () {
    late AnalyticsConsentBloc bloc;

    setUp(() {
      bloc = _MockAnalyticsConsentBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsConsentAgreeButton(),
      );
    }

    testWidgets('renders $AppFilledButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppFilledButton), findsOneWidget);
    });

    testWidgets('adds $AnalyticsConsentAgreePressed '
        'onPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      verify(
        () => bloc.add(
          AnalyticsConsentAgreePressed(),
        ),
      ).called(1);
    });

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.analyticsConsent_agreeAction),
        findsOneWidget,
      );
    });
  });
}
