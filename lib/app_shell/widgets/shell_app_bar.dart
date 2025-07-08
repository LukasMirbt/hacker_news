import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/authentication/authentication.dart';

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select(
      (AuthenticationBloc bloc) => bloc.state.status.isAuthenticated,
    );

    return AppBar(
      leading: isAuthenticated ? const UserAvatar() : null,
      centerTitle: true,
      title: const Logo(),
      actionsPadding: const EdgeInsets.only(right: AppSpacing.sm),
      actions: [
        if (!isAuthenticated) const LoginButton(),
      ],
    );
  }
}
