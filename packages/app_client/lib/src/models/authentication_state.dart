import 'package:app_client/app_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(User.empty) User user,
    @Default(LoginRedirect.initial) Redirect redirect,
    @Default(AuthenticationStatus.unknown) AuthenticationStatus status,
  }) = _AuthenticationState;
}
