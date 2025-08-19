import 'dart:async';

import 'package:drift/drift.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

@DriftAccessor(tables: VisitedPostStorage.tables)
class VisitedPostStorage extends DatabaseAccessor<GeneratedDatabase>
    with $VisitedPostStorageMixin {
  VisitedPostStorage._(super.db);

  static const tables = [VisitedPosts];

  static Future<VisitedPostStorage> open(GeneratedDatabase db) async {
    final storage = VisitedPostStorage._(db);
    await storage._loadVisitedPosts();
    return storage;
  }

  late final Set<String> _visitedPosts;

  Future<void> _loadVisitedPosts() async {
    final query = select(visitedPosts).map(
      (row) => row.postId,
    );

    final postList = await query.get();

    _visitedPosts = postList.toSet();
  }

  Set<String> read() => _visitedPosts;

  Future<void> add(String postId) async {
    _visitedPosts.add(postId);

    await into(visitedPosts).insert(
      VisitedPostsCompanion.insert(
        postId: postId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Stream<Set<String>> watch() {
    final query = select(visitedPosts).map(
      (row) => row.postId,
    );

    final stream = query.watch().map(
      (ids) => ids.toSet(),
    );

    return stream;
  }
}
