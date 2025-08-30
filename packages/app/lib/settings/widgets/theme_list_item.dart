import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/settings/settings.dart';
import 'package:app/theme/theme.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
