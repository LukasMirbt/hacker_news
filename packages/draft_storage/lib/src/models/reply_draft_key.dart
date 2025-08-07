import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';

sealed class ReplyDraftKey {
  const ReplyDraftKey();

  Expression<bool> Function($ReplyDraftsTable) get filter;
}

final class ReplyDraftById extends ReplyDraftKey {
  const ReplyDraftById(this.id);

  final int id;

  @override
  Expression<bool> Function($ReplyDraftsTable) get filter =>
      (draft) => draft.id.equals(id);
}

final class ReplyDraftByUniqueKeys extends ReplyDraftKey {
  const ReplyDraftByUniqueKeys({
    required this.parentId,
    required this.userId,
  });

  final String parentId;
  final String userId;

  @override
  Expression<bool> Function($ReplyDraftsTable) get filter =>
      (draft) => draft.parentId.equals(parentId) & draft.userId.equals(userId);
}
