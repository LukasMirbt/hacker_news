import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/login/login.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String from,
    @Default(LoginFormModel()) LoginFormModel form,
  }) = _LoginState;
}
