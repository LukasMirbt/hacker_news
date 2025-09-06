import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required User user,
    required LoginRedirect loginRedirect,
    required WebRedirect webRedirect,
    required AuthenticationStatus status,
  }) = _AuthenticationState;
}
