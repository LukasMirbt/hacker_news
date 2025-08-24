import 'package:app/app_router/app_router.dart';
import 'package:app/feed/feed.dart';
import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
          AppRouter.of(context).goRelative(
            PostRoute(postId: item.id),
          );
        },
      ),
    );
  }
}
