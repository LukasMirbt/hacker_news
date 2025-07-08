import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class OpenOnWebOption extends StatelessWidget {
  const OpenOnWebOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Icons.open_in_browser),
      title: Text(l10n.commentOptions_openOnWeb),
      onTap: () {
        final state = context.read<CommentOptionsBloc>().state;
        final url = state.comment.webRedirect.urlString;
        WebRedirectRoute(url: url).pushReplacement(context);
      },
    );
  }
}
