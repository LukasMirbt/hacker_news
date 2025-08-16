// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  final initialState = AnalyticsConsentState();
  group(AnalyticsConsentBloc, () {
    late AnalyticsRepository repository;
    late LinkLauncher launcher;

    setUp(() {
      repository = _MockAnalyticsRepository();
      launcher = _MockLinkLauncher();
    });

    AnalyticsConsentBloc buildBloc() {
      return AnalyticsConsentBloc(
        analyticsRepository: repository,
        linkLauncher: launcher,
      );
    }

    test('initial state is $AnalyticsConsentState', () {
      expect(buildBloc().state, initialState);
    });

    group(AnalyticsConsentPrivacyPolicyPressed, () {
      final launch = () => launcher.launch(yapPrivacyPolicyLink);

      blocTest(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsConsentPrivacyPolicyPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(AnalyticsConsentAgreePressed, () {
      final enableAnalyticsCollection = () =>
          repository.enableAnalyticsCollection();

      blocTest(
        'calls enableAnalyticsCollection and emits success',
        setUp: () {
          when(enableAnalyticsCollection).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsConsentAgreePressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: AnalyticsConsentStatus.success,
          ),
        ],
        verify: (_) {
          verify(enableAnalyticsCollection).called(1);
        },
      );
    });

    group(AnalyticsConsentDeclinePressed, () {
      final disableAnalyticsCollection = () =>
          repository.disableAnalyticsCollection();

      blocTest(
        'calls disableAnalyticsCollection and emits success',
        setUp: () {
          when(disableAnalyticsCollection).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsConsentDeclinePressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: AnalyticsConsentStatus.success,
          ),
        ],
        verify: (_) {
          verify(disableAnalyticsCollection).called(1);
        },
      );
    });
  });
}
