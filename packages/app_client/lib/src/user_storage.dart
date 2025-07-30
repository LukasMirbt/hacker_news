import 'package:storage/storage.dart';

abstract class UserStorageKeys {
  static const userIdKey = '__user_id_key__';
}

class UserStorage {
  const UserStorage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  Future<void> writeUserId({required String userId}) async {
    await _storage.write(
      key: UserStorageKeys.userIdKey,
      value: userId,
    );
  }

  Future<String?> readUserId() async {
    final value = await _storage.read(
      key: UserStorageKeys.userIdKey,
    );
    return value;
  }
}
