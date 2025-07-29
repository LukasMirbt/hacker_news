part of 'comment_model.dart';

class CurrentUserCommentModel extends CommentModel {
  const CurrentUserCommentModel({
    required CurrentUserComment comment,
    super.isExpanded,
    super.isParentExpanded,
    super.formatter,
  }) : _comment = comment;

  @override
  final CurrentUserComment _comment;

  CurrentUserComment toRepository() => _comment;

  String score(AppLocalizations l10n) {
    return l10n.threadFeed_score(
      score: _comment.score.toString(),
    );
  }

  @override
  CurrentUserCommentModel copyWith({
    CurrentUserComment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return CurrentUserCommentModel(
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
