import 'package:app/app_router/app_router.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  const RecentSearchItem({
    required this.search,
    super.key,
  });

  final String search;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: AppSpacing.xlg,
        right: 10,
      ),
      leading: const AppIcon.filled(
        Symbols.history_rounded,
      ),
      title: Text(search),
      trailing: IconButton(
        onPressed: () {},
        icon: const AppIcon.filled(
          Symbols.close_small,
        ),
      ),
      onTap: () {
        AppRouter.of(context).push(
          WebRedirectRoute(
            $extra: UrlRedirect.from('https://hn.algolia.com/?q=$search'),
          ),
        );
      },
    );
  }
}
