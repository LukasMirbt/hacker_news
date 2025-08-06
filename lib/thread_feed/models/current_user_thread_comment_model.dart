part of 'thread_comment_model.dart';

class CurrentUserThreadCommentModel extends ThreadCommentModel {
  const CurrentUserThreadCommentModel({
    required CurrentUserThreadComment comment,
    super.isExpanded,
    super.isParentExpanded,
    super.formatter,
  }) : _comment = comment;

  @override
  final CurrentUserThreadComment _comment;

  CurrentUserThreadComment toRepository() => _comment;

  String score(AppLocalizations l10n) {
    return l10n.commentList_score(
      score: _comment.score,
    );
  }

  @override
  CurrentUserThreadCommentModel copyWith({
    CurrentUserThreadComment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return CurrentUserThreadCommentModel(
      formatter: _formatter,
      comment: comment ?? _comment,
      isExpanded: isExpanded ?? this.isExpanded,
      isParentExpanded: isParentExpanded ?? this.isParentExpanded,
    );
  }

  @override
  List<Object> get props => [
    _comment,
    ...super.props,
  ];
}
