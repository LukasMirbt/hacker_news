import 'package:hacker_client/theme/theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeOptionPressed>(_onOptionPressed);
  }

  void _onOptionPressed(
    ThemeOptionPressed event,
    Emitter<ThemeState> emit,
  ) {
    emit(
      state.copyWith(
        mode: event.mode,
      ),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
