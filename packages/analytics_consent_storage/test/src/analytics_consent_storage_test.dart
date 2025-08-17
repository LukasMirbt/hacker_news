// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_consent_storage/analytics_consent_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSharedPreferencesWithCache extends Mock
    implements SharedPreferencesWithCache {}

void main() {
  group(AnalyticsConsentStorage, () {
    late SharedPreferencesWithCache sharedPreferences;

    setUp(() {
      sharedPreferences = _MockSharedPreferencesWithCache();
    });

    AnalyticsConsentStorage createSubject() {
      return AnalyticsConsentStorage(
        sharedPreferences: sharedPreferences,
      );
    }

    group('readAnalyticsCollectionEnabled', () {
      final getBool = () => sharedPreferences.getBool(
        AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
      );

      test('calls getBool and returns correct value '
          'when saved value is non-null', () {
        const value = true;
        when(getBool).thenReturn(value);
        final storage = createSubject();
        expect(
          storage.readAnalyticsCollectionEnabled(),
          value,
        );
        verify(getBool).called(1);
      });

      test('calls getBool and returns correct value '
          'when saved value is null', () {
        final storage = createSubject();
        expect(
          storage.readAnalyticsCollectionEnabled(),
          false,
        );
        verify(getBool).called(1);
      });
    });

    group('writeAnalyticsCollectionEnabled', () {
      const enabled = true;

      final write = () => sharedPreferences.setBool(
        AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
        enabled,
      );

      test('writes to storage with correct key and value', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.writeAnalyticsCollectionEnabled(
          enabled: enabled,
        );
        verify(write).called(1);
      });
    });
  });
}
