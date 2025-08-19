// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift/src/runtime/api/runtime_api.dart' as i1;
import 'package:visited_post_storage/src/tables/visited_posts.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;

mixin $VisitedPostStorageMixin on i0.DatabaseAccessor<i1.GeneratedDatabase> {
  i2.$VisitedPostsTable get visitedPosts => i3.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i2.$VisitedPostsTable>('visited_posts');
}
