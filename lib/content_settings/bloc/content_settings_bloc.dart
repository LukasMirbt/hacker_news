import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/content_settings/content_settings.dart';

class ContentSettingsBloc
    extends Bloc<ContentSettingsEvent, ContentSettingsState> {
  ContentSettingsBloc() : super(const ContentSettingsState()) {
    on<ContentSettingsLinkLaunchModeChanged>(_onLinkLaunchModeChanged);
  }

  void _onLinkLaunchModeChanged(
    ContentSettingsLinkLaunchModeChanged event,
    Emitter<ContentSettingsState> emit,
  ) {
    emit(
      state.copyWith(
        linkLaunchMode: event.mode,
      ),
    );
  }
}
