import 'package:draft_repository/draft_repository.dart';
import 'package:equatable/equatable.dart';

class ReplyDraftModel extends Equatable {
  const ReplyDraftModel({
    required ReplyDraft draft,
  }) : _draft = draft;

  final ReplyDraft _draft;

  ReplyDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
