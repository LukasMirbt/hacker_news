import 'package:hacker_client/app/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppAnalyticsConsentCompleted>(_onAnalyticsConsentCompleted);
  }

  void _onAnalyticsConsentCompleted(
    AppAnalyticsConsentCompleted event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        status: AppStatus.home,
      ),
    );
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}
