import 'package:flutter/material.dart';
import 'package:hacker_client/settings/settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsBody(),
    );
  }
}
