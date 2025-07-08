import 'package:equatable/equatable.dart';

class AppCommentData extends Equatable {
  const AppCommentData({
    required this.isExpanded,
    required this.indent,
    required this.onHeaderPressed,
    required this.user,
    required this.age,
    required this.hasBeenUpvoted,
    required this.htmlText,
    required this.onMorePressed,
    required this.onLinkPressed,
    required this.onVotePressed,
  });

  final bool isExpanded;
  final int indent;
  final void Function() onHeaderPressed;
  final String user;
  final String age;
  final bool hasBeenUpvoted;
  final String htmlText;
  final void Function() onMorePressed;
  final void Function(String) onLinkPressed;
  final void Function() onVotePressed;

  @override
  List<Object> get props => [
    isExpanded,
    indent,
    onHeaderPressed,
    user,
    age,
    hasBeenUpvoted,
    htmlText,
    onMorePressed,
    onLinkPressed,
    onVotePressed,
  ];
}
