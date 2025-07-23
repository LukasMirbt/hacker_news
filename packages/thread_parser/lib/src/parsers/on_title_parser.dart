import 'package:html/dom.dart';

class OnTitleParser {
  const OnTitleParser();

  String? parse(Element athing) {
    final anchor = athing.querySelector('.onstory a');
    if (anchor == null) return null;
    return anchor.attributes['title'];
  }
}
