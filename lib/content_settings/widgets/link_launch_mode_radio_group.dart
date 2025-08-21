import 'package:flutter/material.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:link_launcher/link_launcher.dart';

class LinkLaunchModeRadioGroup extends StatelessWidget {
  const LinkLaunchModeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final mode in LinkLaunchMode.values)
          LinkLaunchModeRadioOption(mode),
      ],
    );
  }
}
