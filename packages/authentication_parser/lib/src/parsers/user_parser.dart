import 'package:authentication_parser/authentication_parser.dart';

class UserParser {
  const UserParser({
    UserIdParser? userIdParser,
    ProfileUrlParser? profileUrlParser,
    KarmaParser? karmaParser,
    LogoutUrlParser? logoutUrlParser,
  }) : _userIdParser = userIdParser ?? const UserIdParser(),
       _profileUrlParser = profileUrlParser ?? const ProfileUrlParser(),
       _karmaParser = karmaParser ?? const KarmaParser(),
       _logoutUrlParser = logoutUrlParser ?? const LogoutUrlParser();

  final UserIdParser _userIdParser;
  final ProfileUrlParser _profileUrlParser;
  final KarmaParser _karmaParser;
  final LogoutUrlParser _logoutUrlParser;

  UserData? parse(Document document) {
    final id = _userIdParser.parse(document);
    if (id == null) return null;

    final profileUrl = _profileUrlParser.parse(document);
    final karma = _karmaParser.parse(document);
    final logoutUrl = _logoutUrlParser.parse(document);

    return UserData.fromParsed(
      id: id,
      karma: karma,
      profileUrl: profileUrl,
      logoutUrl: logoutUrl,
    );
  }
}
