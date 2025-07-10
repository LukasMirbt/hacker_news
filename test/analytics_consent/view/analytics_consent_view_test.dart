// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAnalyticsConsentBloc
    extends MockBloc<AnalyticsConsentEvent, AnalyticsConsentState>
    implements AnalyticsConsentBloc {}

void main() {
  group(AnalyticsConsentView, () {
    late AnalyticsConsentBloc bloc;

    setUp(() {
      bloc = _MockAnalyticsConsentBloc();
      when(() => bloc.state).thenReturn(AnalyticsConsentState());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsConsentView(),
      );
    }

    testWidgets('renders $AnalyticsConsentListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AnalyticsConsentListener), findsOneWidget);
    });

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $AnalyticsConsentBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AnalyticsConsentBody), findsOneWidget);
    });
  });
}
