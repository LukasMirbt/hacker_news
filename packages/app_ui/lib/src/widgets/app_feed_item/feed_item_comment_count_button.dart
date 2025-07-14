import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemCommentCountButton extends StatelessWidget {
  const FeedItemCommentCountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final commentCountButtonData = context.select(
      (AppFeedItemData data) => data.commentCountButtonData,
    );

    if (commentCountButtonData == null) {
      return const FeedItemButtonPlaceholder();
    }

    return AppFeedItemCommentCountButton(data: commentCountButtonData);
  }
}
