import 'package:html/dom.dart';

class CommentHtmlTextParser {
  const CommentHtmlTextParser();

  String? parse(Element element) {
    final commtextElement = element.querySelector('.commtext');
    if (commtextElement == null) return null;
    return commtextElement.innerHtml;
  }
}
