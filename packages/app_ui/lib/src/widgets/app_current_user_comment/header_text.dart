import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final score = context.select(
      (AppCurrentUserCommentData data) => data.score,
    );

    final age = context.select(
      (AppCurrentUserCommentData data) => data.age,
    );

    final user = context.select(
      (AppCurrentUserCommentData data) => data.user,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final extendedTextTheme = ExtendedTextTheme.of(context);
    final l10n = AppUiLocalizations.of(context);

    final ageStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    final scoreStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface,
    );

    final prominentStyle = extendedTextTheme.labelMediumProminent?.copyWith(
      color: colorScheme.primary,
    );

    return Text.rich(
      style: ageStyle,
      TextSpan(
        children: [
          TextSpan(
            text: score,
            style: scoreStyle,
          ),
          MiddleDotSpan(l10n: l10n),
          TextSpan(
            text: user,
            style: prominentStyle,
          ),
          MiddleDotSpan(l10n: l10n),
          TextSpan(text: age),
        ],
      ),
    );
  }
}
