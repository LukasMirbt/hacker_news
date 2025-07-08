import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _VoteButton(),
          _CommentCountButton(),
          _ShareButton(),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton();

  @override
  Widget build(BuildContext context) {
    final onSharePressed = context.select(
      (AppPostHeaderData data) => data.onSharePressed,
    );

    final colorScheme = ColorScheme.of(context);

    return IconButton(
      onPressed: onSharePressed,
      icon: Icon(
        Icons.share_outlined,
        size: 16,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _VoteButton extends StatelessWidget {
  const _VoteButton();

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppPostHeaderData data) => data.onVotePressed,
    );

    final score = context.select(
      (AppPostHeaderData data) => data.score,
    );

    final hasBeenUpvoted = context.select(
      (AppPostHeaderData data) => data.hasBeenUpvoted,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    Color color;
    FontVariation weight;

    if (hasBeenUpvoted) {
      color = colorScheme.onSurface;
      weight = const FontVariation.weight(700);
    } else {
      color = colorScheme.onSurfaceVariant;
      weight = const FontVariation.weight(500);
    }

    return InvisiblePlaceholder(
      visible: score != null,
      child: TextButton(
        onPressed: onVotePressed,
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(64, 48),
          ),
        ),
        child: Row(
          spacing: 4,
          children: [
            Icon(
              Icons.arrow_upward,
              size: 18,
              color: color,
            ),
            Text(
              score ?? '0',
              style: textTheme.bodySmall?.copyWith(
                height: 1,
                color: color,
                fontVariations: [weight],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentCountButton extends StatelessWidget {
  const _CommentCountButton();

  @override
  Widget build(BuildContext context) {
    final onCommentPressed = context.select(
      (AppPostHeaderData data) => data.onCommentPressed,
    );

    final commentCount = context.select(
      (AppPostHeaderData data) => data.commentCount,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return InvisiblePlaceholder(
      visible: commentCount != null,
      child: TextButton(
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
        child: Row(
          spacing: AppSpacing.xs,
          children: [
            Assets.images.chatAddOnIcon.image(
              width: 16,
              height: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            Text(
              commentCount ?? '0',
              style: textTheme.labelMedium?.copyWith(
                height: 1,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
