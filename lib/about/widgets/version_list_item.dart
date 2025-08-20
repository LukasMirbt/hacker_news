import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/version/version.dart';

class VersionListItem extends StatelessWidget {
  const VersionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final label = context.select(
      (VersionBloc bloc) => bloc.state.version.label,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.build_rounded),
      title: Text(l10n.about_version),
      trailing: SelectableText(
        label,
        style: textTheme.labelLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
