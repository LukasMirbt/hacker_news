import 'package:equatable/equatable.dart';

class AppPostHeaderData extends Equatable {
  const AppPostHeaderData({
    required this.visited,
    required this.title,
    required this.age,
    required this.urlHost,
    required this.user,
    required this.score,
    required this.commentCount,
    required this.hasBeenUpvoted,
    required this.htmlText,
    required this.onTextLinkPressed,
    required this.onPressed,
    required this.onVotePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
  });

  final bool visited;
  final String title;
  final String age;
  final String urlHost;
  final String? user;
  final String? htmlText;
  final void Function(String) onTextLinkPressed;
  final void Function() onPressed;
  final String? score;
  final String? commentCount;
  final bool hasBeenUpvoted;
  final void Function() onVotePressed;
  final void Function() onCommentPressed;
  final void Function() onSharePressed;

  @override
  List<Object?> get props => [
    visited,
    title,
    age,
    urlHost,
    user,
    htmlText,
    onTextLinkPressed,
    onPressed,
    score,
    commentCount,
    hasBeenUpvoted,
    onVotePressed,
    onCommentPressed,
    onSharePressed,
  ];
}
