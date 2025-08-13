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
    this.html,
    WebLinks webLinks = const WebLinks(),
  }) : url = webLinks.resolve(
         url.toString(),
       );

  factory WebRedirect.from(
    String urlString, {
    String? html,
  }) {
    return WebRedirect(
      url: Uri.parse(urlString),
      html: html,
    );
  }

  final Uri url;
  final String? html;

  String get urlString => url.toString();
}
