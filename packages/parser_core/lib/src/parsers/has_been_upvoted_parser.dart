import 'package:html/dom.dart';

class HasBeenUpvotedParser {
  const HasBeenUpvotedParser();

  bool? parse(Element element) {
    final anchor = element.querySelector('.votelinks a');
    if (anchor == null) return null;
    final hasBeenUpvoted = anchor.className.contains('nosee');
    return hasBeenUpvoted;
  }
}
