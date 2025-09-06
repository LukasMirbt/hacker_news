import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem(this.item, {super.key});

  final FeedItemModel item;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      final PostFeedItemModel item => PostFeedItem(item),
      final JobFeedItemModel item => JobFeedItem(item),
    };
  }
}
