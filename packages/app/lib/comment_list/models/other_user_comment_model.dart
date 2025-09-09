part of 'comment_model.dart';

class OtherUserCommentModel extends CommentModel {
  const OtherUserCommentModel({
    required OtherUserComment comment,
    super.isExpanded,
    super.isParentExpanded,
    super.formatter,
  }) : _comment = comment;

  @override
  final OtherUserComment _comment;

  String get upvoteUrl => _comment.upvoteUrl;
  bool get hasBeenUpvoted => _comment.hasBeenUpvoted;

  @override
  OtherUserComment toRepository() => _comment;

  OtherUserCommentModel vote(VoteType type) {
    return copyWith(
      comment: switch (type) {
        VoteType.upvote => _comment.upvote(),
        VoteType.unvote => _comment.unvote(),
      },
    );
  }

  @override
  OtherUserCommentModel copyWith({
    OtherUserComment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return OtherUserCommentModel(
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
