import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive.dart';

class CommentKey extends Equatable {
  const CommentKey({
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;

  String get key => '$postId:$userId';

  @override
  List<Object> get props => [
    postId,
    userId,
  ];
}

class CommentStorage {
  CommentStorage({
    required Box<String> box,
  }) : _box = box;

  static const String _boxName = 'commentDraftBox';

  final Box<String> _box;

  static Future<CommentStorage> init() async {
    final box = await Hive.openBox<String>(_boxName);
    return CommentStorage(box: box);
  }

  Future<void> save({
    required CommentKey key,
    required String text,
  }) async {
    await _box.put(key.key, text);
  }

  String? read(CommentKey key) {
    return _box.get(key.key);
  }

  Future<void> clear(CommentKey key) async {
    await _box.delete(key.key);
  }
}
