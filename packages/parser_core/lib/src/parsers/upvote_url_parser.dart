import 'package:html/dom.dart';

class UpvoteUrlParser {
  const UpvoteUrlParser();

  String? parse(Element element) {
    final anchor = element.querySelector('.votelinks a');
    if (anchor == null) return null;
    return anchor.attributes['href'];
  }
}
