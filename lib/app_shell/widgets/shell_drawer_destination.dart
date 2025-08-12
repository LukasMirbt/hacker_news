import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class ShellDrawerDestination extends NavigationDrawerDestination {
  ShellDrawerDestination({
    required this.data,
    super.key,
  }) : super(
         icon: AppIcon(data.icon),
         selectedIcon: AppIcon.filled(data.icon),
         label: Text(data.label),
       );

  final DestinationData data;
}
