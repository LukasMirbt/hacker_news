import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:provider/provider.dart';

class OtherUserThreadComment extends StatelessWidget {
  const OtherUserThreadComment(this.item, {super.key});

  final OtherUserThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    final formatterL10n = DateFormatterLocalizations.of(context);
    final appL10n = AppLocalizations.of(context);

    return AppOtherUserComment(
      data: AppOtherUserCommentData(
        isExpanded: item.isExpanded,
        user: item.user,
        age: item.age(appL10n, formatterL10n),
        htmlText: item.htmlText,
        hasBeenUpvoted: item.hasBeenUpvoted,
        onHeaderPressed: () {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedExpansionToggled(item),
          );
        },
        onMorePressed: () {
          ThreadCommentOptionsSheet.show(
            context: context,
            comment: item.toRepository(),
          );
        },
        onLinkPressed: (url) {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedLinkPressed(url),
          );
        },
        onVotePressed: () {
          context.read<ThreadFeedBloc>().add(
            ThreadFeedVotePressed(item),
          );
        },
      ),
    );
  }
}
