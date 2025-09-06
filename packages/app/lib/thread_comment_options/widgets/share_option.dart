import 'package:app/l10n/l10n.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareOption extends StatelessWidget {
  const ShareOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.share_rounded),
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
