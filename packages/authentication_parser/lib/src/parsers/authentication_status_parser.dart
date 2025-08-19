import 'package:authentication_parser/authentication_parser.dart';

class AuthenticationStatusParser {
  const AuthenticationStatusParser({
    HtmlParser? htmlParser,
    UserParser? userParser,
    LoginLinkParser? loginLinkParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _userParser = userParser ?? const UserParser(),
       _loginLinkParser = loginLinkParser ?? const LoginLinkParser();

  final HtmlParser _htmlParser;
  final UserParser _userParser;
  final LoginLinkParser _loginLinkParser;

  AuthenticationStatus parse(String html) {
    final document = _htmlParser.parse(html);

    final user = _userParser.parse(document);
    if (user != null) return Authenticated(user);

    final loginLink = _loginLinkParser.parse(document);
    if (loginLink != null) return const Unauthenticated();

    return const Unknown();
  }
}
