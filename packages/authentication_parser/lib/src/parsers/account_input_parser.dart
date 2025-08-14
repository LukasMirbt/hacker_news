import 'package:html/dom.dart';

class AccountInputParser {
  const AccountInputParser();

  Element? parse(Document document) {
    final element = document.querySelector('input[name="acct"]');
    return element;
  }
}
