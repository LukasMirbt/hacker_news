import 'package:app/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_storage/settings_storage.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required SettingsStorage settingsStorage,
  }) : _storage = settingsStorage,
       super(
         AppState(
           isAnalyticsConsentCompleted: settingsStorage
               .readAnalyticsConsentCompleted(),
         ),
       ) {
    on<AppAnalyticsConsentCompleted>(_onAnalyticsConsentCompleted);
  }

  final SettingsStorage _storage;

  void _onAnalyticsConsentCompleted(
    AppAnalyticsConsentCompleted event,
    Emitter<AppState> emit,
  ) {
    const completed = true;

    emit(
      state.copyWith(
        isAnalyticsConsentCompleted: completed,
      ),
    );

    _storage.writeAnalyticsConsentCompleted(
      completed: completed,
    );
  }
}
