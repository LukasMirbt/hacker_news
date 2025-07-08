import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/theme.dart';

class ThemeRadioOption extends StatelessWidget {
  const ThemeRadioOption(this.value, {super.key});

  final ThemeMode value;

  @override
  Widget build(BuildContext context) {
    final groupValue = context.select(
      (ThemeBloc bloc) => bloc.state.mode,
    );

    final l10n = AppLocalizations.of(context);
    final label = value.label(l10n);

    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      title: Text(label),
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        if (value != null) {
          context.read<ThemeBloc>().add(
            ThemeOptionPressed(value),
          );
        }
      },
    );
  }
}
