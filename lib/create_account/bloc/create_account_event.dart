import 'package:equatable/equatable.dart';

sealed class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

final class CreateAccountUsernameChanged extends CreateAccountEvent {
  const CreateAccountUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class CreateAccountPasswordChanged extends CreateAccountEvent {
  const CreateAccountPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class CreateAccountPasswordVisibilityToggled extends CreateAccountEvent {
  const CreateAccountPasswordVisibilityToggled();
}

final class CreateAccountTermsPressed extends CreateAccountEvent {
  const CreateAccountTermsPressed();
}

final class CreateAccountPrivacyPolicyPressed extends CreateAccountEvent {
  const CreateAccountPrivacyPolicyPressed();
}

final class CreateAccountSubmitted extends CreateAccountEvent {
  const CreateAccountSubmitted();
}
