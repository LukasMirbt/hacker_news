// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSharedPreferencesWithCache extends Mock
    implements SharedPreferencesWithCache {}

class _MockLogger extends Mock implements Logger {}

void main() {
  const linkLaunchModeKey = '__link_launch_mode_key__';
  const themeModeKey = '__theme_mode_key__';
  const analyticsConsentCompletedKey = '__analytics_consent_completed_key__';

  group(SettingsStorage, () {
    late SharedPreferencesWithCache sharedPreferences;
    late Logger logger;

    setUp(() {
      sharedPreferences = _MockSharedPreferencesWithCache();
      logger = _MockLogger();
    });

    SettingsStorage createSubject() {
      return SettingsStorage(
        sharedPreferences: sharedPreferences,
        logger: logger,
      );
    }

    group('readLinkLaunchMode', () {
      final getString = () => sharedPreferences.getString(linkLaunchModeKey);

      test('calls getString and returns correct value '
          'when saved value matches $LinkLaunchMode name', () {
        final savedValue = LinkLaunchMode.inAppBrowserView.name;
        when(getString).thenReturn(savedValue);
        final storage = createSubject();
        expect(
          storage.readLinkLaunchMode(),
          LinkLaunchMode.inAppBrowserView,
        );
        verify(getString).called(1);
      });

      test('calls getString and returns correct value '
          'when saved value is null', () {
        final storage = createSubject();
        expect(
          storage.readLinkLaunchMode(),
          LinkLaunchMode.initial,
        );
        verify(getString).called(1);
      });

      test('calls getString, logger and returns correct value '
          'when saved value does not match $LinkLaunchMode name', () {
        const savedValue = 'savedValue';
        when(getString).thenReturn(savedValue);
        final storage = createSubject();
        expect(
          storage.readLinkLaunchMode(),
          LinkLaunchMode.initial,
        );
        verify(getString).called(1);
        verify(
          () => logger.severe(
            'Unknown link launch mode: $savedValue',
          ),
        ).called(1);
      });
    });

    group('writeLinkLaunchMode', () {
      const mode = LinkLaunchMode.inAppBrowserView;

      final write = () => sharedPreferences.setString(
        linkLaunchModeKey,
        mode.name,
      );

      test('writes to storage with correct key and value', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.writeLinkLaunchMode(mode);
        verify(write).called(1);
      });
    });

    group('readThemeMode', () {
      final getString = () => sharedPreferences.getString(themeModeKey);

      test('calls getString and returns correct value '
          'when saved value matches $ThemeMode name', () {
        final savedValue = ThemeMode.dark.name;
        when(getString).thenReturn(savedValue);
        final storage = createSubject();
        expect(
          storage.readThemeMode(),
          ThemeMode.dark,
        );
        verify(getString).called(1);
      });

      test('calls getString and returns correct value '
          'when saved value is null', () {
        final storage = createSubject();
        expect(
          storage.readThemeMode(),
          ThemeMode.system,
        );
        verify(getString).called(1);
      });

      test('calls getString, logger and returns correct value '
          'when saved value does not match $ThemeMode name', () {
        const savedValue = 'savedValue';
        when(getString).thenReturn(savedValue);
        final storage = createSubject();
        expect(
          storage.readThemeMode(),
          ThemeMode.system,
        );
        verify(getString).called(1);
        verify(
          () => logger.severe(
            'Unknown theme mode: $savedValue',
          ),
        ).called(1);
      });
    });

    group('writeThemeMode', () {
      const mode = ThemeMode.dark;

      final write = () => sharedPreferences.setString(
        themeModeKey,
        mode.name,
      );

      test('writes to storage with correct key and value', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.writeThemeMode(mode);
        verify(write).called(1);
      });
    });

    group('readAnalyticsConsentCompleted', () {
      final getBool = () => sharedPreferences.getBool(
        analyticsConsentCompletedKey,
      );

      test('calls getBool and returns correct value '
          'when saved value is non-null', () {
        const value = true;
        when(getBool).thenReturn(value);
        final storage = createSubject();
        expect(
          storage.readAnalyticsConsentCompleted(),
          value,
        );
        verify(getBool).called(1);
      });

      test('calls getBool and returns correct value '
          'when saved value is null', () {
        final storage = createSubject();
        expect(
          storage.readAnalyticsConsentCompleted(),
          false,
        );
        verify(getBool).called(1);
      });
    });

    group('writeAnalyticsConsentCompleted', () {
      const completed = true;

      final write = () => sharedPreferences.setBool(
        analyticsConsentCompletedKey,
        completed,
      );

      test('writes to storage with correct key and value', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.writeAnalyticsConsentCompleted(
          completed: completed,
        );
        verify(write).called(1);
      });
    });
  });
}
