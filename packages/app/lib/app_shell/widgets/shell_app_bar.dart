import 'package:app/app_shell/app_shell.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select(
      (AuthenticationBloc bloc) => bloc.state.status.isAuthenticated,
    );

    final currentIndex = context.select(
      (StatefulNavigationShell shell) => shell.currentIndex,
    );

    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    final isHome = currentIndex == 0;

    ShapeBorder shape;

    if (!isHome) {
      shape = Border(
        bottom: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      );
    } else {
      shape = const Border();
    }

    return AppBar(
      leading: isAuthenticated ? const UserAvatar() : null,
      centerTitle: true,
      title: switch (currentIndex) {
        1 => Text(l10n.appShell_threads),
        2 => Text(l10n.appShell_drafts),
        3 => Text(l10n.appShell_settings),
        _ => const Logo(),
      },
      shape: shape,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.sm),
      actions: [
        if (!isAuthenticated) const ShellLoginButton(),
      ],
    );
  }
}
