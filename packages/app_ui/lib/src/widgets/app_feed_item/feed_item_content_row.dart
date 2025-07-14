import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:provider/provider.dart';

class FeedItemContentRow extends StatelessWidget {
  const FeedItemContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6),
          child: SizedBox(
            width: 42,
            child: Center(
              child: FittedBox(
                child: _Rank(),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(right: AppSpacing.xlg),
            child: _TitleColumn(),
          ),
        ),
      ],
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

    final textTheme = TextTheme.of(context);

    return Text(
      rank,
      style: textTheme.titleMedium,
    );
  }
}

class _TitleColumn extends StatelessWidget {
  const _TitleColumn();

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppFeedItemData data) => data.onPressed,
    );

    return InkWell(
      onTap: onPressed,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          FeedItemTitle(),
          FeedItemSubtitle(),
        ],
      ),
    );
  }
}
