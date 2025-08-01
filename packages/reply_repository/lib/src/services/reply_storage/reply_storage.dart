import 'package:hive_ce/hive.dart';
import 'package:reply_repository/reply_repository.dart';

export 'reply_storage_key.dart';

class ReplyStorage {
  ReplyStorage({
    required Box<String> box,
  }) : _box = box;

  final Box<String> _box;

  static Future<ReplyStorage> init(HiveInterface hive) async {
    final box = await hive.openBox<String>('replyStorage');
    return ReplyStorage(box: box);
  }

  Future<void> save({
    required ReplyStorageKey storageKey,
    required String text,
  }) async {
    await _box.put(storageKey.key, text);
  }

  String? read(ReplyStorageKey storageKey) {
    return _box.get(storageKey.key);
  }

  Future<void> clear(ReplyStorageKey storageKey) async {
    await _box.delete(storageKey.key);
  }
}
