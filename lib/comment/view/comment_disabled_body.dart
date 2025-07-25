import 'package:app_ui/app_ui.dart' hide CommentHtml;
import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentDisabledBody extends StatelessWidget {
  const CommentDisabledBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentTitle(),
            SizedBox(height: AppSpacing.lg),
            Divider(height: 1),
            Expanded(
              child: Center(
                child: _Explanation(),
              ),
            ),
          ],
        ),
      ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
