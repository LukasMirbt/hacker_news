import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
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
          final state = context.read<AuthenticationBloc>().state;
          final isAuthenticated = state.status.isAuthenticated;

          if (!isAuthenticated) {
            AppRouter.of(context).push(
              LoginRoute(
                from: const ThreadFeedRoute().location,
              ),
            );
            return;
          }
        }

        context.read<StatefulNavigationShell>().goBranch(index);
        Scaffold.of(context).closeDrawer();
      },
      children: [
        const SizedBox(height: AppSpacing.xlg),
        _Destination(AppDestination.home, l10n),
        const Divider(),
        _Destination(AppDestination.threads, l10n),
        _Destination(AppDestination.drafts, l10n),
        const Divider(),
        _Destination(AppDestination.settings, l10n),
        const SizedBox(height: AppSpacing.lg),
        const Center(
          child: CurrentVersion(),
        ),
      ],
    );
  }
}

class _Destination extends NavigationDrawerDestination {
  _Destination(
    AppDestination value,
    AppLocalizations l10n,
  ) : super(
        icon: Icon(value.icon),
        selectedIcon: Icon(value.selectedIcon),
        label: Text(
          value.label(l10n),
        ),
      );
}
