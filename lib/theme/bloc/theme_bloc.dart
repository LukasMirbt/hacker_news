import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:settings_storage/settings_storage.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required SettingsStorage settingsStorage,
  }) : _storage = settingsStorage,
       super(const ThemeState()) {
    on<ThemeOptionPressed>(_onOptionPressed);
  }

  final SettingsStorage _storage;

  void _onOptionPressed(
    ThemeOptionPressed event,
    Emitter<ThemeState> emit,
  ) {
    final mode = event.mode;

    emit(
      state.copyWith(
        mode: mode,
      ),
    );

    _storage.writeThemeMode(mode);
  }
}
