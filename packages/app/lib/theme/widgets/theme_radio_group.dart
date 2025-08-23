import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeRadioGroup extends StatelessWidget {
  const ThemeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final groupValue = context.select(
      (ThemeBloc bloc) => bloc.state.mode,
    );

    return RadioGroup(
      groupValue: groupValue,
      onChanged: (value) {
        if (value != null) {
          context.read<ThemeBloc>().add(
            ThemeOptionPressed(value),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final mode in ThemeMode.values) ThemeRadioOption(mode),
        ],
      ),
    );
  }
}
