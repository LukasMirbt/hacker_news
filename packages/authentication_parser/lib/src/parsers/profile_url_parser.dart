import 'package:html/dom.dart';

class ProfileUrlParser {
  const ProfileUrlParser();

  String? parse(Document document) {
    final element = document.getElementById('me');
    if (element == null) return null;
    return element.attributes['href'];
  }
}
