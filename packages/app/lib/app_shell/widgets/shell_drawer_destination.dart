import 'package:app/app_shell/app_shell.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
