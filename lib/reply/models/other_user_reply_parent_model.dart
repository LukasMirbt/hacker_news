part of 'reply_parent_model.dart';

class OtherUserReplyParentModel extends ReplyParentModel {
  const OtherUserReplyParentModel({
    required OtherUserReplyParent parent,
    super.isExpanded,
    super.formatter,
  }) : _parent = parent;

  @override
  final OtherUserReplyParent _parent;

  String get upvoteUrl => _parent.upvoteUrl;
  bool get hasBeenUpvoted => _parent.hasBeenUpvoted;

  OtherUserReplyParent toRepository() => _parent;

  OtherUserReplyParentModel vote(VoteType type) {
    return copyWith(
      parent: switch (type) {
        VoteType.upvote => _parent.upvote(),
        VoteType.unvote => _parent.unvote(),
      },
    );
  }

  @override
  OtherUserReplyParentModel copyWith({
    OtherUserReplyParent? parent,
    bool? isExpanded,
  }) {
    return OtherUserReplyParentModel(
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
