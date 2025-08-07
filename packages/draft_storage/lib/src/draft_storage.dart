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

  Future<ReplyDraftData?> readReplyDraft({
    required String parentId,
    required String userId,
  }) async {
    final draft =
        await (select(replyDrafts)..where(
              (draft) =>
                  draft.parentId.equals(parentId) & draft.userId.equals(userId),
            ))
            .getSingleOrNull();
    return draft;
  }

  Future<CommentDraftData?> readCommentDraft({
    required String postId,
    required String userId,
  }) async {
    final draft =
        await (select(commentDrafts)..where(
              (draft) =>
                  draft.postId.equals(postId) & draft.userId.equals(userId),
            ))
            .getSingleOrNull();
    return draft;
  }

  Future<void> saveReplyDraft(Insertable<ReplyDraftData> draft) async {
    await into(replyDrafts).insertOnConflictUpdate(draft);
  }

  Future<void> saveCommentDraft(Insertable<CommentDraftData> draft) async {
    await into(commentDrafts).insertOnConflictUpdate(draft);
  }

  Future<void> deleteReplyDraft({
    required String parentId,
    required String userId,
  }) async {
    await (delete(replyDrafts)..where(
          (draft) =>
              draft.parentId.equals(parentId) & draft.userId.equals(userId),
        ))
        .go();
  }

  Future<void> deleteCommentDraft({
    required String postId,
    required String userId,
  }) async {
    await (delete(commentDrafts)..where(
          (draft) => draft.postId.equals(postId) & draft.userId.equals(userId),
        ))
        .go();
  }

  Future<List<CommentDraftData>> loadCommentDrafts() async {
    final drafts = await select(commentDrafts).get();
    return drafts;
  }

  Future<List<ReplyDraftData>> loadReplyDrafts() async {
    final drafts = await select(replyDrafts).get();
    return drafts;
  }

  Stream<List<CommentDraftData>> watchCommentDrafts() {
    return select(commentDrafts).watch();
  }

  Stream<List<ReplyDraftData>> watchReplyDrafts() {
    return select(replyDrafts).watch();
  }
}
