enum UsernameValidationError { empty }

class UsernameValidator {
  const UsernameValidator();

  UsernameValidationError? validate(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}
