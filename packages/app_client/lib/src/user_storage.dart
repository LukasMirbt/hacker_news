import 'package:app_client/app_client.dart' hide Storage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  UserStorage({
    required User? user,
    required FlutterSecureStorage secureStorage,
  }) : _user = user,
       _secureStorage = secureStorage;

  static const _key = 'user';

  static Future<UserStorage> open({
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
  }) async {
    /*     final user = await secureStorage.read(key: _key); */
    return UserStorage(
      user: User.empty,
      secureStorage: secureStorage,
    );
  }

  final FlutterSecureStorage _secureStorage;
  final User? _user;

  Future<User?> read() async {
    return null;
    /*    if (_user != null) return _user;

    final value = _box.get(_key);
    if (value == null) return null;

    try {
      final json = jsonDecode(value) as Map<String, dynamic>;
      return User.fromJson(json);
    } catch (_) {
      return null;
    } */
  }

  Future<void> write(User user) async {
    /*     if (user == _user) return;
    _user = user;
    final json = jsonEncode(user.toJson());
    await _box.put(_key, json); */
  }

  Future<void> clear() async {
    /*   _user = null;
    await _box.delete(_key); */
  }
}
