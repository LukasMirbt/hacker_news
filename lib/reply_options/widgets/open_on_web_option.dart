import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class OpenOnWebOption extends StatelessWidget {
  const OpenOnWebOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Icons.open_in_browser),
      title: Text(l10n.replyOptions_openOnWeb),
      onTap: () {
        final state = context.read<ReplyOptionsBloc>().state;
        final url = state.parent.webRedirect.urlString;
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(url: url),
        );
      },
    );
  }
}
