import 'package:hive_ce/hive.dart';
import 'package:post_repository/post_repository.dart';

export 'comment_key.dart';

class CommentStorage {
  CommentStorage({
    required Box<String> box,
  }) : _box = box;

  static Future<CommentStorage> open(HiveInterface hive) async {
    final box = await hive.openBox<String>('commentStorage');
    return CommentStorage(box: box);
  }

  final Box<String> _box;

  Future<void> save({
    required CommentStorageKey storageKey,
    required String text,
  }) async {
    await _box.put(storageKey.key, text);
  }

  String? read(CommentStorageKey storageKey) {
    return _box.get(storageKey.key);
  }

  Future<void> clear(CommentStorageKey storageKey) async {
    await _box.delete(storageKey.key);
  }
}
