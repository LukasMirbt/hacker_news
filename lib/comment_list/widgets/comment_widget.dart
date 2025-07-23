import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/comment_options/comment_options.dart'
    hide CommentModel;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:provider/provider.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget(this.item, {super.key});

  final CommentModel item;

  @override
  Widget build(BuildContext context) {
    final formatterL10n = DateFormatterLocalizations.of(context);
    final appL10n = AppLocalizations.of(context);

    return AppComment(
      data: AppCommentData(
        isExpanded: item.isExpanded,
        indent: item.indent,
        user: item.user,
        age: item.age(appL10n, formatterL10n),
        hasBeenUpvoted: item.hasBeenUpvoted,
        htmlText: item.htmlText,
        onHeaderPressed: () {
          context.read<CommentListBloc>().add(
            CommentListExpansionToggled(item),
          );
        },
        onMorePressed: () {
          CommentOptionsSheet.show(
            context: context,
            comment: item.comment,
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
