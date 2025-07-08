// ignore_for_file: annotate_overrides

import 'package:feed_api/feed_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item.freezed.dart';

@freezed
class FeedItem with _$FeedItem {
  const FeedItem({
    required this.id,
    required this.rank,
    required this.title,
    required this.url,
    required this.urlHost,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.score,
    required this.hnuser,
    required this.age,
    required this.commentCount,
  });

  factory FeedItem.from(FeedItemData data) {
    final titleRowData = data.titleRowData;
    final subtitleRowData = data.subtitleRowData;

    return FeedItem(
      id: titleRowData.id,
      rank: titleRowData.rank,
      title: titleRowData.title,
      url: titleRowData.url,
      urlHost: titleRowData.urlHost,
      upvoteUrl: titleRowData.upvoteUrl,
      hasBeenUpvoted: titleRowData.hasBeenUpvoted,
      score: subtitleRowData.score,
      hnuser: subtitleRowData.hnuser,
      age: subtitleRowData.age,
      commentCount: subtitleRowData.commentCount,
    );
  }

  final String id;
  final int rank;
  final String title;
  final String url;
  final String? urlHost;
  final String? upvoteUrl;
  final bool hasBeenUpvoted;
  final int? score;
  final Hnuser? hnuser;
  final DateTime age;
  final int? commentCount;

  FeedItem upvote() {
    return copyWith(
      hasBeenUpvoted: true,
      score: (score ?? 0) + 1,
    );
  }

  FeedItem unvote() {
    return copyWith(
      hasBeenUpvoted: false,
      score: (score ?? 0) - 1,
    );
  }
}
