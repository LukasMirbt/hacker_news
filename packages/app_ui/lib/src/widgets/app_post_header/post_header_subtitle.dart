import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderSubtitle extends StatelessWidget {
  const PostHeaderSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    final urlHost = context.select(
      (AppPostHeaderData data) => data.urlHost,
    );

    final user = context.select(
      (AppPostHeaderData data) => data.user,
    );

    final age = context.select(
      (AppPostHeaderData data) => data.age,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppUiLocalizations.of(context);

    return Text.rich(
      style: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
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
