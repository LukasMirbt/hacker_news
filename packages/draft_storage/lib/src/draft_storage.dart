import 'package:app_database/app_database.dart';

class DraftStorage {
  const DraftStorage({
    required AppDatabase appDatabase,
  }) : _database = appDatabase;

  final AppDatabase _database;

  Future<ReplyDraftData?> readReplyDraft({
    required String parentId,
    required String userId,
  }) async {
    final draft = await _database.managers.replyDrafts
        .filter(
          (draft) =>
              draft.parentId.equals(parentId) & draft.userId.equals(userId),
        )
        .getSingleOrNull();
    return draft;
  }

  Future<void> saveReplyDraft(Insertable<ReplyDraftData> draft) async {
    await _database.managers.replyDrafts.replace(draft);
  }

  Future<void> deleteReplyDraft({
    required String parentId,
    required String userId,
  }) async {
    await _database.managers.replyDrafts
        .filter(
          (draft) =>
              draft.parentId.equals(parentId) & draft.userId.equals(userId),
        )
        .delete();
  }

  Future<List<CommentDraftData>> loadCommentDrafts() async {
    final drafts = await _database.managers.commentDrafts.get();
    return drafts;
  }

  Future<List<ReplyDraftData>> loadReplyDrafts() async {
    final drafts = await _database.managers.replyDrafts.get();
    return drafts;
  }

  Future<void> saveCommentDraft(CommentDraftData draft) async {
    await _database.managers.commentDrafts.replace(draft);
  }
}
