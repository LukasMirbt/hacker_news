import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

sealed class CommentDraftKey extends Equatable {
  const CommentDraftKey();

  Expression<bool> Function($CommentDraftsTable) get filter;
}

final class CommentDraftById extends CommentDraftKey {
  const CommentDraftById(this.id);

  final int id;

  @override
  Expression<bool> Function($CommentDraftsTable) get filter =>
      (draft) => draft.id.equals(id);

  @override
  List<Object> get props => [id];
}

final class CommentDraftByUniqueKeys extends CommentDraftKey {
  const CommentDraftByUniqueKeys({
    required this.parentId,
    required this.userId,
  });

  final String parentId;
  final String userId;

  @override
  Expression<bool> Function($CommentDraftsTable) get filter =>
      (draft) => draft.parentId.equals(parentId) & draft.userId.equals(userId);

  @override
  List<Object> get props => [
    parentId,
    userId,
  ];
}
