// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:analytics_repository/analytics_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseApp extends Mock implements FirebaseApp {}

class _MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class _MockAnalyticsConsentStorage extends Mock
    implements AnalyticsConsentStorage {}

class _MockAnalyticsEvent extends Mock implements AnalyticsEvent {}

void main() {
  group(AnalyticsRepository, () {
    late FirebaseApp firebaseApp;
    late FirebaseAnalytics firebaseAnalytics;
    late AnalyticsConsentStorage storage;

    setUp(() {
      firebaseApp = _MockFirebaseApp();
      firebaseAnalytics = _MockFirebaseAnalytics();
      storage = _MockAnalyticsConsentStorage();
    });

    AnalyticsRepository createSubject() {
      return AnalyticsRepository(
        firebaseApp,
        firebaseAnalytics: firebaseAnalytics,
        consentStorage: storage,
      );
    }

    group('isAnalyticsCollectionEnabled', () {
      final read = () => storage.readAnalyticsCollectionEnabled();

      test('reads storage and returns value', () async {
        const enabled = true;
        when(read).thenAnswer(
          (_) async => enabled,
        );
        final repository = createSubject();
        expect(
          repository.isAnalyticsCollectionEnabled(),
          completion(enabled),
        );
        verify(read).called(1);
      });
    });

    group('disableAnalyticsCollection', () {
      const enabled = false;

      final setEnabled = () =>
          firebaseAnalytics.setAnalyticsCollectionEnabled(enabled);

      final write = () =>
          storage.writeAnalyticsCollectionEnabled(enabled: enabled);

      test('disables analytics collection and writes to storage', () async {
        when(setEnabled).thenAnswer((_) async {});
        when(write).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.disableAnalyticsCollection();
        verify(setEnabled).called(1);
        verify(write).called(1);
      });
    });

    group('enableAnalyticsCollection', () {
      const enabled = true;

      final setEnabled = () =>
          firebaseAnalytics.setAnalyticsCollectionEnabled(enabled);

      final write = () =>
          storage.writeAnalyticsCollectionEnabled(enabled: enabled);

      test('enables analytics collection and writes to storage', () async {
        when(setEnabled).thenAnswer((_) async {});
        when(write).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.enableAnalyticsCollection();
        verify(setEnabled).called(1);
        verify(write).called(1);
      });
    });

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
