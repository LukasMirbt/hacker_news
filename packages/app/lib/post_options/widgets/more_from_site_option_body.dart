import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/route/web_redirect_route.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:web_links/web_links.dart';

class MoreFromSiteOptionBody extends StatelessWidget {
  const MoreFromSiteOptionBody({
    required this.urlHost,
    this.links = const WebLinks(),
    super.key,
  });

  final String urlHost;
  final WebLinks links;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.folder_rounded),
      title: Text(l10n.postOptions_moreFromSite),
      subtitle: Text(urlHost),
      onTap: () {
        final url = links.fromUrl(site: urlHost);
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(url: url),
        );
      },
    );
  }
}
