import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginPasswordVisibilityToggled extends LoginEvent {
  const LoginPasswordVisibilityToggled();
}

final class LoginTermsPressed extends LoginEvent {
  const LoginTermsPressed();
}

final class LoginPrivacyPolicyPressed extends LoginEvent {
  const LoginPrivacyPolicyPressed();
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
