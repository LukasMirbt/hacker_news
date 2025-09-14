import 'package:app/app_shell/app_shell.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select(
      (AuthenticationBloc bloc) => bloc.state.status.isAuthenticated,
    );

    final hasBorder = context.select(
      (AppShellModel model) => model.appBar.hasBorder,
    );

    final l10n = AppLocalizations.of(context);

    final title = context.select(
      (AppShellModel model) => model.appBar.title(l10n),
    );

    final colorScheme = ColorScheme.of(context);

    final shape = hasBorder
        ? Border(
            bottom: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          )
        : const Border();

    return AppBar(
      shape: shape,
      centerTitle: true,
      title: title != null ? Text(title) : const Logo(),
      actions: [
        if (isAuthenticated) const UserAvatar() else const ShellLoginButton(),
      ],
    );
  }
}
