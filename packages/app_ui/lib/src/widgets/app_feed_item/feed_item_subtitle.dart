import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemSubtitle extends StatelessWidget {
  const FeedItemSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    final urlHost = context.select(
      (AppFeedItemData data) => data.urlHost,
    );

    final user = context.select(
      (AppFeedItemData data) => data.user,
    );

    final age = context.select(
      (AppFeedItemData data) => data.age,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppUiLocalizations.of(context);

    return Text.rich(
      style: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      TextSpan(
        children: [
          if (urlHost != null) ...[
            TextSpan(
              text: urlHost,
            ),
            TextSpan(text: l10n.separator),
          ],
          if (user != null) ...[
            TextSpan(
              text: user,
            ),
            TextSpan(text: l10n.separator),
          ],
          TextSpan(
            text: age,
          ),
        ],
      ),
    );
  }
}
