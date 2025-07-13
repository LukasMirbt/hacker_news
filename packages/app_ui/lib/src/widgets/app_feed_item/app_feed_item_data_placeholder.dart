import 'package:app_ui/app_ui.dart';

class AppFeedItemDataPlaceholder extends AppFeedItemData {
  AppFeedItemDataPlaceholder({
    bool? visited,
    String? rank,
    String? title,
    String? age,
    String? urlHost,
    String? user,
    void Function()? onPressed,
    String? score,
    String? commentCount,
    bool? hasBeenUpvoted,
    void Function()? onVotePressed,
    void Function()? onCommentPressed,
    void Function()? onSharePressed,
    void Function()? onMorePressed,
  }) : super(
         visited: visited ?? true,
         rank: rank ?? 'rank',
         title: title ?? 'title',
         age: age ?? 'age',
         urlHost: urlHost ?? 'urlHost',
         user: user ?? 'user',
         onPressed: onPressed ?? () {},
         score: score ?? 'score',
         commentCount: commentCount ?? 'commentCount',
         hasBeenUpvoted: hasBeenUpvoted ?? true,
         onVotePressed: onVotePressed ?? () {},
         onCommentPressed: onCommentPressed ?? () {},
         onSharePressed: onSharePressed ?? () {},
         onMorePressed: onMorePressed ?? () {},
       );
}
