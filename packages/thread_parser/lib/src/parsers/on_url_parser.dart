import 'package:html/dom.dart';

class OnUrlParser {
  const OnUrlParser();

  String? parse(Element athing) {
    final anchor = athing.querySelector('.onstory a');
    if (anchor == null) return null;
    return anchor.attributes['href'];
  }
}
