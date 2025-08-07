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
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;

  @override
  Expression<bool> Function($CommentDraftsTable) get filter =>
      (draft) => draft.postId.equals(postId) & draft.userId.equals(userId);

  @override
  List<Object> get props => [postId, userId];
}
