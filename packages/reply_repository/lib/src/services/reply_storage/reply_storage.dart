import 'package:hive_ce/hive.dart';
import 'package:reply_repository/reply_repository.dart';

export 'reply_storage_key.dart';

class ReplyStorage {
  ReplyStorage({
    required Box<String> box,
  }) : _box = box;

  static Future<ReplyStorage> open(HiveInterface hive) async {
    final box = await hive.openBox<String>('replyStorage');
    return ReplyStorage(box: box);
  }

  final Box<String> _box;

  Future<void> save({
    required ReplyStorageKey storageKey,
    required String text,
  }) async {
    final stopwatch = Stopwatch()..start();
    await _box.put(storageKey.key, text);
    stopwatch.stop();
    print('ReplyStorage save: ${stopwatch.elapsedMilliseconds}');
  }

  String? read(ReplyStorageKey storageKey) {
    final stopwatch = Stopwatch()..start();
    final value = _box.get(storageKey.key);
    stopwatch.stop();
    print('ReplyStorage read: ${stopwatch.elapsedMilliseconds}');
    return value;
  }

  Future<void> clear(ReplyStorageKey storageKey) async {
    final stopwatch = Stopwatch()..start();
    await _box.delete(storageKey.key);
    stopwatch.stop();
    print('ReplyStorage clear: ${stopwatch.elapsedMilliseconds}');
  }
}
