part of 'draft_model.dart';

class ReplyDraftModel extends DraftModel {
  const ReplyDraftModel({
    required ReplyDraft draft,
  }) : _draft = draft;

  final ReplyDraft _draft;

  String get title => _draft.content;
  String get subtitle => 'subtitle';
  String get url => _draft.url;

  ReplyDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
