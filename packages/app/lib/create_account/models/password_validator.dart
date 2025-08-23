enum PasswordValidationError { empty }

class PasswordValidator {
  const PasswordValidator();

  PasswordValidationError? validate(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return null;
  }
}
