import 'package:html/dom.dart';

class TitleParser {
  const TitleParser();

  String? parse(Element element) {
    final anchor = element.querySelector('.titleline a');
    if (anchor == null) return null;
    return anchor.text;
  }
}
