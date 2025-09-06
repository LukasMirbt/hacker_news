import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    final resizeToAvoidBottomInset = context.select(
      (AppShellModel model) => model.resizeToAvoidBottomInset,
    );

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      drawer: const ShellDrawer(),
      appBar: const ShellAppBar(),
      body: const _Shell(),
    );
  }
}

class _Shell extends StatelessWidget {
  const _Shell();

  @override
  Widget build(BuildContext context) {
    final shell = context.select(
      (AppShellModel model) => model.shell,
    );

    return shell;
  }
}
