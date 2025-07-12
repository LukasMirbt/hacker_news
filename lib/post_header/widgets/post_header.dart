import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final visited = context.select(
      (PostHeaderBloc bloc) => bloc.state.visited,
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

    final commentCount = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.commentCount,
    );

    final htmlText = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.htmlText,
    );

    final hasBeenUpvoted = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.hasBeenUpvoted,
    );

    return AppPostHeader(
      data: AppPostHeaderData(
        visited: visited,
        title: title,
        age: age,
        urlHost: urlHost,
        user: user,
        score: score,
        commentCount: commentCount,
        hasBeenUpvoted: hasBeenUpvoted,
        htmlText: htmlText,
        onTextLinkPressed: (url) {
          context.read<PostHeaderBloc>().add(
            PostHeaderTextLinkPressed(url),
          );
        },
        onPressed: () {
          context.read<PostHeaderBloc>().add(
            const PostHeaderPressed(),
          );
        },
        onVotePressed: () {
          context.read<PostHeaderBloc>().add(
            const PostHeaderVotePressed(),
          );
        },
        onCommentPressed: () {
          final state = context.read<PostHeaderBloc>().state;
          final postId = state.id;
          CommentFormRoute(postId: postId).go(context);
        },
        onSharePressed: () {
          final bloc = context.read<PostHeaderBloc>();
          final l10n = AppLocalizations.of(context);
          final text = bloc.state.header.shareText(l10n);
          context.read<PostHeaderBloc>().add(
            PostHeaderSharePressed(text: text),
          );
        },
      ),
    );
  }
}
