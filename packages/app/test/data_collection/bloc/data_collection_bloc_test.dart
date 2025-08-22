// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  const isAnalyticsCollectionEnabled = false;

  final initialState = DataCollectionState(
    isAnalyticsCollectionEnabled: isAnalyticsCollectionEnabled,
  );

  group(DataCollectionBloc, () {
    late AnalyticsRepository repository;

    setUp(() {
      repository = _MockAnalyticsRepository();
      when(repository.isAnalyticsCollectionEnabled).thenReturn(
        isAnalyticsCollectionEnabled,
      );
    });

    DataCollectionBloc buildBloc() {
      return DataCollectionBloc(
        analyticsRepository: repository,
      );
    }

    group(DataCollectionAnalyticsToggled, () {
      final enable = () => repository.enableAnalyticsCollection();
      final disable = () => repository.disableAnalyticsCollection();

      final disabledState = initialState.copyWith(
        isAnalyticsCollectionEnabled: false,
      );

      final enabledState = initialState.copyWith(
        isAnalyticsCollectionEnabled: true,
      );

      blocTest<DataCollectionBloc, DataCollectionState>(
        'emits true and calls enable when analytics are disabled',
        setUp: () {
          when(enable).thenAnswer((_) async {
            return;
          });
        },
        seed: () => disabledState,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            DataCollectionAnalyticsToggled(),
          );
        },
        expect: () => [enabledState],
        verify: (_) {
          verify(enable).called(1);
        },
      );

      blocTest<DataCollectionBloc, DataCollectionState>(
        'emits false and calls disable when analytics are enabled',
        setUp: () {
          when(disable).thenAnswer((_) async {
            return;
          });
        },
        seed: () => enabledState,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            DataCollectionAnalyticsToggled(),
          );
        },
        expect: () => [disabledState],
        verify: (_) {
          verify(disable).called(1);
        },
      );
    });
  });
}
