import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/content_settings/content_settings.dart';

class LinkLaunchModeRadioGroup extends StatelessWidget {
  const LinkLaunchModeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final groupValue = context.select(
      (ContentSettingsBloc bloc) => bloc.state.linkLaunchMode,
    );

    return RadioGroup(
      groupValue: groupValue,
      onChanged: (value) {
        if (value != null) {
          context.read<ContentSettingsBloc>().add(
            ContentSettingsLinkLaunchModeChanged(value),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final mode in LinkLaunchMode.values) LinkLaunchModeOption(mode),
        ],
      ),
    );
  }
}
