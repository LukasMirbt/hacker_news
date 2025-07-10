import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/app/app.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus status,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
