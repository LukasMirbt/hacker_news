import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostHeaderActionRow extends StatelessWidget {
  const PostHeaderActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: const Size(64, 48),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            alignment: Alignment.centerLeft,
            foregroundColor: theme.colorScheme.onSurfaceVariant,
            textStyle: theme.textTheme.bodySmall,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 10, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostHeaderVoteButton(),
            PostHeaderCommentButton(),
            PostHeaderShareButton(),
          ],
        ),
      ),
    );
  }
}
