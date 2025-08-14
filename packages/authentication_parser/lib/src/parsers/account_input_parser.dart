import 'package:html/dom.dart';

class AccountInputParser {
  const AccountInputParser();

  Element? parse(Document document) {
    final input = document.querySelector('input[name="acct"]');
    return input;
  }
}
