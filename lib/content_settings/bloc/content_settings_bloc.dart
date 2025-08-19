import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:link_launcher/link_launcher.dart';

class ContentSettingsBloc
    extends Bloc<ContentSettingsEvent, ContentSettingsState> {
  ContentSettingsBloc({
    required LinkLauncher linkLauncher,
  }) : _launcher = linkLauncher,
       super(
         ContentSettingsState(
           linkLaunchMode: linkLauncher.launchMode,
         ),
       ) {
    on<ContentSettingsLinkLaunchModeChanged>(_onLinkLaunchModeChanged);
  }

  final LinkLauncher _launcher;

  void _onLinkLaunchModeChanged(
    ContentSettingsLinkLaunchModeChanged event,
    Emitter<ContentSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        linkLaunchMode: event.mode,
      ),
    );

    _launcher.setLaunchMode(event.mode);
  }
}
