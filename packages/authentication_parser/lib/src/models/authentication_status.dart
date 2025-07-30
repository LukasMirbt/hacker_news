import 'package:authentication_parser/authentication_parser.dart';
import 'package:equatable/equatable.dart';

sealed class AuthenticationStatus extends Equatable {
  const AuthenticationStatus();

  @override
  List<Object> get props => [];
}

final class Unknown extends AuthenticationStatus {
  const Unknown();
}

final class Unauthenticated extends AuthenticationStatus {
  const Unauthenticated();
}

final class Authenticated extends AuthenticationStatus {
  const Authenticated(this.user);

  final UserData user;

  @override
  List<Object> get props => [user];
}
