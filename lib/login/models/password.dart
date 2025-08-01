import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class Password extends Equatable {
  const Password([
    this.value = '',
    this._validator = const PasswordValidator(),
  ]);

  final String value;
  final PasswordValidator _validator;

  bool get isValid => _validator.validate(value) == null;

  String? validationErrorText(AppLocalizations l10n) {
    final error = _validator.validate(value);
    if (error == null) return null;

    return switch (error) {
      PasswordValidationError.empty => l10n.login_passwordEmptyError,
    };
  }

  @override
  List<Object> get props => [
    value,
    _validator,
  ];
}
