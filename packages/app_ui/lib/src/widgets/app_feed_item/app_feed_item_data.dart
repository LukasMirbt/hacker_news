// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_feed_item_data.freezed.dart';

@freezed
class AppFeedItemData with _$AppFeedItemData {
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
}
