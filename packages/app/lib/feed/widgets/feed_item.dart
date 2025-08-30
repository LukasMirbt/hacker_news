import 'package:app/feed/feed.dart';
import 'package:app/feed_item_options/feed_item_options.dart'
    hide FeedItemModel;
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart'
    hide FeedItemCommentCountButton, FeedItemVoteButton;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final user = switch (item) {
      final PostFeedItemModel item => item.user,
      JobFeedItemModel() => null,
    };

    return AppFeedItem(
      data: AppFeedItemData(
        hasBeenVisited: hasBeenVisited,
        rank: item.rank(appL10n),
        urlHost: item.urlHost,
        user: user,
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
          FeedItemOptionsSheet.show(
            context: context,
            item: item.toRepository(),
          );
        },
        voteButton: switch (item) {
          final PostFeedItemModel item => FeedItemVoteButton(
            score: item.score,
            item: item,
          ),
          JobFeedItemModel() => null,
        },
        commentCountButton: switch (item) {
          final PostFeedItemModel item => FeedItemCommentCountButton(
            commentCount: item.commentCount,
            item: item,
          ),
          JobFeedItemModel() => null,
        },
      ),
    );
  }
}
