import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/generated/app_localizations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShellDrawer extends StatelessWidget {
  const ShellDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (StatefulNavigationShell shell) => shell.currentIndex,
    );

    final l10n = AppLocalizations.of(context);

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        final shell = context.read<StatefulNavigationShell>();
        AppRouter.of(context).goBranch(shell, index);
        Scaffold.of(context).closeDrawer();
      },
      children: [
        const SizedBox(height: AppSpacing.xlg),
        ShellDrawerDestination(
          data: AppDestination.home.data(l10n),
        ),
        const Divider(),
        ShellDrawerDestination(
          data: AppDestination.threads.data(l10n),
        ),
        ShellDrawerDestination(
          data: AppDestination.drafts.data(l10n),
        ),
        const Divider(),
        ShellDrawerDestination(
          data: AppDestination.settings.data(l10n),
        ),
      ],
    );
  }
}
