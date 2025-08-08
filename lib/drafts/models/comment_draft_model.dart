part of 'draft_model.dart';

class CommentDraftModel extends DraftModel {
  const CommentDraftModel({
    required CommentDraft draft,
  }) : _draft = draft;

  final CommentDraft _draft;

  String get title => _draft.content;
  String get subtitle => _draft.postTitle;

  CommentDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
