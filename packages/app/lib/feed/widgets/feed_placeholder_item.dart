import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';

class FeedPlaceholderItem extends StatelessWidget {
  const FeedPlaceholderItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return PostFeedItem(
      PostFeedItemModelPlaceholder(index),
    );
  }
}
