// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:analytics_repository/analytics_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseApp extends Mock implements FirebaseApp {}

class _MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class _MockAnalyticsEvent extends Mock implements AnalyticsEvent {}

void main() {
  group(AnalyticsRepository, () {
    late FirebaseApp firebaseApp;
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseApp = _MockFirebaseApp();
      firebaseAnalytics = _MockFirebaseAnalytics();
    });

    AnalyticsRepository createSubject() {
      return AnalyticsRepository(
        firebaseApp,
        firebaseAnalytics: firebaseAnalytics,
      );
    }

    group('send', () {
      final event = _MockAnalyticsEvent();
      final send = () => event.send(firebaseAnalytics);

      test('calls event.send', () {
        when(send).thenAnswer((_) async {});
        final repository = createSubject();
        repository.send(event);
        verify(send).called(1);
      });

      test('throws $SendAnalyticsEventFailure when event.send throws', () {
        final error = Exception('error');
        when(send).thenThrow(error);
        final repository = createSubject();
        expect(
          () => repository.send(event),
          throwsA(
            SendAnalyticsEventFailure(event, error),
          ),
        );
      });
    });
  });
}
