import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// TODO(LukasMirbt): Set resizeToAvoidBottomInsets for SearchPage
// to avoid action bar moving above keyboard.

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ShellBackButtonListener(
      child: Scaffold(
        drawer: const ShellDrawer(),
        appBar: const ShellAppBar(),
        body: context.watch<StatefulNavigationShell>(),
      ),
    );
  }
}
