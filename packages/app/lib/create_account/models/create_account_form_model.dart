import 'package:app/create_account/create_account.dart';
import 'package:app/l10n/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_form_model.freezed.dart';

enum CreateAccountStatus {
  initial,
  invalid,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class CreateAccountFormModel with _$CreateAccountFormModel {
  const factory CreateAccountFormModel({
    @Default(CreateAccountStatus.initial) CreateAccountStatus status,
    @Default(Username()) Username username,
    @Default(Password()) Password password,
    @Default(true) bool obscurePassword,
  }) = _CreateAccountFormModel;

  const CreateAccountFormModel._();

  bool get isValid => username.isValid && password.isValid;
  bool get isLoading => status.isLoading || status.isSuccess;

  String? usernameErrorText(AppLocalizations l10n) => switch (status) {
    CreateAccountStatus.invalid => username.validationErrorText(l10n),
    CreateAccountStatus.failure => l10n.generalServerError,
    _ => null,
  };

  String? passwordErrorText(AppLocalizations l10n) => switch (status) {
    CreateAccountStatus.invalid => password.validationErrorText(l10n),
    CreateAccountStatus.failure => l10n.generalServerError,
    _ => null,
  };
}
