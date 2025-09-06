// ignore_for_file: annotate_overrides

import 'package:feed_api/feed_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item.freezed.dart';
part 'job_feed_item.dart';
part 'post_feed_item.dart';

sealed class FeedItem {
  const FeedItem();

  factory FeedItem.from(FeedItemData data) {
    return switch (data) {
      PostFeedItemData() => PostFeedItem.from(data),
      JobFeedItemData() => JobFeedItem.from(data),
    };
  }

  String get id;
  int get rank;
  String get title;
  String get url;
  String? get urlHost;
  DateTime get age;
}
