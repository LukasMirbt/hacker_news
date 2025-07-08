import 'package:html/dom.dart';

class UserIdParser {
  const UserIdParser();

  String? parse(Document document) {
    final element = document.getElementById('me');
    if (element == null) return null;
    return element.text;
  }
}
