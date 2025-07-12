import 'package:equatable/equatable.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

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
      UsernameValidationError.empty => l10n.createAccount_usernameEmptyError,
    };
  }

  @override
  List<Object> get props => [
    value,
    _validator,
  ];
}
