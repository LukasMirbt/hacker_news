import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';

sealed class CommentDraftKey {
  const CommentDraftKey();

  Expression<bool> Function($CommentDraftsTable) get filter;
}

final class CommentDraftById extends CommentDraftKey {
  const CommentDraftById(this.id);

  final int id;

  @override
  Expression<bool> Function($CommentDraftsTable) get filter =>
      (draft) => draft.id.equals(id);
}

final class CommentDraftByUniqueKeys extends CommentDraftKey {
  const CommentDraftByUniqueKeys({
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;

  @override
  Expression<bool> Function($CommentDraftsTable) get filter =>
      (draft) => draft.postId.equals(postId) & draft.userId.equals(userId);
}
