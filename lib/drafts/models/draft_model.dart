import 'package:draft_repository/draft_repository.dart';
import 'package:equatable/equatable.dart';

part 'comment_draft_model.dart';
part 'reply_draft_model.dart';

sealed class DraftModel extends Equatable {
  const DraftModel();

  factory DraftModel.from(Draft draft) {
    return switch (draft) {
      CommentDraft() => CommentDraftModel(draft: draft),
      ReplyDraft() => ReplyDraftModel(draft: draft),
    };
  }
}
