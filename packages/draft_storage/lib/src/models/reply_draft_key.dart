import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

sealed class ReplyDraftKey extends Equatable {
  const ReplyDraftKey();

  Expression<bool> Function($ReplyDraftsTable) get filter;
}

class ReplyDraftById extends ReplyDraftKey {
  const ReplyDraftById(this.id);

  final int id;

  @override
  Expression<bool> Function($ReplyDraftsTable) get filter =>
      (draft) => draft.id.equals(id);

  @override
  List<Object> get props => [id];
}

class ReplyDraftByUniqueKeys extends ReplyDraftKey {
  const ReplyDraftByUniqueKeys({
    required this.parentId,
    required this.userId,
  });

  final String parentId;
  final String userId;

  @override
  Expression<bool> Function($ReplyDraftsTable) get filter =>
      (draft) => draft.parentId.equals(parentId) & draft.userId.equals(userId);

  @override
  List<Object> get props => [
    parentId,
    userId,
  ];
}
