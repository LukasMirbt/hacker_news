import 'package:authentication_parser/authentication_parser.dart';

class AuthenticationStatusParser {
  const AuthenticationStatusParser({
    UserIdParser? userIdParser,
    HasLoginLinkParser? hasLoginLinkParser,
  }) : _userIdParser = userIdParser ?? const UserIdParser(),
       _hasLoginLinkParser = hasLoginLinkParser ?? const HasLoginLinkParser();

  final UserIdParser _userIdParser;
  final HasLoginLinkParser _hasLoginLinkParser;

  AuthenticationStatus parse(Document document) {
    final userId = _userIdParser.parse(document);

    if (userId != null) {
      return Authenticated(userId);
    }

    final hasLoginLink = _hasLoginLinkParser.parse(document);
    if (hasLoginLink) return const Unauthenticated();

    return const Unknown();
  }
}
