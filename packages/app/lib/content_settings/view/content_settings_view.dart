import 'package:app/content_settings/content_settings.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ContentSettingsView extends StatelessWidget {
  const ContentSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: ContentSettingsBody(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.contentSettings_title),
    );
  }
}
