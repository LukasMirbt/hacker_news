import 'package:shared_preferences/shared_preferences.dart';

class AnalyticsConsentStorage {
  const AnalyticsConsentStorage({
    required SharedPreferencesWithCache sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const _analyticsCollectionEnabledKey =
      '__analytics_collection_enabled_key__';

  final SharedPreferencesWithCache _sharedPreferences;

  bool readAnalyticsCollectionEnabled() {
    final savedValue = _sharedPreferences.getBool(
      _analyticsCollectionEnabledKey,
    );
    return savedValue ?? false;
  }

  Future<void> writeAnalyticsCollectionEnabled({required bool enabled}) async {
    await _sharedPreferences.setBool(
      _analyticsCollectionEnabledKey,
      enabled,
    );
  }
}
