import 'package:web_links/web_links.dart';

sealed class Redirect {
  const Redirect();
}

class LoginRedirect extends Redirect {
  LoginRedirect();

  const LoginRedirect._();

  static const initial = LoginRedirect._();
}

class WebRedirect extends Redirect {
  WebRedirect({
    required Uri url,
    WebLinks webLinks = const WebLinks(),
  }) : url = webLinks.resolve(
         url.toString(),
       );

  factory WebRedirect.from(String urlString) {
    return WebRedirect(
      url: Uri.parse(urlString),
    );
  }

  final Uri url;

  String get urlString => url.toString();
}
