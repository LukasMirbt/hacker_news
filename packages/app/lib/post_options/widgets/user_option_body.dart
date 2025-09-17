import 'package:app/app_router/app_router.dart';
import 'package:app/web_redirect/route/web_redirect_route.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:web_links/web_links.dart';

class UserOptionBody extends StatelessWidget {
  const UserOptionBody({
    required this.user,
    this.links = const WebLinks(),
    super.key,
  });

  final String user;
  final WebLinks links;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppIcon(Symbols.person_rounded),
      title: Text(user),
      onTap: () {
        final url = links.userUrl(id: user);
        Navigator.of(context).pop();
        AppRouter.of(context).push(
          WebRedirectRoute(url: url),
        );
      },
    );
  }
}
