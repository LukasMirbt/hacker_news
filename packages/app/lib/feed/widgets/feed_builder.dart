import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';

class FeedBuilder {
  const FeedBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    return Column(
      children: [
        FeedItem(index),
        const Divider(height: 0),
      ],
    );
  }
}
