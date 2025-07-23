import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:material_symbols_icons/symbols.dart';

class OpenOnWebOption extends StatelessWidget {
  const OpenOnWebOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Symbols.open_in_browser),
      title: Text(l10n.threadItemOptions_openOnWeb),
      onTap: () {
        final state = context.read<ThreadItemOptionsBloc>().state;
        final url = state.item.webRedirect.urlString;
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(url: url),
        );
      },
    );
  }
}
