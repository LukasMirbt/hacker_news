import 'package:app_client/app_client.dart' hide AuthenticationStatus;
import 'package:authentication_parser/authentication_parser.dart';

class RedirectService {
  const RedirectService({
    required AppClient appClient,
    HtmlParser? htmlParser,
    IsLoginPageParser? isLoginPageParser,
  }) : _client = appClient,
       _htmlParser = htmlParser ?? const HtmlParser(),
       _isLoginPageParser = isLoginPageParser ?? const IsLoginPageParser();

  final AppClient _client;
  final HtmlParser _htmlParser;
  final IsLoginPageParser _isLoginPageParser;

  bool shouldRedirect(String html) {
    final document = _htmlParser.parse(html);
    final isLoginPage = _isLoginPageParser.parse(document);
    return isLoginPage;
  }

  void redirectToLogin() {
    _client.redirectToLogin();
  }
}
