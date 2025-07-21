import 'package:html/dom.dart';

class DetailHtmlTextParser {
  const DetailHtmlTextParser();

  String? parse(Element item) {
    final div = item.querySelector('.toptext');
    if (div == null) return null;

    final innerHtml = div.innerHtml;
    if (innerHtml.isEmpty) return null;

    return innerHtml;
  }
}
