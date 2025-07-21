import 'package:html/dom.dart';

class ReplyUrlParser {
  const ReplyUrlParser();

  String? parse(Element element) {
    final anchor = element.querySelector('.reply a');
    if (anchor == null) return null;
    return anchor.attributes['href'];
  }
}
