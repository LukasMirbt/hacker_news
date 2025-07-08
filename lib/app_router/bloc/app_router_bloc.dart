import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';

class AppRouterBloc extends Bloc<AppRouterEvent, AppRouterState> {
  AppRouterBloc()
    : super(
        AppRouterState.initial(),
      ) {
    on<AppRouterLocationChanged>(_onLocationChanged);
  }

  void _onLocationChanged(
    AppRouterLocationChanged event,
    Emitter<AppRouterState> emit,
  ) {
    emit(
      state.copyWith(
        history: [
          ...state.history,
          event.matchedLocation,
        ],
      ),
    );
  }
}
