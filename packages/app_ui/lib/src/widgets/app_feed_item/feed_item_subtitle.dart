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

    return DefaultTextStyle.merge(
      style: textTheme.labelMedium,
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
