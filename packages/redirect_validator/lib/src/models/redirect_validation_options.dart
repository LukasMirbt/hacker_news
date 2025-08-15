import 'package:redirect_validator/redirect_validator.dart';

class RedirectValidationOptions extends Options {
  RedirectValidationOptions({super.contentType});

  static const extraKey = 'validate_redirect';

  @override
  Map<String, dynamic> get extra => {extraKey: true};
}
