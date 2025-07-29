part of 'thread_comment_data.dart';

class OtherUserThreadCommentData extends ThreadCommentData {
  const OtherUserThreadCommentData({
    required super.base,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory OtherUserThreadCommentData.fromParsed({
    required BaseThreadCommentData base,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
  }) {
    return OtherUserThreadCommentData(
      base: base,
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
    );
  }

  final String upvoteUrl;
  final bool hasBeenUpvoted;

  @override
  List<Object?> get props => [
    ...super.props,
    upvoteUrl,
    hasBeenUpvoted,
  ];
}
