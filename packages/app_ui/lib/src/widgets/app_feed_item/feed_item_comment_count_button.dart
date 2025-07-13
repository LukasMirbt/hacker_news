import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemCommentCountButton extends StatelessWidget {
  const FeedItemCommentCountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final visible = context.select(
      (AppFeedItemData data) => data.commentCount != null,
    );

    return InvisiblePlaceholder(
      visible: visible,
      child: const _Button(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final onCommentPressed = context.select(
      (AppFeedItemData data) => data.onCommentPressed,
    );

    return TextButton(
      onPressed: onCommentPressed,
      style: const ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(64, 48),
        ),
      ),
      child: const Row(
        spacing: 4,
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
    final colorScheme = ColorScheme.of(context);

    return Icon(
      Icons.mode_comment_outlined,
      size: 16,
      color: colorScheme.onSurfaceVariant,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final commentCount = context.select(
      (AppFeedItemData data) => data.commentCount,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Text(
      commentCount ?? '0',
      style: textTheme.bodySmall?.copyWith(
        height: 1,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
