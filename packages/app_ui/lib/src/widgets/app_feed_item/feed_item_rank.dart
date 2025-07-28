import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemRank extends StatelessWidget {
  const FeedItemRank({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 42,
      child: Center(
        child: FittedBox(
          child: _Rank(),
        ),
      ),
    );
  }
}

class _Rank extends StatelessWidget {
  const _Rank();

  @override
  Widget build(BuildContext context) {
    final rank = context.select(
      (AppFeedItemData data) => data.rank,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    final style = context.select(
      (AppFeedItemData data) => data.rankStyle(colorScheme, textTheme),
    );

    return Text(
      rank,
      style: style,
    );
  }
}
