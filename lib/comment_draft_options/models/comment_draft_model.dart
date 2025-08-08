import 'package:draft_repository/draft_repository.dart';
import 'package:equatable/equatable.dart';

class CommentDraftModel extends Equatable {
  const CommentDraftModel({
    required CommentDraft draft,
  }) : _draft = draft;

  final CommentDraft _draft;

  String get postId => _draft.postId;
  String get postTitle => _draft.postTitle;

  CommentDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
