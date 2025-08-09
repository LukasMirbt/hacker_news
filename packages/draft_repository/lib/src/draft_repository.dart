import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:stream_transform/stream_transform.dart';

class DraftRepository {
  const DraftRepository({
    required DraftStorage draftStorage,
  }) : _storage = draftStorage;

  final DraftStorage _storage;

  Stream<List<Draft>> get drafts {
    final commentDraftStream = _storage.watchCommentDrafts();
    final replyDraftStream = _storage.watchReplyDrafts();

    return commentDraftStream.combineLatest(
      replyDraftStream,
      (commentDrafts, replyDrafts) {
        final drafts =
            [
              for (final draft in commentDrafts) CommentDraft.from(draft),
              for (final draft in replyDrafts) ReplyDraft.from(draft),
            ]..sort(
              (a, b) => b.createdAt.compareTo(a.createdAt),
            );

        return drafts;
      },
    );
  }

  Future<void> deleteDraft(Draft draft) async {
    switch (draft) {
      case CommentDraft():
        await _storage.deleteCommentDraft(
          CommentDraftById(draft.id),
        );
      case ReplyDraft():
        await _storage.deleteReplyDraft(
          ReplyDraftById(draft.id),
        );
    }
  }
}
