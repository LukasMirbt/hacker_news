import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/route/web_redirect_route.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class UserOptionBody extends StatelessWidget {
  const UserOptionBody({
    required this.user,
    super.key,
  });

  final String user;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.person_rounded),
      title: Text(user),
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(
            url:
                Uri.parse(
                  'https://news.ycombinator.com/user',
                ).replace(
                  queryParameters: {
                    'id': user,
                  },
                ),
          ),
        );
      },
    );
  }
}
