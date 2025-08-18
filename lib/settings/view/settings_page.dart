import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:link_launcher/link_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SettingsBloc(
        linkLauncher: context.read<LinkLauncher>(),
      ),
      child: const SettingsView(),
    );
  }
}
