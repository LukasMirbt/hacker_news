import 'package:flutter/material.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class ShellDrawerDestination extends NavigationDrawerDestination {
  ShellDrawerDestination({
    required this.data,
    super.key,
  }) : super(
         icon: Icon(data.icon),
         selectedIcon: Icon(data.selectedIcon),
         label: Text(data.label),
       );

  final DestinationData data;
}
