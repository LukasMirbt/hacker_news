// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/analytics/analytics.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group(AnalyticsBloc, () {
    late AnalyticsRepository repository;

    setUp(() {
      repository = _MockAnalyticsRepository();
      registerFallbackValue(ScreenView(''));
    });

    AnalyticsBloc buildBloc() {
      return AnalyticsBloc(
        analyticsRepository: repository,
      );
    }

    group(AnalyticsFullPathChanged, () {
      const fullPath = 'fullPath';

      final send = () => repository.send(
        any(
          that: isA<ScreenView>().having(
            (screenView) => screenView.screenName,
            'screenName',
            fullPath,
          ),
        ),
      );

      blocTest(
        'sends $ScreenView',
        setUp: () {
          when(send).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AnalyticsFullPathChanged(fullPath),
          );
        },
        verify: (_) {
          verify(send).called(1);
        },
      );
    });
  });
}
