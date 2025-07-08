import 'package:app_client/app_client.dart';

class RedirectValidationOptions extends Options {
  RedirectValidationOptions({super.contentType});

  static const extraKey = 'validate_redirect';

  @override
  Map<String, dynamic> get extra => {extraKey: true};
}
