import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListItem extends StatelessWidget {
  const ThreadListItem({
    required this.item,
    super.key,
  });

  final ThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    final l10n = DateFormatterLocalizations.of(context);

    return const SizedBox.shrink();

    /*     return AppThreadListItem(
      data: AppThreadListItemData(
        isExpanded: true,
        indent: item.indent,
        onHeaderPressed: () {},
        user: item.user,
        age: item.age(l10n),
        score: item.score,
        hasBeenUpvoted: item.hasBeenUpvoted,
        htmlText: item.htmlText,
        onMorePressed: () {},
        onLinkPressed: (url) {
          context.read<ThreadListBloc>().add(
            ThreadListLinkPressed(url),
          );
        },
        onVotePressed: () {},
        onReplyPressed: () {},
        onSharePressed: () {},
      ),
    ); */
  }
}
