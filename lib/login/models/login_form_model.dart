import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

part 'login_form_model.freezed.dart';

enum LoginStatus {
  initial,
  invalid,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class LoginFormModel with _$LoginFormModel {
  const factory LoginFormModel({
    @Default(LoginStatus.initial) LoginStatus status,
    @Default(Username()) Username username,
    @Default(Password()) Password password,
    @Default(true) bool obscurePassword,
  }) = _LoginFormModel;

  const LoginFormModel._();

  bool get isValid => username.isValid && password.isValid;
  bool get isLoading => status.isLoading || status.isSuccess;

  String? usernameErrorText(AppLocalizations l10n) => switch (status) {
    LoginStatus.invalid => username.validationErrorText(l10n),
    LoginStatus.failure => l10n.generalServerError,
    _ => null,
  };

  String? passwordErrorText(AppLocalizations l10n) => switch (status) {
    LoginStatus.invalid => password.validationErrorText(l10n),
    LoginStatus.failure => l10n.generalServerError,
    _ => null,
  };
}
