import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:link_launcher/link_launcher.dart';

class SettingsBloc extends Bloc<SettingsEvent, void> {
  SettingsBloc({
    LinkLauncher? linkLauncher,
  }) : _launcher = linkLauncher ?? const LinkLauncher(),
       super(null) {
    on<SettingsPrivacyPolicyPressed>(_onPrivacyPolicyPressed);
  }

  final LinkLauncher _launcher;

  void _onPrivacyPolicyPressed(
    SettingsPrivacyPolicyPressed event,
    Emitter<void> emit,
  ) {
    _launcher.launch(yapPrivacyPolicyLink);
  }
}
