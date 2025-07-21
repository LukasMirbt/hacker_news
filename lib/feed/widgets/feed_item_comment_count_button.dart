import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:hacker_client/post/post.dart';

class FeedItemCommentCountButton extends StatelessWidget {
  const FeedItemCommentCountButton({
    required this.commentCount,
    required this.item,
    super.key,
  });

  final String commentCount;
  final FeedItemModel item;

  @override
  Widget build(BuildContext context) {
    return AppFeedItemCommentCountButton(
      data: AppFeedItemCommentCountButtonData(
        commentCount: commentCount,
        onPressed: () {
          PostRoute(postId: item.id).push<void>(context);
        },
      ),
    );
  }
}
