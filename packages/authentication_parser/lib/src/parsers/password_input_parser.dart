import 'package:html/dom.dart';

class PasswordInputParser {
  const PasswordInputParser();

  Element? parse(Document document) {
    final element = document.querySelector('input[name="pw"]');
    return element;
  }
}
