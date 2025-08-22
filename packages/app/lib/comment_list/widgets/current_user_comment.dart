import 'package:app/comment_list/comment_list.dart';
import 'package:app/comment_options/comment_options.dart' hide CommentModel;
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserComment extends StatelessWidget {
  const CurrentUserComment(this.item, {super.key});

  final CurrentUserCommentModel item;

  @override
  Widget build(BuildContext context) {
    final formatterL10n = DateFormatterLocalizations.of(context);
    final appL10n = AppLocalizations.of(context);

    return AppCurrentUserComment(
      data: AppCurrentUserCommentData(
        isExpanded: item.isExpanded,
        user: item.user,
        age: item.age(appL10n, formatterL10n),
        htmlText: item.htmlText,
        score: item.score(appL10n),
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
      ),
    );
  }
}
