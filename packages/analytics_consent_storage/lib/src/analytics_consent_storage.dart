import 'package:shared_preferences/shared_preferences.dart';

abstract class AnalyticsConsentStorageKeys {
  static const isAnalyticsCollectionEnabledKey =
      '__is_analytics_collection_enabled_key__';
}

class AnalyticsConsentStorage {
  const AnalyticsConsentStorage({
    required SharedPreferencesWithCache sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesWithCache _sharedPreferences;

  bool readAnalyticsCollectionEnabled() {
    final savedValue = _sharedPreferences.getBool(
      AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
    );
    return savedValue ?? false;
  }

  Future<void> writeAnalyticsCollectionEnabled({required bool enabled}) async {
    await _sharedPreferences.setBool(
      AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
      enabled,
    );
  }
}
