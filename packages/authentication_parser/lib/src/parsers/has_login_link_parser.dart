import 'package:html/dom.dart';

class HasLoginLinkParser {
  const HasLoginLinkParser();

  bool parse(Document document) {
    final topLinks = document.querySelectorAll('.pagetop a');

    for (final link in topLinks) {
      if (link.text == 'login') return true;
    }

    return false;
  }
}
