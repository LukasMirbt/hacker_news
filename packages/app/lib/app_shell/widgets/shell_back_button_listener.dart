import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShellBackButtonListener extends StatelessWidget {
  const ShellBackButtonListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () async {
        final canPop = GoRouter.of(context).canPop();
        if (canPop) return false;

        final shell = context.read<AppShellModel>().shell;

        if (shell.currentIndex != 0) {
          shell.goBranch(0);
          return true;
        }

        return false;
      },
      child: child,
    );
  }
}
