import 'package:app_client/app_client.dart' hide AuthenticationStatus;
import 'package:authentication_parser/authentication_parser.dart';

class AuthenticationService {
  const AuthenticationService({
    required AppClient appClient,
    HtmlParser? htmlParser,
    AuthenticationStatusParser? authenticationStatusParser,
  }) : _client = appClient,
       _htmlParser = htmlParser ?? const HtmlParser(),
       _statusParser =
           authenticationStatusParser ?? const AuthenticationStatusParser();

  final AppClient _client;
  final HtmlParser _htmlParser;
  final AuthenticationStatusParser _statusParser;

  void update(String html) {
    final document = _htmlParser.parse(html);
    final status = _statusParser.parse(document);

    switch (status) {
      case Authenticated(:final user):
        _client.authenticate(
          User.fromData(user),
        );
      case Unauthenticated():
        _client.unauthenticate();
      case Unknown():
        break;
    }
  }
}
