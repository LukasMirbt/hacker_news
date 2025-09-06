import 'package:app/l10n/l10n.dart';
import 'package:app/version/version.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Text(l10n.about_version),
          ),
          SelectableText(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
