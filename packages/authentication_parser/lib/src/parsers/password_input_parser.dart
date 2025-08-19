import 'package:html/dom.dart';

class PasswordInputParser {
  const PasswordInputParser();

  Element? parse(Document document) {
    final input = document.querySelector('input[name="pw"]');
    return input;
  }
}
