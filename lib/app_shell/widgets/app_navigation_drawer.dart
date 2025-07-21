import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/generated/app_localizations.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/version/version.dart';

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (StatefulNavigationShell shell) => shell.currentIndex,
    );

    final l10n = AppLocalizations.of(context);

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        if (index == 1) {
          final isAuthenticated = context
              .read<AuthenticationBloc>()
              .state
              .status
              .isAuthenticated;

          if (!isAuthenticated) {
            LoginRoute(
              from: const ThreadFeedRoute().location,
            ).push<void>(context);
            return;
          }
        }

        context.read<StatefulNavigationShell>().goBranch(index);
        Scaffold.of(context).closeDrawer();
      },
      children: [
        const SizedBox(height: AppSpacing.xlg),
        for (final destination in AppDestination.values)
          NavigationDrawerDestination(
            icon: Icon(destination.icon),
            selectedIcon: Icon(destination.selectedIcon),
            label: Text(
              destination.label(l10n),
            ),
          ),
        const SizedBox(height: AppSpacing.lg),
        const Center(
          child: CurrentVersion(),
        ),
      ],
    );
  }
}
