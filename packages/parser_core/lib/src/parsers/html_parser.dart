import 'package:html/dom.dart';

class HtmlParser {
  const HtmlParser();

  Document parse(String html) => Document.html(html);
}
