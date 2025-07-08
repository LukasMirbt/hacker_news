import 'package:html/dom.dart';

class LogoutUrlParser {
  const LogoutUrlParser();

  String? parse(Document document) {
    final element = document.getElementById('logout');
    if (element == null) return null;
    return element.attributes['href'];
  }
}
