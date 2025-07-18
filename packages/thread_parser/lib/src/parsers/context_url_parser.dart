import 'package:collection/collection.dart';
import 'package:html/dom.dart';

class ContextUrlParser {
  const ContextUrlParser();

  String? parse(Element athing) {
    final navsElement = athing.querySelector('.navs');
    if (navsElement == null) return null;

    final anchors = navsElement.querySelectorAll('a');

    final contextAnchor = anchors.firstWhereOrNull(
      (athing) => athing.text.contains('context'),
    );
    if (contextAnchor == null) return null;

    return contextAnchor.attributes['href'];
  }
}
