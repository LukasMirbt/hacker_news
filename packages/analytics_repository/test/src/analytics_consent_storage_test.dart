// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage/storage.dart';

class _MockStorage extends Mock implements Storage {}

void main() {
  group(AnalyticsConsentStorage, () {
    late Storage storage;

    setUp(() {
      storage = _MockStorage();
    });

    AnalyticsConsentStorage createSubject() {
      return AnalyticsConsentStorage(storage: storage);
    }

    group('setAnalyticsCollectionEnabled', () {
      const enabled = true;

      final write = () => storage.write(
        key: AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
        value: enabled.toString(),
      );

      test('writes to storage with correct key and value', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.writeAnalyticsCollectionEnabled(enabled: true);
        verify(write).called(1);
      });
    });

    group('readAnalyticsCollectionEnabled', () {
      final read = () => storage.read(
        key: AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
      );

      test('reads from storage and returns true '
          'when value is "true"', () {
        when(read).thenAnswer((_) async => 'true');
        final storage = createSubject();
        expect(
          storage.readAnalyticsCollectionEnabled(),
          completion(true),
        );
        verify(read).called(1);
      });

      test('reads from storage and returns false '
          'when value is "false"', () {
        when(read).thenAnswer((_) async => 'false');
        final storage = createSubject();
        expect(
          storage.readAnalyticsCollectionEnabled(),
          completion(false),
        );
        verify(read).called(1);
      });

      test('returns false when no value is stored', () {
        when(read).thenAnswer((_) async => null);
        final storage = createSubject();
        expect(
          storage.readAnalyticsCollectionEnabled(),
          completion(false),
        );
        verify(read).called(1);
      });
    });
  });
}
