import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:synchronized/synchronized.dart';

class UserIdStorageService {
  UserIdStorageService({
    required FlutterSecureStorage secureStorage,
    required String? userId,
    Lock? lock,
  }) : _secureStorage = secureStorage,
       _userId = userId,
       _lock = lock ?? Lock();

  static const _key = '__user_id_key__';

  static Future<UserIdStorageService> open({
    required Logger logger,
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
  }) async {
    String? userId;

    try {
      userId = await secureStorage.read(key: _key);
    } catch (error, stackTrace) {
      logger.severe(
        'Failed to read userId from secure storage',
        error,
        stackTrace,
      );
    }

    return UserIdStorageService(
      userId: userId,
      secureStorage: secureStorage,
    );
  }

  final FlutterSecureStorage _secureStorage;
  final Lock _lock;

  String? _userId;

  String? read() => _userId;

  Future<void> update(String? updatedUserId) async {
    await _lock.synchronized<void>(() async {
      if (updatedUserId == _userId) return;
      _userId = updatedUserId;
      await _secureStorage.write(
        key: _key,
        value: updatedUserId,
      );
    });
  }

  Future<void> delete() async {
    await _lock.synchronized<void>(() async {
      if (_userId == null) return;
      _userId = null;
      await _secureStorage.delete(key: _key);
    });
  }
}
