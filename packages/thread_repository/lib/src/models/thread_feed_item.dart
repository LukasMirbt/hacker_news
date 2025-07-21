// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread_repository/thread_repository.dart';

part 'thread_feed_item.freezed.dart';

@freezed
class ThreadFeedItem with _$ThreadFeedItem {
  const ThreadFeedItem({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.indent,
    required this.score,
    required this.hasBeenUpvoted,
    required this.upvoteUrl,
    required this.parentUrl,
    required this.contextUrl,
    required this.onUrl,
    required this.replyUrl,
  });

  factory ThreadFeedItem.from(ThreadFeedItemData data) {
    return ThreadFeedItem(
      id: data.id,
      hnuser: data.hnuser,
      age: data.age,
      htmlText: data.htmlText,
      indent: data.indent,
      score: data.score,
      hasBeenUpvoted: data.hasBeenUpvoted,
      upvoteUrl: data.upvoteUrl,
      parentUrl: data.parentUrl,
      contextUrl: data.contextUrl,
      onUrl: data.onUrl,
      replyUrl: data.replyUrl,
    );
  }

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final int indent;
  final int? score;
  final bool? hasBeenUpvoted;
  final String? upvoteUrl;
  final String? parentUrl;
  final String? contextUrl;
  final String? onUrl;
  final String? replyUrl;

  ThreadFeedItem upvote() => copyWith(hasBeenUpvoted: true);

  ThreadFeedItem unvote() => copyWith(hasBeenUpvoted: false);
}
