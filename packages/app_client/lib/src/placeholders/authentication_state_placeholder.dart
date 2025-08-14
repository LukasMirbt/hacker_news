import 'package:app_client/app_client.dart';

class AuthenticationStatePlaceholder extends AuthenticationState {
  AuthenticationStatePlaceholder({
    Uri? baseUrl,
    WebRedirect? webRedirect,
    super.loginRedirect,
    super.user,
    super.status,
  }) : super(
         baseUrl: baseUrl ?? Uri.parse('https://example.com'),
         webRedirect: webRedirect ?? WebRedirect.empty,
       );
}
