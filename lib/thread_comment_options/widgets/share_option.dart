import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';

class ShareOption extends StatelessWidget {
  const ShareOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Icons.share),
      title: Text(l10n.threadCommentOptions_share),
      onTap: () {
        Navigator.of(context).pop();
        context.read<ThreadCommentOptionsBloc>().add(
          const ThreadCommentOptionsSharePressed(),
        );
      },
    );
  }
}
