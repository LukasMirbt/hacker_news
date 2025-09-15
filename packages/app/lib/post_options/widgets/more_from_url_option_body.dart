import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/route/web_redirect_route.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MoreFromUrlOptionBody extends StatelessWidget {
  const MoreFromUrlOptionBody({
    required this.urlHost,
    super.key,
  });

  final String urlHost;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.folder_rounded),
      title: Text('From $urlHost'),
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(
            url:
                Uri.parse(
                  'https://news.ycombinator.com/from',
                ).replace(
                  queryParameters: {
                    'site': urlHost,
                  },
                ),
          ),
        );
      },
    );
  }
}
