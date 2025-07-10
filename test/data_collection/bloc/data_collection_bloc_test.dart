// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  final initialState = DataCollectionState();

  group(DataCollectionBloc, () {
    late AnalyticsRepository repository;

    setUp(() {
      repository = _MockAnalyticsRepository();
    });

    DataCollectionBloc buildBloc() {
      return DataCollectionBloc(
        analyticsRepository: repository,
      );
    }

    group(DataCollectionStarted, () {
      const enabled = true;
      final request = () => repository.isAnalyticsCollectionEnabled();

      blocTest<DataCollectionBloc, DataCollectionState>(
        'emits isAnalyticsCollectionEnabled and [success]',
        setUp: () {
          when(request).thenAnswer((_) async => enabled);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            DataCollectionStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            isAnalyticsCollectionEnabled: enabled,
            status: DataCollectionStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

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
          when(enable).thenAnswer((_) async {});
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
          when(disable).thenAnswer((_) async {});
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
