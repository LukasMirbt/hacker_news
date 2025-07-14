import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemCommentCountButton extends StatelessWidget {
  const FeedItemCommentCountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final commentCountButton = context.select(
      (AppFeedItemData data) => data.commentCountButton,
    );

    if (commentCountButton != null) return commentCountButton;

    return const FeedItemButtonPlaceholder();
  }
}
