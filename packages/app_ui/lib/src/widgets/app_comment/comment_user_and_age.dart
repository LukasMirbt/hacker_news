import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentUserAndAge extends StatelessWidget {
  const CommentUserAndAge({super.key});

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
    final l10n = AppUiLocalizations.of(context);

    final regularStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    final prominentStyle = extendedTextTheme.labelMediumProminent?.copyWith(
      color: colorScheme.onSurface,
    );

    return Text.rich(
      style: regularStyle,
      TextSpan(
        children: [
          TextSpan(
            text: user,
            style: prominentStyle,
          ),
          MiddleDotSpan(
            l10n: l10n,
          ),
          TextSpan(
            text: age,
          ),
        ],
      ),
    );
  }
}
