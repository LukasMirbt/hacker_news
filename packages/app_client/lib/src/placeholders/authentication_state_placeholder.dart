import 'package:app_client/app_client.dart';

class AuthenticationStatePlaceholder extends AuthenticationState {
  AuthenticationStatePlaceholder({
    Uri? baseUrl,
    super.user,
    super.redirect,
    super.status,
  }) : super(
         baseUrl: baseUrl ?? Uri.parse('https://example.com'),
       );
}
