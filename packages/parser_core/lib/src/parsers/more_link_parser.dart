import 'package:html/dom.dart';

class MoreLinkParser {
  const MoreLinkParser();

  String? parse(Document document) {
    final anchor = document.querySelector('.morelink');
    if (anchor == null) return null;
    return anchor.attributes['href'];
  }
}
