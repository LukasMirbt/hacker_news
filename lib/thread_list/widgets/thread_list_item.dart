import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListItem extends StatelessWidget {
  const ThreadListItem({
    required this.item,
    super.key,
  });

  final ThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    return AppThreadItem(
      data: AppThreadItemData(
        isExpanded: item.isExpanded,
        indent: item.indent,
        user: item.user,
        age: item.age(appL10n, formatterL10n),
        hasBeenUpvoted: item.hasBeenUpvoted,
        htmlText: item.htmlText,
        onHeaderPressed: () {
          context.read<ThreadListBloc>().add(
            ThreadListExpansionToggled(item),
          );
        },
        onMorePressed: () {},
        onLinkPressed: (url) {
          context.read<ThreadListBloc>().add(
            ThreadListLinkPressed(url),
          );
        },
        onVotePressed: () {},
      ),
    );
  }
}
