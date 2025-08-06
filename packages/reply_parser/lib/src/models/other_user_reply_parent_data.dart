part of 'reply_parent_data.dart';

class OtherUserReplyParentData extends ReplyParentData {
  const OtherUserReplyParentData({
    required super.base,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory OtherUserReplyParentData.fromParsed({
    required BaseReplyParentData base,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
  }) {
    return OtherUserReplyParentData(
      base: base,
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
    );
  }

  static final empty = OtherUserReplyParentData(
    base: BaseReplyParentData.empty,
    upvoteUrl: '',
    hasBeenUpvoted: false,
  );

  final String upvoteUrl;
  final bool hasBeenUpvoted;

  @override
  List<Object?> get props => [
    ...super.props,
    upvoteUrl,
    hasBeenUpvoted,
  ];
}
