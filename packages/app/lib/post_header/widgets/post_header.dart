import 'package:app/l10n/l10n.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart'
    hide PostHeaderCommentButton, PostHeaderVoteButton;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final hasBeenVisited = context.select(
      (PostHeaderBloc bloc) => bloc.state.hasBeenVisited,
    );

    final title = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.title,
    );

    final l10n = DateFormatterLocalizations.of(context);

    final age = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.age(l10n),
    );

    final urlHost = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.urlHost,
    );

    final user = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.user,
    );

    final score = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.score,
    );

    final htmlText = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.htmlText,
    );

    final commentCount = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.commentCount,
    );

    return AppPostHeader(
      data: AppPostHeaderData(
        hasBeenVisited: hasBeenVisited,
        title: title,
        age: age,
        urlHost: urlHost,
        user: user,
        htmlText: htmlText,
        onPressed: () {
          context.read<PostHeaderBloc>().add(
            const PostHeaderPressed(),
          );
        },
        onTextLinkPressed: (url) {
          context.read<PostHeaderBloc>().add(
            PostHeaderTextLinkPressed(url),
          );
        },
        onSharePressed: () {
          final bloc = context.read<PostHeaderBloc>();
          final l10n = AppLocalizations.of(context);
          final text = bloc.state.header.shareText(l10n);
          context.read<PostHeaderBloc>().add(
            PostHeaderSharePressed(text: text),
          );
        },
        voteButton: score == null
            ? null
            : PostHeaderVoteButton(
                score: score,
              ),
        commentButton: commentCount == null
            ? null
            : PostHeaderCommentButton(
                commentCount: commentCount,
              ),
      ),
    );
  }
}
