import 'package:equatable/equatable.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {
  const AuthenticationSubscriptionRequested();
}

final class AuthenticationLogoutPressed extends AuthenticationEvent {
  const AuthenticationLogoutPressed();
}
