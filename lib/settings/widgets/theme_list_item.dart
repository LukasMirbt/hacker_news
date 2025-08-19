import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/settings/settings.dart';

class ThemeListItem extends StatelessWidget {
  const ThemeListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const ThemeListItemLeading(),
      title: Text(l10n.settings_theme),
      trailing: const AppIcon(Symbols.chevron_right_rounded),
      onTap: () {
        AppRouter.of(context).go(
          const ThemeRoute(),
        );
      },
    );
  }
}
