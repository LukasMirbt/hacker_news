import 'package:collection/collection.dart';
import 'package:html/dom.dart';

class LoginLinkParser {
  const LoginLinkParser();

  Element? parse(Document document) {
    final topLinks = document.querySelectorAll('.pagetop a');

    final loginLink = topLinks.firstWhereOrNull(
      (element) => element.text == 'login',
    );

    return loginLink;
  }
}
