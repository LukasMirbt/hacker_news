import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post_options/post_options.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenOnWebOption extends StatelessWidget {
  const OpenOnWebOption({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.open_in_browser_rounded),
      title: Text(l10n.postOptions_openOnWeb),
      onTap: () {
        final state = context.read<PostOptionsBloc>().state;
        final url = state.post.webRedirect.urlString;
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(url: url),
        );
      },
    );
  }
}
