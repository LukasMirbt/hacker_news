import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final onHeaderPressed = context.select(
      (AppCommentData data) => data.onHeaderPressed,
    );

    return InkWell(
      onTap: onHeaderPressed,
      child: const Padding(
        padding: EdgeInsets.only(left: 6, right: 4),
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              _VoteButton(),
              _UserAndAge(),
              Spacer(),
              _MoreButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAndAge extends StatelessWidget {
  const _UserAndAge();

  @override
  Widget build(BuildContext context) {
    final age = context.select(
      (AppCommentData data) => data.age,
    );

    final user = context.select(
      (AppCommentData data) => data.user,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final extendedTextTheme = ExtendedTextTheme.of(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: user,
            style: extendedTextTheme.labelMediumProminent?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8),
          ),
          TextSpan(
            text: age,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _VoteButton extends StatelessWidget {
  const _VoteButton();

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppCommentData data) => data.onVotePressed,
    );

    final hasBeenUpvoted = context.select(
      (AppCommentData data) => data.hasBeenUpvoted,
    );

    final colorScheme = ColorScheme.of(context);

    double size;
    Color color;

    if (hasBeenUpvoted) {
      size = 20;
      color = colorScheme.onSurface;
    } else {
      size = 18;
      color = colorScheme.onSurfaceVariant;
    }

    return IconButton(
      onPressed: onVotePressed,
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(
          Size(44, 44),
        ),
      ),
      icon: Icon(
        Icons.arrow_upward,
        size: size,
        color: color,
      ),
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton();

  @override
  Widget build(BuildContext context) {
    final onMorePressed = context.select(
      (AppCommentData data) => data.onMorePressed,
    );

    return IconButton(
      onPressed: onMorePressed,
      icon: const Icon(
        Icons.more_vert,
        size: 16,
      ),
    );
  }
}
