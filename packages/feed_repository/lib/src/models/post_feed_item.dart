// ignore_for_file: annotate_overrides

part of 'feed_item.dart';

@freezed
class PostFeedItem extends FeedItem with _$PostFeedItem {
  const PostFeedItem({
    required this.id,
    required this.rank,
    required this.title,
    required this.url,
    required this.urlHost,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.score,
    required this.hnuser,
    required this.commentCount,
    required this.age,
  });

  factory PostFeedItem.from(PostFeedItemData data) {
    final titleRowData = data.titleRowData;
    final subtitleRowData = data.subtitleRowData;

    return PostFeedItem(
      id: titleRowData.base.id,
      rank: titleRowData.base.rank,
      title: titleRowData.base.title,
      url: titleRowData.base.url,
      urlHost: titleRowData.base.urlHost,
      hasBeenUpvoted: titleRowData.hasBeenUpvoted,
      upvoteUrl: titleRowData.upvoteUrl,
      score: subtitleRowData.score,
      hnuser: subtitleRowData.hnuser,
      commentCount: subtitleRowData.commentCount,
      age: subtitleRowData.age,
    );
  }

  final String id;
  final int rank;
  final String title;
  final String url;
  final String? urlHost;
  final String? upvoteUrl;
  final bool hasBeenUpvoted;
  final int score;
  final Hnuser hnuser;
  final int commentCount;
  final DateTime age;

  PostFeedItem upvote() {
    return copyWith(
      hasBeenUpvoted: true,
      score: score + 1,
    );
  }

  PostFeedItem unvote() {
    return copyWith(
      hasBeenUpvoted: false,
      score: score - 1,
    );
  }
}
