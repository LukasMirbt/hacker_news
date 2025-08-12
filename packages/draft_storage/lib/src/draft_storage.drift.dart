// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift/src/runtime/api/runtime_api.dart' as i1;
import 'package:draft_storage/src/tables/reply_drafts.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:draft_storage/src/tables/comment_drafts.drift.dart' as i4;

mixin $DraftStorageMixin on i0.DatabaseAccessor<i1.GeneratedDatabase> {
  i2.$ReplyDraftsTable get replyDrafts => i3.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i2.$ReplyDraftsTable>('reply_drafts');
  i4.$CommentDraftsTable get commentDrafts => i3.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i4.$CommentDraftsTable>('comment_drafts');
}
