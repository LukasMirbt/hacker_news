import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app/app.dart';
import 'package:settings_storage/settings_storage.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required SettingsStorage settingsStorage,
  }) : _storage = settingsStorage,
       super(
         AppState(
           isAnalyticsConsentCompleted: settingsStorage
               .readIsAnalyticsConsentCompleted(),
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

    _storage.writeIsAnalyticsConsentCompleted(
      completed: completed,
    );
  }
}
