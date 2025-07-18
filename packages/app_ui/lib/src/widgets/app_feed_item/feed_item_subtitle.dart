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

    final textTheme = TextTheme.of(context);
    final l10n = AppUiLocalizations.of(context);

    return Text.rich(
      style: textTheme.labelMedium,
      TextSpan(
        children: [
          if (urlHost != null) ...[
            TextSpan(text: urlHost),
            MiddleDotSpan(l10n: l10n),
          ],
          if (user != null) ...[
            TextSpan(text: user),
            MiddleDotSpan(l10n: l10n),
          ],
          TextSpan(text: age),
        ],
      ),
    );
  }
}
