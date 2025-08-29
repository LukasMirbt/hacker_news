import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/generated/app_localizations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShellDrawer extends StatelessWidget {
  const ShellDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (AppShellModel model) => model.drawer.selectedIndex,
    );

    final l10n = AppLocalizations.of(context);

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        final shell = context.read<AppShellModel>().shell;
        AppRouter.of(context).goBranch(shell, index);
        Scaffold.of(context).closeDrawer();
      },
      children: [
        const SizedBox(height: AppSpacing.xlg),
        ShellDrawerDestination.from(
          destination: AppDestination.home,
          l10n: l10n,
        ),
        ShellDrawerDestination.from(
          destination: AppDestination.search,
          l10n: l10n,
        ),
        const Divider(),
        ShellDrawerDestination.from(
          destination: AppDestination.threads,
          l10n: l10n,
        ),
        ShellDrawerDestination.from(
          destination: AppDestination.drafts,
          l10n: l10n,
        ),
        const Divider(),
        ShellDrawerDestination.from(
          destination: AppDestination.settings,
          l10n: l10n,
        ),
      ],
    );
  }
}
