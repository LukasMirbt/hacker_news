// ignore_for_file: annotate_overrides

import 'package:app_client/app_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState({
    required this.baseUrl,
    required this.webRedirect,
    this.loginRedirect = LoginRedirect.initial,
    this.user = User.empty,
    this.status = AuthenticationStatus.initial,
  });

  factory AuthenticationState.initial({required Uri baseUrl}) {
    return AuthenticationState(
      baseUrl: baseUrl,
      webRedirect: WebRedirect.empty,
    );
  }

  final Uri baseUrl;
  final WebRedirect webRedirect;
  final LoginRedirect loginRedirect;
  final User user;
  final AuthenticationStatus status;
}
