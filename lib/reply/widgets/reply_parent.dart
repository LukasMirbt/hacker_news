import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:hacker_client/reply_options/reply_options.dart';

class ReplyParent extends StatelessWidget {
  const ReplyParent({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (ReplyBloc bloc) => bloc.state.parent.isExpanded,
    );

    final user = context.select(
      (ReplyBloc bloc) => bloc.state.parent.user,
    );

    final appL10n = AppLocalizations.of(context);
    final formatterL10n = DateFormatterLocalizations.of(context);

    final age = context.select(
      (ReplyBloc bloc) => bloc.state.parent.age(appL10n, formatterL10n),
    );

    final hasBeenUpvoted = context.select(
      (ReplyBloc bloc) => bloc.state.parent.hasBeenUpvoted,
    );

    final htmlText = context.select(
      (ReplyBloc bloc) => bloc.state.parent.htmlText,
    );

    return AppOtherUserComment(
      data: AppOtherUserCommentData(
        isExpanded: isExpanded,
        user: user,
        age: age,
        hasBeenUpvoted: hasBeenUpvoted,
        htmlText: htmlText,
        onHeaderPressed: () {
          context.read<ReplyBloc>().add(
            const ReplyParentExpansionToggled(),
          );
        },
        onMorePressed: () {
          final state = context.read<ReplyBloc>().state;
          ReplyOptionsSheet.show(
            context: context,
            parent: state.parent.toRepository(),
          );
        },
        onLinkPressed: (url) {
          context.read<ReplyBloc>().add(
            ReplyLinkPressed(url),
          );
        },
        onVotePressed: () {
          context.read<ReplyBloc>().add(
            const ReplyParentVotePressed(),
          );
        },
      ),
    );
  }
}
