import 'package:app_ui/app_ui.dart' hide CommentHtml;
import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentDisabledSection extends StatelessWidget {
  const CommentDisabledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.lg,
      children: [
        CommentTitle(),
        Divider(height: 1),
        _Explanation(),
      ],
    );
  }
}

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Column(
      spacing: AppSpacing.sm,
      children: [
        Text(
          l10n.comment_disabledExplanationTitle,
          style: textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          l10n.comment_disabledExplanationSubtitle,
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
