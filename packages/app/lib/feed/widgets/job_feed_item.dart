import 'package:app/feed/feed.dart';
import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobFeedItem extends StatelessWidget {
  const JobFeedItem(this.item, {super.key});

  final JobFeedItemModel item;

  @override
  Widget build(BuildContext context) {
    final hasBeenVisited = context.select(
      (FeedBloc bloc) => bloc.state.hasBeenVisited(item),
    );

    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    return AppFeedItem(
      data: AppFeedItemData(
        user: null,
        voteButton: null,
        commentCountButton: null,
        hasBeenVisited: hasBeenVisited,
        rank: item.rank(appL10n),
        urlHost: item.urlHost,
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
      ),
    );
  }
}
