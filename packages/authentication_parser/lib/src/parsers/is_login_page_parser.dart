import 'package:html/dom.dart';

class IsLoginPageParser {
  const IsLoginPageParser();

  bool parse(Document document) {
    final acctInput = document.querySelector('input[name="acct"]');
    final pwInput = document.querySelector('input[name="pw"]');
    return acctInput != null && pwInput != null;
  }
}
