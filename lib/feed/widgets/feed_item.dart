import 'package:app_ui/app_ui.dart'
    hide FeedItemCommentCountButton, FeedItemVoteButton;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:hacker_client/l10n/l10n.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    required this.item,
    super.key,
  });

  final FeedItemModel item;

  @override
  Widget build(BuildContext context) {
    final hasBeenVisited = context.select(
      (FeedBloc bloc) => bloc.state.hasBeenVisited(item),
    );

    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    final score = item.score;
    final commentCount = item.commentCount;

    return AppFeedItem(
      data: AppFeedItemData(
        hasBeenVisited: hasBeenVisited,
        rank: item.rank(appL10n),
        urlHost: item.urlHost,
        user: item.user,
        age: item.age(formatterL10n),
        title: item.title,
        onPressed: () {
          context.read<FeedBloc>().add(
            FeedItemPressed(item),
          );
        },
        onSharePressed: () {
          final text = item.shareText(appL10n);
          context.read<FeedBloc>().add(
            FeedItemSharePressed(text: text),
          );
        },
        onMorePressed: () {
          final item = this.item.toRepository();
          FeedItemOptionsRoute(item).go(context);
        },
        voteButton: score == null
            ? null
            : FeedItemVoteButton(
                score: score,
                item: item,
              ),
        commentCountButton: commentCount == null
            ? null
            : FeedItemCommentCountButton(
                commentCount: commentCount,
                item: item,
              ),
      ),
    );
  }
}
