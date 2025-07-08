import 'package:html/dom.dart';

class UrlParser {
  const UrlParser();

  String? parse(Element element) {
    final anchor = element.querySelector('.titleline a');
    if (anchor == null) return null;
    return anchor.attributes['href'];
  }
}
