import 'package:authentication_parser/authentication_parser.dart';

class AuthenticationStatusParser {
  const AuthenticationStatusParser({
    UserParser? userParser,
    HasLoginLinkParser? hasLoginLinkParser,
  }) : _userParser = userParser ?? const UserParser(),
       _hasLoginLinkParser = hasLoginLinkParser ?? const HasLoginLinkParser();

  final UserParser _userParser;
  final HasLoginLinkParser _hasLoginLinkParser;

  AuthenticationStatus parse(Document document) {
    final user = _userParser.parse(document);

    if (user != null) {
      return Authenticated(user);
    }

    final hasLoginLink = _hasLoginLinkParser.parse(document);
    if (hasLoginLink) return const Unauthenticated();

    return const Unknown();
  }
}
