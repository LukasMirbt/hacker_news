import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

enum LogoutStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
}

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required User user,
    required Redirect redirect,
    required AuthenticationStatus status,
    @Default(LogoutStatus.initial) LogoutStatus logoutStatus,
  }) = _AuthenticationState;
}
