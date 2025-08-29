import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:equatable/equatable.dart';

class ShellAppBarModel extends Equatable {
  const ShellAppBarModel(this._destination);

  final AppDestination _destination;

  bool get hasBorder {
    return switch (_destination) {
      AppDestination.home => true,
      AppDestination.search => true,
      _ => false,
    };
  }

  String? title(AppLocalizations l10n) {
    return switch (_destination) {
      AppDestination.home => null,
      AppDestination.search => l10n.appShell_search,
      AppDestination.threads => l10n.appShell_threads,
      AppDestination.drafts => l10n.appShell_drafts,
      AppDestination.settings => l10n.appShell_settings,
    };
  }

  @override
  List<Object> get props => [_destination];
}
