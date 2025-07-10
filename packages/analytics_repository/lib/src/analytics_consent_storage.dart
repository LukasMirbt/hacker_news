import 'package:storage/storage.dart';

abstract class AnalyticsConsentStorageKeys {
  static const isAnalyticsCollectionEnabledKey =
      '__is_analytics_collection_enabled_key__';
}

class AnalyticsConsentStorage {
  const AnalyticsConsentStorage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  Future<void> writeAnalyticsCollectionEnabled({required bool enabled}) async {
    await _storage.write(
      key: AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
      value: enabled.toString(),
    );
  }

  Future<bool> readAnalyticsCollectionEnabled() async {
    final value = await _storage.read(
      key: AnalyticsConsentStorageKeys.isAnalyticsCollectionEnabledKey,
    );
    return value == 'true';
  }
}
