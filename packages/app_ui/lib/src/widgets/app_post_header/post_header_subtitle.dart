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

    return DefaultTextStyle.merge(
      style: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      child: Row(
        children: [
          if (urlHost != null) ...[
            Text(urlHost),
            const TextSeparator(),
          ],
          if (user != null) ...[
            Text(user),
            const TextSeparator(),
          ],
          Text(age),
        ],
      ),
    );
  }
}
