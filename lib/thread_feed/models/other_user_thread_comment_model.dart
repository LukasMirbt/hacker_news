part of 'thread_comment_model.dart';

class OtherUserThreadCommentModel extends ThreadCommentModel {
  const OtherUserThreadCommentModel({
    required OtherUserThreadComment comment,
    super.isExpanded,
    super.isParentExpanded,
    super.formatter,
  }) : _comment = comment;

  @override
  final OtherUserThreadComment _comment;

  String get upvoteUrl => _comment.upvoteUrl;
  bool get hasBeenUpvoted => _comment.hasBeenUpvoted;

  OtherUserThreadComment toRepository() => _comment;

  OtherUserThreadCommentModel vote(VoteType type) {
    return copyWith(
      comment: switch (type) {
        VoteType.upvote => _comment.upvote(),
        VoteType.unvote => _comment.unvote(),
      },
    );
  }

  @override
  OtherUserThreadCommentModel copyWith({
    OtherUserThreadComment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return OtherUserThreadCommentModel(
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
