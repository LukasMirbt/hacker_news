import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      centerTitle: true,
      shape: const Border(),
      title: Text(l10n.login_title),
    );
  }
}
