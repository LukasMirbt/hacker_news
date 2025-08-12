part of 'reply_parent_model.dart';

class CurrentUserReplyParentModel extends ReplyParentModel {
  const CurrentUserReplyParentModel({
    required CurrentUserReplyParent parent,
    super.isExpanded,
    super.formatter,
  }) : _parent = parent;

  @override
  final CurrentUserReplyParent _parent;

  @override
  CurrentUserReplyParent toRepository() => _parent;

  String score(AppLocalizations l10n) {
    return l10n.reply_score(
      score: _parent.score,
    );
  }

  @override
  CurrentUserReplyParentModel copyWith({
    CurrentUserReplyParent? parent,
    bool? isExpanded,
  }) {
    return CurrentUserReplyParentModel(
      formatter: _formatter,
      parent: parent ?? _parent,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object> get props => [
    _parent,
    ...super.props,
  ];
}
