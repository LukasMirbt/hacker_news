import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String from,
    @Default(LoginStatus.initial) LoginStatus status,
    @Default('') String username,
    @Default('') String password,
    @Default(true) bool obscurePassword,
  }) = _LoginState;

  const LoginState._();

  bool get isLoading => status.isLoading || status.isSuccess;
}
