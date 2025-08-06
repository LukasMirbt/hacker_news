import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:provider/provider.dart';

class OtherUserReplyParent extends StatelessWidget {
  const OtherUserReplyParent(this.item, {super.key});

  final OtherUserReplyParentModel item;

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
          context.read<ReplyBloc>().add(
            const ReplyParentExpansionToggled(),
          );
        },
        onMorePressed: () {
          ReplyOptionsSheet.show(
            context: context,
            parent: item.toRepository(),
          );
        },
        onLinkPressed: (url) {
          context.read<ReplyBloc>().add(
            ReplyLinkPressed(url),
          );
        },
        onVotePressed: () {
          context.read<ReplyBloc>().add(
            ReplyParentVotePressed(item),
          );
        },
      ),
    );
  }
}
