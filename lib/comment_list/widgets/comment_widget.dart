import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart';
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
        htmlText: item.htmlText,
        hasBeenUpvoted: item.hasBeenUpvoted,
        onHeaderPressed: () {
          context.read<CommentListBloc>().add(
            CommentListExpansionToggled(item),
          );
        },
        onMorePressed: () {
          final state = context.read<PostHeaderBloc>().state;
          CommentOptionsRoute(
            postId: state.id,
            commentId: item.id,
          ).go(context);
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
