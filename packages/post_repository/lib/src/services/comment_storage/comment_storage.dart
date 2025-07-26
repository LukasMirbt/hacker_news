import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:post_repository/post_repository.dart';

export 'comment_key.dart';

class CommentStorage {
  CommentStorage({
    required Box<String> box,
  }) : _box = box;

  @visibleForTesting
  static const String boxName = 'commentStorage';

  final Box<String> _box;

  static Future<CommentStorage> init(HiveInterface hive) async {
    final box = await hive.openBox<String>(boxName);
    return CommentStorage(box: box);
  }

  Future<void> save({
    required CommentKey key,
    required String text,
  }) async {
    await _box.put(key.value, text);
  }

  String? read(CommentKey key) {
    return _box.get(key.value);
  }

  Future<void> clear(CommentKey key) async {
    await _box.delete(key.value);
  }
}
