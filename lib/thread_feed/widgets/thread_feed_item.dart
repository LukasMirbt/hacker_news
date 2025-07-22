import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';

class ThreadFeedItem extends StatelessWidget {
  const ThreadFeedItem({
    required this.item,
    super.key,
  });

  final ThreadFeedItemModel item;

  @override
  Widget build(BuildContext context) {
    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    return AppThreadFeedItem(
      data: AppThreadFeedItemData(
        isExpanded: item.isExpanded,
        indent: item.indent,
        user: item.user,
        age: item.age(appL10n, formatterL10n),
        hasBeenUpvoted: item.hasBeenUpvoted,
        htmlText: item.htmlText,
        onHeaderPressed: () {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedItemExpansionToggled(item),
          );
        },
        onMorePressed: () {
          /*          ThreadItemOptionsRoute(
            $extra: item.toRepository(),
          ).push<void>(context); */

          ThreadItemOptionsSheet.show(
            context: context,
            item: item.toRepository(),
          );
        },
        onLinkPressed: (url) {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedItemLinkPressed(url),
          );
        },
        onVotePressed: () {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedItemVotePressed(item),
          );
        },
      ),
    );
  }
}
