import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:equatable/equatable.dart';

class Username extends Equatable {
  const Username([
    this.value = '',
    this._validator = const UsernameValidator(),
  ]);

  final String value;
  final UsernameValidator _validator;

  bool get isValid => _validator.validate(value) == null;

  String? validationErrorText(AppLocalizations l10n) {
    final error = _validator.validate(value);
    if (error == null) return null;

    return switch (error) {
      UsernameValidationError.empty => l10n.login_usernameEmptyError,
    };
  }

  @override
  List<Object> get props => [
    value,
    _validator,
  ];
}
