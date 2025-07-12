import 'package:equatable/equatable.dart';

class AppFeedItemData extends Equatable {
  const AppFeedItemData({
    required this.visited,
    required this.rank,
    required this.title,
    required this.age,
    required this.urlHost,
    required this.user,
    required this.onPressed,
    required this.score,
    required this.commentCount,
    required this.hasBeenUpvoted,
    required this.onVotePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.onMorePressed,
  });

  final bool visited;
  final String rank;
  final String title;
  final String age;
  final String? urlHost;
  final String? user;
  final void Function() onPressed;
  final String? score;
  final String? commentCount;
  final bool hasBeenUpvoted;
  final void Function() onVotePressed;
  final void Function() onCommentPressed;
  final void Function() onSharePressed;
  final void Function() onMorePressed;

  @override
  List<Object?> get props => [
    visited,
    rank,
    title,
    age,
    urlHost,
    user,
    onPressed,
    score,
    commentCount,
    hasBeenUpvoted,
    onVotePressed,
    onCommentPressed,
    onSharePressed,
    onMorePressed,
  ];
}
