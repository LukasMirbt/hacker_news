import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ReplyDisabledExplanation extends StatelessWidget {
  const ReplyDisabledExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Column(
      spacing: AppSpacing.sm,
      children: [
        Text(
          l10n.reply_disabledExplanationTitle,
          style: textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          l10n.reply_disabledExplanationSubtitle,
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
