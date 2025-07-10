// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  final initialState = AnalyticsConsentState();
  group(AnalyticsConsentBloc, () {
    late AnalyticsRepository repository;

    setUp(() {
      repository = _MockAnalyticsRepository();
    });

    AnalyticsConsentBloc buildBloc() {
      return AnalyticsConsentBloc(
        analyticsRepository: repository,
      );
    }

    test('initial state is $AnalyticsConsentState', () {
      expect(buildBloc().state, initialState);
    });

    group(AnalyticsConsentContinuePressed, () {
      final request = () => repository.enableAnalyticsCollection();

      blocTest<AnalyticsConsentBloc, AnalyticsConsentState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsConsentContinuePressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: AnalyticsConsentStatus.loading,
          ),
          initialState.copyWith(
            status: AnalyticsConsentStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(AnalyticsConsentSkipPressed, () {
      final request = () => repository.disableAnalyticsCollection();

      blocTest<AnalyticsConsentBloc, AnalyticsConsentState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsConsentSkipPressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: AnalyticsConsentStatus.loading,
          ),
          initialState.copyWith(
            status: AnalyticsConsentStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
