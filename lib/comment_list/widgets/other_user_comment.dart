import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/comment_options/comment_options.dart'
    hide CommentModel;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:provider/provider.dart';

class OtherUserComment extends StatelessWidget {
  const OtherUserComment(this.item, {super.key});

  final OtherUserCommentModel item;

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
          context.read<CommentListBloc>().add(
            CommentListExpansionToggled(item),
          );
        },
        onMorePressed: () {
          CommentOptionsSheet.show(
            context: context,
            comment: item.toRepository(),
          );
        },
        onLinkPressed: (url) {
          context.read<CommentListBloc>().add(
            CommentListLinkPressed(url),
          );
        },
        onVotePressed: () {
          context.read<CommentListBloc>().add(
            CommentListVotePressed(item),
          );
        },
      ),
    );
  }
}
