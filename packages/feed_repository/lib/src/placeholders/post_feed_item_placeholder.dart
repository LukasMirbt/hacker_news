import 'package:feed_repository/feed_repository.dart';

class PostFeedItemPlaceholder extends PostFeedItem {
  PostFeedItemPlaceholder({
    String? id,
    int? rank,
    String? title,
    String? url,
    String? urlHost,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    int? score,
    Hnuser? hnuser,
    int? commentCount,
    DateTime? age,
  }) : super(
         id: id ?? 'id',
         rank: rank ?? 1,
         title: title ?? 'title',
         url: url ?? 'url',
         urlHost: urlHost ?? 'urlHost',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         commentCount: commentCount ?? 1,
         age: age ?? DateTime(1),
       );
}
