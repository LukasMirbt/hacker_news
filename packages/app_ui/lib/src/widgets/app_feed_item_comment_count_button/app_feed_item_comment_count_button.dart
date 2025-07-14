import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_feed_item_comment_count_button_data.dart';
export 'app_feed_item_comment_count_button_data_placeholder.dart';

class AppFeedItemCommentCountButton extends StatelessWidget {
  const AppFeedItemCommentCountButton({
    required this.data,
    super.key,
  });

  final AppFeedItemCommentCountButtonData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppFeedItemCommentCountButtonData data) => data.onPressed,
    );

    return TextButton(
      onPressed: onPressed,
      child: const Row(
        spacing: AppSpacing.xs,
        children: [
          _Icon(),
          _Text(),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.mode_comment_outlined,
      size: 16,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final commentCount = context.select(
      (AppFeedItemCommentCountButtonData data) => data.commentCount,
    );

    return Text(commentCount);
  }
}
