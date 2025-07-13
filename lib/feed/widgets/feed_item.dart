import 'package:app_ui/app_ui.dart';
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
    final visited = context.select(
      (FeedBloc bloc) => bloc.state.visited(item),
    );

    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    return AppFeedItem(
      data: AppFeedItemData(
        visited: visited,
        rank: item.rank(appL10n),
        urlHost: item.urlHost,
        user: item.user,
        age: item.age(formatterL10n),
        title: item.title,
        hasBeenUpvoted: item.hasBeenUpvoted,
        score: item.score,
        commentCount: item.commentCount,
        onPressed: () {
          context.read<FeedBloc>().add(
            FeedItemPressed(item),
          );
        },
        onVotePressed: () {
          context.read<FeedBloc>().add(
            FeedItemVotePressed(item),
          );
        },
        onCommentPressed: () {
          PostRoute(postId: item.id).go(context);
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
      ),
    );
  }
}
