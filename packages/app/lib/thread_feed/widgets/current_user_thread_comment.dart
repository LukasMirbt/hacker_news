import 'package:app/l10n/l10n.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CurrentUserThreadComment extends StatelessWidget {
  const CurrentUserThreadComment(this.item, {super.key});

  final CurrentUserThreadCommentModel item;

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
      ),
    );
  }
}
