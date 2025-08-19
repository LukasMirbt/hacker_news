import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsStorageKeys {
  static const linkLaunchModeKey = '__link_launch_mode_key__';

  static const themeModeKey = '__theme_mode_key__';

  static const analyticsConsentCompletedKey =
      '__is_analytics_consent_completed_key__';
}

class SettingsStorage {
  const SettingsStorage({
    required SharedPreferencesWithCache sharedPreferences,
    required Logger logger,
  }) : _sharedPreferences = sharedPreferences,
       _logger = logger;

  final SharedPreferencesWithCache _sharedPreferences;
  final Logger _logger;

  LinkLaunchMode readLinkLaunchMode() {
    final savedValue = _sharedPreferences.getString(
      SettingsStorageKeys.linkLaunchModeKey,
    );

    if (savedValue == null) return LinkLaunchMode.initial;

    return LinkLaunchMode.values.firstWhere(
      (mode) => mode.name == savedValue,
      orElse: () {
        _logger.severe('Unknown link launch mode: $savedValue');
        return LinkLaunchMode.initial;
      },
    );
  }

  Future<void> writeLinkLaunchMode(LinkLaunchMode mode) async {
    await _sharedPreferences.setString(
      SettingsStorageKeys.linkLaunchModeKey,
      mode.name,
    );
  }

  ThemeMode readThemeMode() {
    final savedValue = _sharedPreferences.getString(
      SettingsStorageKeys.themeModeKey,
    );

    if (savedValue == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == savedValue,
      orElse: () {
        _logger.severe('Unknown theme mode: $savedValue');
        return ThemeMode.system;
      },
    );
  }

  Future<void> writeThemeMode(ThemeMode mode) async {
    await _sharedPreferences.setString(
      SettingsStorageKeys.themeModeKey,
      mode.name,
    );
  }

  bool readAnalyticsConsentCompleted() {
    final savedValue = _sharedPreferences.getBool(
      SettingsStorageKeys.analyticsConsentCompletedKey,
    );
    return savedValue ?? false;
  }

  Future<void> writeAnalyticsConsentCompleted({
    required bool completed,
  }) async {
    await _sharedPreferences.setBool(
      SettingsStorageKeys.analyticsConsentCompletedKey,
      completed,
    );
  }
}
