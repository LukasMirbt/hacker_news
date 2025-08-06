import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';

class DraftRepository {
  const DraftRepository({
    required DraftStorage storage,
  }) : _storage = storage;

  final DraftStorage _storage;

  Future<List<Draft>> loadDrafts() async {
    final commentDrafts = await _storage.loadCommentDrafts();
    final replyDrafts = await _storage.loadReplyDrafts();

    final drafts =
        [
          for (final draft in commentDrafts) CommentDraft.from(draft),
          for (final draft in replyDrafts) Draft.from(draft),
        ]..sort(
          (a, b) => b.createdAt.compareTo(a.createdAt),
        );

    return drafts;
  }
}
