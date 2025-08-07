import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';

@DriftAccessor(tables: DraftStorage.tables)
class DraftStorage extends DatabaseAccessor<GeneratedDatabase>
    with $DraftStorageMixin {
  DraftStorage(super.db);

  static const tables = [
    ReplyDrafts,
    CommentDrafts,
  ];

  Future<ReplyDraftData?> readReplyDraft(ReplyDraftKey key) async {
    final selectStatement = select(replyDrafts)..where(key.filter);
    final draft = await selectStatement.getSingleOrNull();
    return draft;
  }

  Future<CommentDraftData?> readCommentDraft(CommentDraftKey key) async {
    final selectStatement = select(commentDrafts)..where(key.filter);
    final draft = await selectStatement.getSingleOrNull();
    return draft;
  }

  Future<void> saveReplyDraft(Insertable<ReplyDraftData> draft) async {
    await into(replyDrafts).insertOnConflictUpdate(draft);
  }

  Future<void> saveCommentDraft(Insertable<CommentDraftData> draft) async {
    await into(commentDrafts).insertOnConflictUpdate(draft);
  }

  Future<void> deleteReplyDraft(ReplyDraftKey key) async {
    final deleteStatement = delete(replyDrafts)..where(key.filter);
    await deleteStatement.go();
  }

  Future<void> deleteCommentDraft(CommentDraftKey key) async {
    final deleteStatement = delete(commentDrafts)..where(key.filter);
    await deleteStatement.go();
  }

  Stream<List<CommentDraftData>> watchCommentDrafts() {
    return select(commentDrafts).watch();
  }

  Stream<List<ReplyDraftData>> watchReplyDrafts() {
    return select(replyDrafts).watch();
  }
}
