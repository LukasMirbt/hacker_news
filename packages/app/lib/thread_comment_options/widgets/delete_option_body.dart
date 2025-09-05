import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:web_links/web_links.dart';

class DeleteOptionBody extends StatelessWidget {
  const DeleteOptionBody({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    return ListTile(
      textColor: colorScheme.error,
      iconColor: colorScheme.error,
      leading: const AppIcon(Symbols.delete_rounded),
      title: const Text('Delete'),
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(
            url: const WebLinks().resolve(url).toString(),
          ),
        );
      },
    );
  }
}
