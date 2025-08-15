import 'package:authentication_parser/authentication_parser.dart';

class IsLoginPageParser {
  const IsLoginPageParser({
    HtmlParser? htmlParser,
    AccountInputParser? accountInputParser,
    PasswordInputParser? passwordInputParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _accountInputParser = accountInputParser ?? const AccountInputParser(),
       _passwordInputParser =
           passwordInputParser ?? const PasswordInputParser();

  final HtmlParser _htmlParser;
  final AccountInputParser _accountInputParser;
  final PasswordInputParser _passwordInputParser;

  bool parse(String html) {
    final document = _htmlParser.parse(html);
    final accountInput = _accountInputParser.parse(document);
    final passwordInput = _passwordInputParser.parse(document);
    return accountInput != null && passwordInput != null;
  }
}
