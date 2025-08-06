import 'package:app_database/app_database.dart';

class DraftStorage {
  const DraftStorage({
    required AppDatabase appDatabase,
  }) : _database = appDatabase;

  final AppDatabase _database;

  Future<List<CommentDraft>> loadCommentDrafts() async {
    final drafts = await _database.managers.commentDrafts.get();
    return drafts;
  }

  Future<List<ReplyDraft>> loadReplyDrafts() async {
    final drafts = await _database.managers.replyDrafts.get();
    return drafts;
  }

  Future<void> saveCommentDraft(CommentDraft draft) async {
    await _database.managers.commentDrafts.replace(draft);
  }

  Future<void> saveReplyDraft(ReplyDraft draft) async {
    await _database.managers.replyDrafts.replace(draft);
  }
}
