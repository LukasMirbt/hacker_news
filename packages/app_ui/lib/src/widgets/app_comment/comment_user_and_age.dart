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

    final prominentStyle = extendedTextTheme.labelMediumProminent?.copyWith(
      color: colorScheme.onSurface,
    );

    final regularStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    return Row(
      children: [
        Text(
          user,
          style: prominentStyle,
        ),
        TextSeparator(
          style: regularStyle,
        ),
        Text(
          age,
          style: regularStyle,
        ),
      ],
    );
  }
}
