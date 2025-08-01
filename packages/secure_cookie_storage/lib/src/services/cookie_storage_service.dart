import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';
import 'package:synchronized/synchronized.dart';

class CookieStorageService {
  CookieStorageService({
    required FlutterSecureStorage secureStorage,
    required CookieSerializer serializer,
    required Map<String, String> cookies,
    Lock? lock,
  }) : _secureStorage = secureStorage,
       _serializer = serializer,
       _cookies = cookies,
       _lock = lock ?? Lock();

  static const _key = '__cookie_key__';

  static Future<CookieStorageService> open({
    required Logger logger,
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
    CookieSerializer serializer = const CookieSerializer(),
  }) async {
    Map<String, String>? cookies;

    try {
      final json = await secureStorage.read(key: _key);

      if (json != null) {
        cookies = serializer.deserialize(json);
      }
    } catch (error, stackTrace) {
      logger.severe(
        'Failed to read cookies from secure storage',
        error,
        stackTrace,
      );
    }

    return CookieStorageService(
      cookies: cookies ?? {},
      serializer: serializer,
      secureStorage: secureStorage,
    );
  }

  final FlutterSecureStorage _secureStorage;
  final CookieSerializer _serializer;
  final Lock _lock;

  Map<String, String> _cookies;

  String? read(String key) => _cookies[key];

  Future<void> update(
    void Function(Map<String, String>) update,
  ) async {
    await _lock.synchronized<void>(() async {
      final updatedCookies = {..._cookies};

      update(updatedCookies);

      if (mapEquals(updatedCookies, _cookies)) return;

      _cookies = updatedCookies;

      final serializedCookies = _serializer.serialize(updatedCookies);

      await _secureStorage.write(
        key: _key,
        value: serializedCookies,
      );
    });
  }
}
