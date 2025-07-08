import 'package:html/dom.dart';

class UrlHostParser {
  const UrlHostParser();

  String? parse(Element item) {
    final span = item.querySelector('.sitestr');
    if (span == null) return null;
    return span.text;
  }
}
