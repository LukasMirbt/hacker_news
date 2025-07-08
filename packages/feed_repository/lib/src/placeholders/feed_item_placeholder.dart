import 'package:feed_repository/feed_repository.dart';

class FeedItemPlaceholder extends FeedItem {
  FeedItemPlaceholder({
    String? id,
    int? rank,
    String? title,
    String? url,
    String? urlHost,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    int? score,
    Hnuser? hnuser,
    DateTime? age,
    int? commentCount,
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
         age: age ?? DateTime(1),
         commentCount: commentCount ?? 1,
       );
}
