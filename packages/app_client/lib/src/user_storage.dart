import 'dart:convert';

import 'package:app_client/app_client.dart' hide Storage;
import 'package:hive_ce/hive.dart';

class UserStorage {
  const UserStorage({
    required Box<String> box,
  }) : _box = box;

  static const _key = 'user';

  static Future<UserStorage> open(
    HiveInterface hive,
    HiveCipher encryptionCipher,
  ) async {
    final box = await hive.openBox<String>(
      'userStorage',
      encryptionCipher: encryptionCipher,
    );
    return UserStorage(box: box);
  }

  final Box<String> _box;

  Future<void> save(User user) async {
    final stopwatch = Stopwatch()..start();
    final json = jsonEncode(user.toJson());
    await _box.put(_key, json);
    stopwatch.stop();
    print('UserStorage save: ${stopwatch.elapsedMilliseconds}');
  }

  Future<User?> read() async {
    final stopwatch = Stopwatch()..start();
    final value = _box.get(_key);
    stopwatch.stop();
    print('UserStorage read: ${stopwatch.elapsedMilliseconds}');
    if (value == null) return null;

    try {
      final json = jsonDecode(value) as Map<String, dynamic>;
      return User.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    final stopwatch = Stopwatch()..start();
    await _box.delete(_key);
    stopwatch.stop();
    print('UserStorage clear: ${stopwatch.elapsedMilliseconds}');
  }
}
