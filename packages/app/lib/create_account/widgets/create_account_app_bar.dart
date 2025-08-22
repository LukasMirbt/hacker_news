import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CreateAccountAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CreateAccountAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      centerTitle: true,
      shape: const Border(),
      title: Text(l10n.createAccount_title),
    );
  }
}
