import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';

class ShellDrawerModel extends Equatable {
  const ShellDrawerModel(this._destination);

  final AppDestination _destination;

  int get selectedIndex => _destination.index;

  DestinationData data(AppLocalizations l10n) {
    return switch (_destination) {
      AppDestination.home => DestinationData(
        icon: Symbols.home_rounded,
        label: l10n.appShell_home,
      ),
      AppDestination.search => DestinationData(
        icon: Symbols.search_rounded,
        label: l10n.appShell_search,
      ),
      AppDestination.threads => DestinationData(
        icon: Symbols.forum_rounded,
        label: l10n.appShell_threads,
      ),
      AppDestination.drafts => DestinationData(
        icon: Symbols.drafts_rounded,
        label: l10n.appShell_drafts,
      ),
      AppDestination.settings => DestinationData(
        icon: Symbols.settings_rounded,
        label: l10n.appShell_settings,
      ),
    };
  }

  @override
  List<Object> get props => [_destination];
}
