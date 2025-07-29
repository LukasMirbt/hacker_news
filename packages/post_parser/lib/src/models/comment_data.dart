import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

sealed class CommentData extends Equatable {
  const CommentData({
    required this.base,
  });

  final BaseCommentData base;

  @override
  List<Object?> get props => [base];
}

class CurrentUserCommentData extends CommentData {
  const CurrentUserCommentData({
    required super.base,
    required this.score,
  });

  factory CurrentUserCommentData.fromParsed({
    required BaseCommentData base,
    required int? score,
  }) {
    return CurrentUserCommentData(
      base: base,
      score: score ?? 0,
    );
  }

  final int score;

  @override
  List<Object?> get props => [
    score,
    ...super.props,
  ];
}

class OtherUserCommentData extends CommentData {
  const OtherUserCommentData({
    required super.base,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
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
    ...super.props,
    upvoteUrl,
    hasBeenUpvoted,
  ];
}
