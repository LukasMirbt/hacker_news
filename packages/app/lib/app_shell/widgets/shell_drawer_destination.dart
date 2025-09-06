import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ShellDrawerDestination extends NavigationDrawerDestination {
  ShellDrawerDestination({
    required this.destination,
    required DestinationData data,
    super.key,
  }) : super(
         icon: AppIcon(data.icon),
         selectedIcon: AppIcon.filled(data.icon),
         label: Text(data.label),
       );

  factory ShellDrawerDestination.from({
    required AppDestination destination,
    required AppLocalizations l10n,
  }) {
    return ShellDrawerDestination(
      destination: destination,
      data: ShellDrawerModel(destination).data(l10n),
    );
  }

  final AppDestination destination;
}
