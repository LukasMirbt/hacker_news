// ignore_for_file: annotate_overrides

import 'package:app_client/app_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState({
    required this.baseUrl,
    this.redirect = LoginRedirect.initial,
    this.status = AuthenticationStatus.initial,
  });

  final Uri baseUrl;
  final Redirect redirect;
  final AuthenticationStatus status;
}
