part of 'comment_data.dart';

class OtherUserCommentData extends CommentData {
  const OtherUserCommentData({
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required super.base,
  });

  factory OtherUserCommentData.fromParsed({
    required BaseCommentData base,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
  }) {
    return OtherUserCommentData(
      base: base,
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
    );
  }

  final String upvoteUrl;
  final bool hasBeenUpvoted;

  @override
  List<Object?> get props => [
    upvoteUrl,
    hasBeenUpvoted,
    ...super.props,
  ];
}
